import 'package:gezamarketplace_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const bookingChannel = 'beauty-style-channel';

class ChatEndpoint extends Endpoint {
  @override
  Future<void> streamOpened(StreamingSession session) async {}

  @override
  Future<void> handleStreamMessage(
      StreamingSession session, SerializableEntity message) async {
    if (message is ChatMessageCreateMessage) {
      print(
        'handleStreamMessage ChatMessageCreateMessage $message',
      );

      final newChat = ChatMessage(
          bookingChatId: message.bookingChatId,
          senderId: message.sender.id as int,
          recieverId: message.reciever.id as int,
          sender: message.sender,
          reciever: message.reciever,
          message: message.message,
          dateCreated: DateTime.now());
      session.log('createChatMessage called');

      await ChatMessage.insert(session, newChat);
      final orderChat = await ChatMessage.findSingleRow(
        session,
        where: (chat) =>
            chat.senderId.equals(message.sender.id) &
            chat.recieverId.equals(message.reciever.id) &
            chat.dateCreated.equals(newChat.dateCreated),
      );

      print(
        'handleStreamMessage created ChatMessage $orderChat',
      );
      session.messages.postMessage(
          bookingChannel, OrderChatAppendMessage(chatMessage: orderChat!),
          global: false);
    }
  }

  Future<List<ChatMessage>> getAllChats(
    Session session,
  ) async {
    var all = await ChatMessage.find(session);
    return all;
  }

  Future<List<BookingOrderChat>> getBookingAccountChats(
      Session session, String accountType, int id) async {
    session.log('Get Account Services $id');

    try {
      List<BookingOrderChat> bookingOrderChats;
      if (accountType == 'trader') {
        bookingOrderChats = await BookingOrderChat.find(
          session,
          where: (bookingOrder) => bookingOrder.vendorId.equals(id),
        );
      } else {
        bookingOrderChats = await BookingOrderChat.find(
          session,
          where: (bookingOrder) => bookingOrder.customerId.equals(id),
        );
      }

      session.log('getAccountChats $bookingOrderChats');

      return bookingOrderChats;
    } catch (e) {
      session.log(e.toString());
    }
    return [];
  }

  Future<String?> createChatMessage(
      Session session, ChatMessage newChatMessage) async {
    try {
      session.log('createChatMessage called');
      await ChatMessage.insert(session, newChatMessage);
      final chat = await ChatMessage.findSingleRow(
        session,
        where: (chat) =>
            chat.senderId.equals(newChatMessage.senderId) &
            chat.recieverId.equals(newChatMessage.recieverId),
      );
      return jsonEncode(chat);
    } catch (e) {
      session.log(e.toString());
      return e.toString();
    } finally {}
  }

  Future<ChatMessage?> getChatMessage(Session session, int id) async {
    var result = await ChatMessage.findById(session, id);
    return result;
  }

  Future<bool> updateChatMessage(
      Session session, ChatMessage beautyChatMessage) async {
    try {
      session.log('updateChatMessage called');
      await ChatMessage.update(session, beautyChatMessage);
    } catch (e) {
      session.log(e.toString());
    } finally {}
    return true;
  }

  Future<bool> deleteChatMessage(Session session, int id) async {
    var result =
        await ChatMessage.delete(session, where: (t) => t.id.equals(id));
    return result == 1;
  }
}
