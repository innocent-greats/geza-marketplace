/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:gezamarketplace_client/src/protocol/booking.dart' as _i3;
import 'package:gezamarketplace_client/src/protocol/booking_order_chat.dart'
    as _i4;
import 'package:gezamarketplace_client/src/protocol/chat_message.dart' as _i5;
import 'package:gezamarketplace_client/src/protocol/persons.dart' as _i6;
import 'package:gezamarketplace_client/src/protocol/product.dart' as _i7;
import 'package:gezamarketplace_client/src/protocol/orders.dart' as _i8;
import 'package:gezamarketplace_client/src/protocol/beauty_style.dart' as _i9;
import 'package:serverpod_auth_client/module.dart' as _i10;
import 'package:serverpod_chat_client/module.dart' as _i11;
import 'dart:io' as _i12;
import 'protocol.dart' as _i13;

class _EndpointBooking extends _i1.EndpointRef {
  _EndpointBooking(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'booking';

  _i2.Future<List<_i3.BookingOrder>> getAllBookingOrders() =>
      caller.callServerEndpoint<List<_i3.BookingOrder>>(
        'booking',
        'getAllBookingOrders',
        {},
      );

  _i2.Future<List<_i3.BookingOrder>> getAccountBookingOrders(
    String accountType,
    int id,
  ) =>
      caller.callServerEndpoint<List<_i3.BookingOrder>>(
        'booking',
        'getAccountBookingOrders',
        {
          'accountType': accountType,
          'id': id,
        },
      );

  _i2.Future<String?> createBookingOrder(_i3.BookingOrder newBookingOrder) =>
      caller.callServerEndpoint<String?>(
        'booking',
        'createBookingOrder',
        {'newBookingOrder': newBookingOrder},
      );

  _i2.Future<_i3.BookingOrder?> getBookingOrder(int id) =>
      caller.callServerEndpoint<_i3.BookingOrder?>(
        'booking',
        'getBookingOrder',
        {'id': id},
      );

  _i2.Future<_i4.BookingOrderChat?> getBookingOrderChat(int id) =>
      caller.callServerEndpoint<_i4.BookingOrderChat?>(
        'booking',
        'getBookingOrderChat',
        {'id': id},
      );

  _i2.Future<bool> updateBookingOrder(_i3.BookingOrder bookingOrder) =>
      caller.callServerEndpoint<bool>(
        'booking',
        'updateBookingOrder',
        {'bookingOrder': bookingOrder},
      );

  _i2.Future<bool> deleteBookingOrder(int id) =>
      caller.callServerEndpoint<bool>(
        'booking',
        'deleteBookingOrder',
        {'id': id},
      );
}

class _EndpointChat extends _i1.EndpointRef {
  _EndpointChat(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'chat';

  _i2.Future<List<_i5.ChatMessage>> getAllChats() =>
      caller.callServerEndpoint<List<_i5.ChatMessage>>(
        'chat',
        'getAllChats',
        {},
      );

  _i2.Future<List<_i4.BookingOrderChat>> getBookingAccountChats(
    String accountType,
    int id,
  ) =>
      caller.callServerEndpoint<List<_i4.BookingOrderChat>>(
        'chat',
        'getBookingAccountChats',
        {
          'accountType': accountType,
          'id': id,
        },
      );

  _i2.Future<String?> createChatMessage(_i5.ChatMessage newChatMessage) =>
      caller.callServerEndpoint<String?>(
        'chat',
        'createChatMessage',
        {'newChatMessage': newChatMessage},
      );

  _i2.Future<_i5.ChatMessage?> getChatMessage(int id) =>
      caller.callServerEndpoint<_i5.ChatMessage?>(
        'chat',
        'getChatMessage',
        {'id': id},
      );

  _i2.Future<bool> updateChatMessage(_i5.ChatMessage beautyChatMessage) =>
      caller.callServerEndpoint<bool>(
        'chat',
        'updateChatMessage',
        {'beautyChatMessage': beautyChatMessage},
      );

  _i2.Future<bool> deleteChatMessage(int id) => caller.callServerEndpoint<bool>(
        'chat',
        'deleteChatMessage',
        {'id': id},
      );
}

class _EndpointExample extends _i1.EndpointRef {
  _EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );

