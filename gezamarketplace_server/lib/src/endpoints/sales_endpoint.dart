import 'package:serverpod/serverpod.dart';
import 'package:gezamarketplace_server/src/generated/protocol.dart';

const bookingChannel = 'booking-channel';

class SalesEndpoint extends Endpoint {
  @override
  Future<void> streamOpened(StreamingSession session) async {
    print('SalesEndpoint stream opened');
    var userId = await session.auth.authenticatedUserId;
    session.log('isSignedIn userId? is $userId');

    var isSignedIn = userId != null;
    session.log('isSignedIn? is $isSignedIn');

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
    try {} catch (e) {
      session.log('catch error $e');
    }
  }

  handleNewSalesOrder(session, message) async {
    try {
      print(
        'handleStream Message  $message',
      );
    } catch (e) {
      session.log('catch error $e');
    }
  }

  Future<String?> createOrder(Session session, SaleOrder order) async {
    try {
      final newSaleOrder = SaleOrder(
        bookingOrderId: order.bookingOrderId,
          orderType: order.orderType,
          orderedItem: order.orderedItem,
          orderBookedTime: order.orderBookedTime,
          orderBookedDate: order.orderBookedDate,
          customer: order.customer,
          orderingFor: order.orderingFor,
          vendor: order.vendor,
          customerId: order.customerId,
          vendorId: order.vendorId);

      await SaleOrder.insert(session, newSaleOrder);
      session.log('newSaleOrder created');
      session.messages.postMessage('user_${order.customer.id}', newSaleOrder,
          global: false);
      return '200';
    } catch (e) {
      session.log(e.toString());
      return e.toString();
    } finally {}
  }

  Future<SaleOrder?> getSaleOrder(Session session, int id) async {
    var result = await SaleOrder.findById(session, id);
    return result;
  }

  Future<bool> updateSaleOrder(Session session, SaleOrder saleOrder) async {
    try {
      session.log('updateSaleOrder called');
      // await SaleOrder.update(session, saleOrder);
      await session.db.update(saleOrder);
    } catch (e) {
      session.log(e.toString());
    } finally {}
    return true;
  }
}
