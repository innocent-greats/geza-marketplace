import 'package:gezamarketplace_server/src/generated/protocol.dart';
import 'package:gezamarketplace_server/src/utils/strings.dart';
import 'package:serverpod/serverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const bookingChannel = 'booking-channel';

class BookingEndpoint extends Endpoint {
  @override
  Future<void> streamOpened(StreamingSession session) async {
    print('BookingOrders stream opened');
    var userId = await session.auth.authenticatedUserId;
    session.log('isSignedIn userId? is $userId');

    var isSignedIn = userId != null;
    session.log('isSignedIn? is $isSignedIn');

    List<BookingOrder> bookingOrders = <BookingOrder>[];
    bookingOrders = await BookingOrder.find(session);
    sendStreamMessage(
        session, BookingOrderStateMessage(bookingOrders: bookingOrders));

    session.messages.addListener(
      'user_${await session.auth.authenticatedUserId}',
      (message) async {
        session.log('user_${await session.auth.authenticatedUserId}');
        session.log('addListener message is $message');
        sendStreamMessage(session, message);
      },
    );
    session.messages.addListener(bookingChannel, (update) {
      sendStreamMessage(session, update);
    });
  }

  @override
  Future<void> handleStreamMessage(
      StreamingSession session, SerializableEntity message) async {
    try {
      if (message is BookingOrderCreateMessage) {
        await handleNewBooking(session, message);
      }

      if (message is BookingMessage) {
        session.log(
            'handleStreamMessage message is BookingMessage ${message.chatMessage.recieverId}');
        var forwardingMessage = AppendBookingMessage(bookingMessage: message);
        session.messages.postMessage(
            'user_${message.chatMessage.recieverId}', forwardingMessage,
            global: false);
      }
    } catch (e) {
      session.log('catch error $e');
    }
  }

  handleNewBooking(session, message) async {
    try {
      print(
        'handleStreamMessage BookingOrderCreateMessage $message',
      );

      final newBookingOrder = BookingOrder(
          customerType: message.customerType,
          vendorId: message.vendorId,
          customerId: message.customerId,
          selectedDate: message.selectedDate,
          selectedTime: message.selectedTime,
          beautyStyleId: message.beautyStyleId,
          dateCreated: DateTime.now());

      await BookingOrder.insert(session, newBookingOrder);
      session.log('createBookingOrder called');

      final bookingOrder = await BookingOrder.findSingleRow(
        session,
        where: (bookingOrder) =>
            bookingOrder.customerId.equals(message.customerId) &
            bookingOrder.vendorId.equals(message.vendorId) &
            bookingOrder.dateCreated.equals(newBookingOrder.dateCreated),
      );

      session.log(
        'handleStreamMessage created BookingOrder $bookingOrder',
      );
      var customer = await Person.findById(session, message.customerId);
      var vendor = await Person.findById(session, message.vendorId);
      var orderedItem =
          await BeautyStyle.findById(session, bookingOrder!.beautyStyleId);

      var newBookingOrderChat = BookingOrderChat(
          orderedItem: orderedItem!,
          chatDate: DateTime.now(),
          orderDate: bookingOrder.dateCreated,
          orderId: bookingOrder.id as int,
          customer: customer!,
          vendor: vendor!,
          customerId: bookingOrder.customerId,
          vendorId: bookingOrder.vendorId,
          messages: []);
      await BookingOrderChat.insert(session, newBookingOrderChat);

      BookingOrderChat? orderChat = await BookingOrderChat.findSingleRow(
          session,
          where: (chat) => chat.orderId.equals(newBookingOrderChat.orderId));
      session.log(
        'handleStreamMessage created orderChat ID::: ${newBookingOrderChat.id}',
      );
      ChatMessage newChat = ChatMessage(
          bookingChatId: orderChat!.id as int,
          senderId: bookingOrder.customerId,
          sender: customer,
          reciever: vendor,
          recieverId: bookingOrder.vendorId,
          message:
              'Customer ${customer.firstName} made a booking for ${orderedItem.name} at ${bookingOrder.selectedDate} , ${bookingOrder.selectedTime} , Please confirm Booking',
          dateCreated: DateTime.now());
      await ChatMessage.insert(session, newChat);

      ChatMessage? chatMessage = await ChatMessage.findSingleRow(session,
          where: (chat) => chat.bookingChatId.equals(orderChat.id));
      session.log(
        'handleStreamMessage created chatMessage $chatMessage',
      );
      BookingMessage newBookingMessage = BookingMessage(
          bookingChatId: orderChat.id as int, chatMessage: chatMessage!);

      await BookingMessage.insert(session, newBookingMessage);

      BookingMessage? createdBookingMessage =
          await BookingMessage.findSingleRow(session,
              where: (bookingMessage) =>
                  bookingMessage.bookingChatId.equals(orderChat.id));
      session.log(
        'handleStreamMessage created createdBookingMessage $createdBookingMessage',
      );
      orderChat.messages = [createdBookingMessage!];
      var update = await session.db.update(orderChat);
      session.log('orderChat updated  $update');
      BookingOrderChat? updatedOrderChat = await BookingOrderChat.findSingleRow(
          session,
          where: (chat) => chat.orderId.equals(orderChat.orderId));

      BookingOrderChatAppendMessage bookingOrderChatAppendMessage =
          BookingOrderChatAppendMessage(bookingOrderChat: updatedOrderChat!);
      session.log(
        'handleStreamMessage created bookingOrderChatAppendMessage $bookingOrderChatAppendMessage',
      );
      session.log('vendor chat $updatedOrderChat');
      session.log('vendor.id user_${vendor.id}');
      session.messages.postMessage(
          'user_${vendor.id}', bookingOrderChatAppendMessage,
          global: false);
    } catch (e) {
      session.log('catch error $e');
    }
  }