  _i2.Future<String> subscribeToFirefly() => caller.callServerEndpoint<String>(
        'example',
        'subscribeToFirefly',
        {},
      );
}

class _EndpointPerson extends _i1.EndpointRef {
  _EndpointPerson(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'person';

  _i2.Future<List<_i6.Person>> getAllPersons() =>
      caller.callServerEndpoint<List<_i6.Person>>(
        'person',
        'getAllPersons',
        {},
      );

  _i2.Future<String?> handleSignUp(_i6.Person person) =>
      caller.callServerEndpoint<String?>(
        'person',
        'handleSignUp',
        {'person': person},
      );

  _i2.Future<String?> getUserAccount(int id) =>
      caller.callServerEndpoint<String?>(
        'person',
        'getUserAccount',
        {'id': id},
      );

  _i2.Future<_i6.Person?> getPerson(int id) =>
      caller.callServerEndpoint<_i6.Person?>(
        'person',
        'getPerson',
        {'id': id},
      );

  _i2.Future<bool> updatePerson(_i6.Person person) =>
      caller.callServerEndpoint<bool>(
        'person',
        'updatePerson',
        {'person': person},
      );

  _i2.Future<bool> deletePerson(int id) => caller.callServerEndpoint<bool>(
        'person',
        'deletePerson',
        {'id': id},
      );
}

class _EndpointProducts extends _i1.EndpointRef {
  _EndpointProducts(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'products';

  _i2.Future<List<_i7.Product>> getAllProducts() =>
      caller.callServerEndpoint<List<_i7.Product>>(
        'products',
        'getAllProducts',
        {},
      );

  _i2.Future<List<_i7.Product>> getAccountProducts(int id) =>
      caller.callServerEndpoint<List<_i7.Product>>(
        'products',
        'getAccountProducts',
        {'id': id},
      );

  _i2.Future<String?> createProduct(_i7.Product beautyProduct) =>
      caller.callServerEndpoint<String?>(
        'products',
        'createProduct',
        {'beautyProduct': beautyProduct},
      );

  _i2.Future<_i7.Product?> getProduct(int id) =>
      caller.callServerEndpoint<_i7.Product?>(
        'products',
        'getProduct',
        {'id': id},
      );

  _i2.Future<bool> updateProduct(_i7.Product beautyProduct) =>
      caller.callServerEndpoint<bool>(
        'products',
        'updateProduct',
        {'beautyProduct': beautyProduct},
      );

  _i2.Future<bool> deleteProduct(int id) => caller.callServerEndpoint<bool>(
        'products',
        'deleteProduct',
        {'id': id},
      );

  _i2.Future<String> pushToChain() => caller.callServerEndpoint<String>(
        'products',
        'pushToChain',
        {},
      );

  _i2.Future<String?> getUploadDescription(String path) =>
      caller.callServerEndpoint<String?>(
        'products',
        'getUploadDescription',
        {'path': path},
      );

  _i2.Future<bool> verifyUpload(String path) => caller.callServerEndpoint<bool>(
        'products',
        'verifyUpload',
        {'path': path},
      );

  _i2.Future<String?> getUploadedFile(String path) =>
      caller.callServerEndpoint<String?>(
        'products',
        'getUploadedFile',
        {'path': path},
      );
}

class _EndpointSales extends _i1.EndpointRef {
  _EndpointSales(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'sales';

  _i2.Future<String?> createOrder(_i8.SaleOrder order) =>
      caller.callServerEndpoint<String?>(
        'sales',
        'createOrder',
        {'order': order},
      );

  _i2.Future<_i8.SaleOrder?> getSaleOrder(int id) =>
      caller.callServerEndpoint<_i8.SaleOrder?>(
        'sales',
        'getSaleOrder',
        {'id': id},
      );

  _i2.Future<bool> updateSaleOrder(_i8.SaleOrder saleOrder) =>
      caller.callServerEndpoint<bool>(
        'sales',
        'updateSaleOrder',
        {'saleOrder': saleOrder},
      );
}

class _EndpointBeautyStyle extends _i1.EndpointRef {
  _EndpointBeautyStyle(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'beautyStyle';

  _i2.Future<List<_i9.BeautyStyle>> getAllBeautyStyles() =>
      caller.callServerEndpoint<List<_i9.BeautyStyle>>(
        'beautyStyle',
        'getAllBeautyStyles',
        {},
      );

  _i2.Future<List<_i9.BeautyStyle>> getAccountBeautyStyles(int id) =>
      caller.callServerEndpoint<List<_i9.BeautyStyle>>(
        'beautyStyle',
        'getAccountBeautyStyles',
        {'id': id},
      );

  _i2.Future<String?> createBeautyStyle(_i9.BeautyStyle beautyBeautyStyle) =>
      caller.callServerEndpoint<String?>(
        'beautyStyle',
        'createBeautyStyle',
        {'beautyBeautyStyle': beautyBeautyStyle},
      );

  _i2.Future<_i9.BeautyStyle?> getBeautyStyle(int id) =>
      caller.callServerEndpoint<_i9.BeautyStyle?>(
        'beautyStyle',
        'getBeautyStyle',
        {'id': id},
      );

  _i2.Future<bool> updateBeautyStyle(_i9.BeautyStyle beautyBeautyStyle) =>
      caller.callServerEndpoint<bool>(
        'beautyStyle',
        'updateBeautyStyle',
        {'beautyBeautyStyle': beautyBeautyStyle},
      );

  _i2.Future<bool> deleteBeautyStyle(int id) => caller.callServerEndpoint<bool>(
        'beautyStyle',
        'deleteBeautyStyle',
        {'id': id},
      );

  _i2.Future<String> pushToChain() => caller.callServerEndpoint<String>(
        'beautyStyle',
        'pushToChain',
        {},
      );

  _i2.Future<String?> getUploadDescription(String path) =>
      caller.callServerEndpoint<String?>(
        'beautyStyle',
        'getUploadDescription',
        {'path': path},
      );

  _i2.Future<bool> verifyUpload(String path) => caller.callServerEndpoint<bool>(
        'beautyStyle',
        'verifyUpload',
        {'path': path},
      );

  _i2.Future<String?> getUploadedFile(String path) =>
      caller.callServerEndpoint<String?>(
        'beautyStyle',
        'getUploadedFile',
        {'path': path},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i10.Caller(client);
    chat = _i11.Caller(client);
  }

  late final _i10.Caller auth;

  late final _i11.Caller chat;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i12.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i13.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    booking = _EndpointBooking(this);
    chat = _EndpointChat(this);
    example = _EndpointExample(this);
    person = _EndpointPerson(this);
    products = _EndpointProducts(this);
    sales = _EndpointSales(this);
    beautyStyle = _EndpointBeautyStyle(this);
    modules = _Modules(this);
  }

  late final _EndpointBooking booking;

  late final _EndpointChat chat;

  late final _EndpointExample example;

  late final _EndpointPerson person;

  late final _EndpointProducts products;

  late final _EndpointSales sales;

  late final _EndpointBeautyStyle beautyStyle;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'booking': booking,
        'chat': chat,
        'example': example,
        'person': person,
        'products': products,
        'sales': sales,
        'beautyStyle': beautyStyle,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {
        'auth': modules.auth,
        'chat': modules.chat,
      };
}
