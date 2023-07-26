/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/booking_endpoint.dart' as _i2;
import '../endpoints/chat_endpoint.dart' as _i3;
import '../endpoints/example_endpoint.dart' as _i4;
import '../endpoints/person_endpoint.dart' as _i5;
import '../endpoints/products_endpoint.dart' as _i6;
import '../endpoints/sales_endpoint.dart' as _i7;
import '../endpoints/styles_endpoint.dart' as _i8;
import 'package:gezamarketplace_server/src/generated/booking.dart' as _i9;
import 'package:gezamarketplace_server/src/generated/chat_message.dart' as _i10;
import 'package:gezamarketplace_server/src/generated/persons.dart' as _i11;
import 'package:gezamarketplace_server/src/generated/product.dart' as _i12;
import 'package:gezamarketplace_server/src/generated/orders.dart' as _i13;
import 'package:gezamarketplace_server/src/generated/beauty_style.dart' as _i14;
import 'package:serverpod_auth_server/module.dart' as _i15;
import 'package:serverpod_chat_server/module.dart' as _i16;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'booking': _i2.BookingEndpoint()
        ..initialize(
          server,
          'booking',
          null,
        ),
      'chat': _i3.ChatEndpoint()
        ..initialize(
          server,
          'chat',
          null,
        ),
      'example': _i4.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'person': _i5.PersonEndpoint()
        ..initialize(
          server,
          'person',
          null,
        ),
      'products': _i6.ProductsEndpoint()
        ..initialize(
          server,
          'products',
          null,
        ),
      'sales': _i7.SalesEndpoint()
        ..initialize(
          server,
          'sales',
          null,
        ),
      'beautyStyle': _i8.BeautyStyleEndpoint()
        ..initialize(
          server,
          'beautyStyle',
          null,
        ),
    };
    connectors['booking'] = _i1.EndpointConnector(
      name: 'booking',
      endpoint: endpoints['booking']!,
      methodConnectors: {
        'getAllBookingOrders': _i1.MethodConnector(
          name: 'getAllBookingOrders',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['booking'] as _i2.BookingEndpoint)
                  .getAllBookingOrders(session),
        ),
        'getAccountBookingOrders': _i1.MethodConnector(
          name: 'getAccountBookingOrders',
          params: {
            'accountType': _i1.ParameterDescription(
              name: 'accountType',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['booking'] as _i2.BookingEndpoint)
                  .getAccountBookingOrders(
            session,
            params['accountType'],
            params['id'],
          ),
        ),
        'createBookingOrder': _i1.MethodConnector(
          name: 'createBookingOrder',
          params: {
            'newBookingOrder': _i1.ParameterDescription(
              name: 'newBookingOrder',
              type: _i1.getType<_i9.BookingOrder>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['booking'] as _i2.BookingEndpoint).createBookingOrder(
            session,
            params['newBookingOrder'],
          ),
        ),
        'getBookingOrder': _i1.MethodConnector(
          name: 'getBookingOrder',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['booking'] as _i2.BookingEndpoint).getBookingOrder(
            session,
            params['id'],
          ),
        ),
        'getBookingOrderChat': _i1.MethodConnector(
          name: 'getBookingOrderChat',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['booking'] as _i2.BookingEndpoint).getBookingOrderChat(
            session,
            params['id'],
          ),
        ),
        'updateBookingOrder': _i1.MethodConnector(
          name: 'updateBookingOrder',
          params: {
            'bookingOrder': _i1.ParameterDescription(
              name: 'bookingOrder',
              type: _i1.getType<_i9.BookingOrder>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['booking'] as _i2.BookingEndpoint).updateBookingOrder(
            session,
            params['bookingOrder'],
          ),
        ),
        'deleteBookingOrder': _i1.MethodConnector(
          name: 'deleteBookingOrder',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['booking'] as _i2.BookingEndpoint).deleteBookingOrder(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['chat'] = _i1.EndpointConnector(
      name: 'chat',
      endpoint: endpoints['chat']!,
      methodConnectors: {
        'getAllChats': _i1.MethodConnector(
          name: 'getAllChats',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chat'] as _i3.ChatEndpoint).getAllChats(session),
        ),
        'getBookingAccountChats': _i1.MethodConnector(
          name: 'getBookingAccountChats',
          params: {
            'accountType': _i1.ParameterDescription(
              name: 'accountType',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chat'] as _i3.ChatEndpoint).getBookingAccountChats(
            session,
            params['accountType'],
            params['id'],
          ),
        ),
        'createChatMessage': _i1.MethodConnector(
          name: 'createChatMessage',
          params: {
            'newChatMessage': _i1.ParameterDescription(
              name: 'newChatMessage',
              type: _i1.getType<_i10.ChatMessage>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chat'] as _i3.ChatEndpoint).createChatMessage(
            session,
            params['newChatMessage'],
          ),
        ),
        'getChatMessage': _i1.MethodConnector(
          name: 'getChatMessage',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chat'] as _i3.ChatEndpoint).getChatMessage(
            session,
            params['id'],
          ),
        ),
        'updateChatMessage': _i1.MethodConnector(
          name: 'updateChatMessage',
          params: {
            'beautyChatMessage': _i1.ParameterDescription(
              name: 'beautyChatMessage',
              type: _i1.getType<_i10.ChatMessage>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chat'] as _i3.ChatEndpoint).updateChatMessage(
            session,
            params['beautyChatMessage'],
          ),
        ),
        'deleteChatMessage': _i1.MethodConnector(
          name: 'deleteChatMessage',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['chat'] as _i3.ChatEndpoint).deleteChatMessage(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i4.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        ),
        'subscribeToFirefly': _i1.MethodConnector(
          name: 'subscribeToFirefly',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i4.ExampleEndpoint)
                  .subscribeToFirefly(session),
        ),
      },
    );
    connectors['person'] = _i1.EndpointConnector(
      name: 'person',
      endpoint: endpoints['person']!,
      methodConnectors: {
        'getAllPersons': _i1.MethodConnector(
          name: 'getAllPersons',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['person'] as _i5.PersonEndpoint)
                  .getAllPersons(session),
        ),
        'handleSignUp': _i1.MethodConnector(
          name: 'handleSignUp',
          params: {
            'person': _i1.ParameterDescription(
              name: 'person',
              type: _i1.getType<_i11.Person>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['person'] as _i5.PersonEndpoint).handleSignUp(
            session,
            params['person'],
          ),
        ),
        'getUserAccount': _i1.MethodConnector(
          name: 'getUserAccount',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['person'] as _i5.PersonEndpoint).getUserAccount(
            session,
            params['id'],
          ),
        ),
        'getPerson': _i1.MethodConnector(
          name: 'getPerson',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['person'] as _i5.PersonEndpoint).getPerson(
            session,
            params['id'],
          ),
        ),
        'updatePerson': _i1.MethodConnector(
          name: 'updatePerson',
          params: {
            'person': _i1.ParameterDescription(
              name: 'person',
              type: _i1.getType<_i11.Person>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['person'] as _i5.PersonEndpoint).updatePerson(
            session,
            params['person'],
          ),
        ),
        'deletePerson': _i1.MethodConnector(
          name: 'deletePerson',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['person'] as _i5.PersonEndpoint).deletePerson(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['products'] = _i1.EndpointConnector(
      name: 'products',
      endpoint: endpoints['products']!,
      methodConnectors: {
        'getAllProducts': _i1.MethodConnector(
          name: 'getAllProducts',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['products'] as _i6.ProductsEndpoint)
                  .getAllProducts(session),
        ),
        'getAccountProducts': _i1.MethodConnector(
          name: 'getAccountProducts',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['products'] as _i6.ProductsEndpoint)
                  .getAccountProducts(
            session,
            params['id'],
          ),
        ),
        'createProduct': _i1.MethodConnector(
          name: 'createProduct',
          params: {
            'beautyProduct': _i1.ParameterDescription(
              name: 'beautyProduct',
              type: _i1.getType<_i12.Product>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['products'] as _i6.ProductsEndpoint).createProduct(
            session,
            params['beautyProduct'],
          ),
        ),
        'getProduct': _i1.MethodConnector(
          name: 'getProduct',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['products'] as _i6.ProductsEndpoint).getProduct(
            session,
            params['id'],
          ),
        ),
        'updateProduct': _i1.MethodConnector(
          name: 'updateProduct',
          params: {
            'beautyProduct': _i1.ParameterDescription(
              name: 'beautyProduct',
              type: _i1.getType<_i12.Product>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['products'] as _i6.ProductsEndpoint).updateProduct(
            session,
            params['beautyProduct'],
          ),
        ),
        'deleteProduct': _i1.MethodConnector(
          name: 'deleteProduct',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['products'] as _i6.ProductsEndpoint).deleteProduct(
            session,
            params['id'],
          ),
        ),
        'pushToChain': _i1.MethodConnector(
          name: 'pushToChain',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['products'] as _i6.ProductsEndpoint)
                  .pushToChain(session),
        ),
        'getUploadDescription': _i1.MethodConnector(
          name: 'getUploadDescription',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['products'] as _i6.ProductsEndpoint)
                  .getUploadDescription(
            session,
            params['path'],
          ),
        ),
        'verifyUpload': _i1.MethodConnector(
          name: 'verifyUpload',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['products'] as _i6.ProductsEndpoint).verifyUpload(
            session,
            params['path'],
          ),
        ),
        'getUploadedFile': _i1.MethodConnector(
          name: 'getUploadedFile',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['products'] as _i6.ProductsEndpoint).getUploadedFile(
            session,
            params['path'],
          ),
        ),
      },
    );
    connectors['sales'] = _i1.EndpointConnector(
      name: 'sales',
      endpoint: endpoints['sales']!,
      methodConnectors: {
        'createOrder': _i1.MethodConnector(
          name: 'createOrder',
          params: {
            'order': _i1.ParameterDescription(
              name: 'order',
              type: _i1.getType<_i13.SaleOrder>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sales'] as _i7.SalesEndpoint).createOrder(
            session,
            params['order'],
          ),
        ),
        'getSaleOrder': _i1.MethodConnector(
          name: 'getSaleOrder',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sales'] as _i7.SalesEndpoint).getSaleOrder(
            session,
            params['id'],
          ),
        ),
        'updateSaleOrder': _i1.MethodConnector(
          name: 'updateSaleOrder',
          params: {
            'saleOrder': _i1.ParameterDescription(
              name: 'saleOrder',
              type: _i1.getType<_i13.SaleOrder>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sales'] as _i7.SalesEndpoint).updateSaleOrder(
            session,
            params['saleOrder'],
          ),
        ),
      },
    );
    connectors['beautyStyle'] = _i1.EndpointConnector(
      name: 'beautyStyle',
      endpoint: endpoints['beautyStyle']!,
      methodConnectors: {
        'getAllBeautyStyles': _i1.MethodConnector(
          name: 'getAllBeautyStyles',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['beautyStyle'] as _i8.BeautyStyleEndpoint)
                  .getAllBeautyStyles(session),
        ),
        'getAccountBeautyStyles': _i1.MethodConnector(
          name: 'getAccountBeautyStyles',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['beautyStyle'] as _i8.BeautyStyleEndpoint)
                  .getAccountBeautyStyles(
            session,
            params['id'],
          ),
        ),
        'createBeautyStyle': _i1.MethodConnector(
          name: 'createBeautyStyle',
          params: {
            'beautyBeautyStyle': _i1.ParameterDescription(
              name: 'beautyBeautyStyle',
              type: _i1.getType<_i14.BeautyStyle>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['beautyStyle'] as _i8.BeautyStyleEndpoint)
                  .createBeautyStyle(
            session,
            params['beautyBeautyStyle'],
          ),
        ),
        'getBeautyStyle': _i1.MethodConnector(
          name: 'getBeautyStyle',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['beautyStyle'] as _i8.BeautyStyleEndpoint)
                  .getBeautyStyle(
            session,
            params['id'],
          ),
        ),
        'updateBeautyStyle': _i1.MethodConnector(
          name: 'updateBeautyStyle',
          params: {
            'beautyBeautyStyle': _i1.ParameterDescription(
              name: 'beautyBeautyStyle',
              type: _i1.getType<_i14.BeautyStyle>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['beautyStyle'] as _i8.BeautyStyleEndpoint)
                  .updateBeautyStyle(
            session,
            params['beautyBeautyStyle'],
          ),
        ),
        'deleteBeautyStyle': _i1.MethodConnector(
          name: 'deleteBeautyStyle',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['beautyStyle'] as _i8.BeautyStyleEndpoint)
                  .deleteBeautyStyle(
            session,
            params['id'],
          ),
        ),
        'pushToChain': _i1.MethodConnector(
          name: 'pushToChain',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['beautyStyle'] as _i8.BeautyStyleEndpoint)
                  .pushToChain(session),
        ),
        'getUploadDescription': _i1.MethodConnector(
          name: 'getUploadDescription',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['beautyStyle'] as _i8.BeautyStyleEndpoint)
                  .getUploadDescription(
            session,
            params['path'],
          ),
        ),
        'verifyUpload': _i1.MethodConnector(
          name: 'verifyUpload',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['beautyStyle'] as _i8.BeautyStyleEndpoint)
                  .verifyUpload(
            session,
            params['path'],
          ),
        ),
        'getUploadedFile': _i1.MethodConnector(
          name: 'getUploadedFile',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['beautyStyle'] as _i8.BeautyStyleEndpoint)
                  .getUploadedFile(
            session,
            params['path'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i15.Endpoints()..initializeEndpoints(server);
    modules['serverpod_chat'] = _i16.Endpoints()..initializeEndpoints(server);
  }
}