  Future<List<BookingOrder>> getAllBookingOrders(
    Session session,
  ) async {
    var all = await BookingOrder.find(session);
    return all;
  }

  Future<List<BookingOrder>> getAccountBookingOrders(
      Session session, String accountType, int id) async {
    session.log('Get Account Services $id');

    try {
      List<BookingOrder> bookingOrders;
      if (accountType == 'trader') {
        bookingOrders = await BookingOrder.find(
          session,
          where: (bookingOrder) => bookingOrder.vendorId.equals(id),
        );
      } else {
        bookingOrders = await BookingOrder.find(
          session,
          where: (bookingOrder) => bookingOrder.customerId.equals(id),
        );
      }

      session.log('getAccountBookingOrders $bookingOrders');

      return bookingOrders;
    } catch (e) {
      session.log(e.toString());
    }
    return [];
  }

  Future<String?> createBookingOrder(
      Session session, BookingOrder newBookingOrder) async {
    try {
      session.log('createBookingOrder called');
      await BookingOrder.insert(session, newBookingOrder);
      final bookingOrder = await BookingOrder.findSingleRow(
        session,
        where: (bookingOrder) =>
            bookingOrder.customerId.equals(newBookingOrder.customerId) &
            bookingOrder.vendorId.equals(newBookingOrder.vendorId),
      );
      return jsonEncode(bookingOrder);
    } catch (e) {
      session.log(e.toString());
      return e.toString();
    } finally {}
  }

  Future<BookingOrder?> getBookingOrder(Session session, int id) async {
    var result = await BookingOrder.findById(session, id);
    return result;
  }

  Future<BookingOrderChat?> getBookingOrderChat(Session session, int id) async {
    var result = await BookingOrderChat.findById(session, id);
    return result;
  }

  Future<bool> updateBookingOrder(
      Session session, BookingOrder bookingOrder) async {
    try {
      session.log('updateBookingOrder called');
      // await BookingOrder.update(session, bookingOrder);
      await session.db.update(bookingOrder);
    } catch (e) {
      session.log(e.toString());
    } finally {}
    return true;
  }

  Future<bool> deleteBookingOrder(Session session, int id) async {
    var result =
        await BookingOrder.delete(session, where: (t) => t.id.equals(id));
    return result == 1;
  }
}
