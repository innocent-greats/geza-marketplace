/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/module.dart' as _i3;
import 'package:serverpod_chat_server/module.dart' as _i4;
import 'beauty_style.dart' as _i5;
import 'beauty_style_generate_message.dart' as _i6;
import 'beauty_style_images.dart' as _i7;
import 'beauty_style_message.dart' as _i8;
import 'beauty_style_state_message.dart' as _i9;
import 'beauty_stylists_state.dart' as _i10;
import 'beauty_stylists_state_message.dart' as _i11;
import 'booking.dart' as _i12;
import 'booking_append_booking_message.dart' as _i13;
import 'booking_append_order.dart' as _i14;
import 'booking_append_order_chat.dart' as _i15;
import 'booking_message.dart' as _i16;
import 'booking_new_order.dart' as _i17;
import 'booking_order_chat.dart' as _i18;
import 'booking_order_list.dart' as _i19;
import 'channel.dart' as _i20;
import 'chat_message.dart' as _i21;
import 'create_chat_state.dart' as _i22;
import 'example.dart' as _i23;
import 'locations.dart' as _i24;
import 'message.dart' as _i25;
import 'order_chat.dart' as _i26;
import 'order_chat_message.dart' as _i27;
import 'order_message.dart' as _i28;
import 'orders.dart' as _i29;
import 'persons.dart' as _i30;
import 'product.dart' as _i31;
import 'profile_images.dart' as _i32;
import 'shares.dart' as _i33;
import 'tags.dart' as _i34;
import 'protocol.dart' as _i35;
import 'package:gezamarketplace_server/src/generated/booking.dart' as _i36;
import 'package:gezamarketplace_server/src/generated/chat_message.dart' as _i37;
import 'package:gezamarketplace_server/src/generated/booking_order_chat.dart'
    as _i38;
import 'package:gezamarketplace_server/src/generated/persons.dart' as _i39;
import 'package:gezamarketplace_server/src/generated/product.dart' as _i40;
import 'package:gezamarketplace_server/src/generated/beauty_style.dart' as _i41;
export 'beauty_style.dart';
export 'beauty_style_generate_message.dart';
export 'beauty_style_images.dart';
export 'beauty_style_message.dart';
export 'beauty_style_state_message.dart';
export 'beauty_stylists_state.dart';
export 'beauty_stylists_state_message.dart';
export 'booking.dart';
export 'booking_append_booking_message.dart';
export 'booking_append_order.dart';
export 'booking_append_order_chat.dart';
export 'booking_message.dart';
export 'booking_new_order.dart';
export 'booking_order_chat.dart';
export 'booking_order_list.dart';
export 'channel.dart';
export 'chat_message.dart';
export 'create_chat_state.dart';
export 'example.dart';
export 'locations.dart';
export 'message.dart';
export 'order_chat.dart';
export 'order_chat_message.dart';
export 'order_message.dart';
export 'orders.dart';
export 'persons.dart';
export 'product.dart';
export 'profile_images.dart';
export 'shares.dart';
export 'tags.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  static final targetDatabaseDefinition = _i2.DatabaseDefinition(tables: [
    _i2.TableDefinition(
      name: 'beauty_style',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'beauty_style_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'category',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'cityName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'neighbourhoodName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'dateAdded',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'amount',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'images',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:Images>',
        ),
        _i2.ColumnDefinition(
          name: 'tags',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<protocol:Tag>?',
        ),
        _i2.ColumnDefinition(
          name: 'shares',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<protocol:Share>?',
        ),
        _i2.ColumnDefinition(
          name: 'stylistId',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'searchTerm',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'beauty_style_fk_0',
          columns: ['stylistId'],
          referenceTable: 'person',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'beauty_style_fk_1',
          columns: ['customerId'],
          referenceTable: 'person',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'beauty_style_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'images',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'images_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'dateAdded',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'uploaderId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'beautyStyleId',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'pathLocation',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'images_fk_0',
          columns: ['uploaderId'],
          referenceTable: 'person',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'images_fk_1',
          columns: ['beautyStyleId'],
          referenceTable: 'beauty_style',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'images_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'booking_order',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'booking_order_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'selectedDate',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'selectedTime',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'orderStatus',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'customerType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'vendorId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'beautyStyleId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'dateCreated',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'booking_order_fk_0',
          columns: ['customerId'],
          referenceTable: 'person',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'booking_order_fk_1',
          columns: ['vendorId'],
          referenceTable: 'person',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'booking_order_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'booking_message',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'booking_message_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'bookingChatId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'chatMessage',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:ChatMessage',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'booking_message_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'booking_order_chat',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'booking_order_chat_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'orderedItem',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:BeautyStyle',
        ),
        _i2.ColumnDefinition(
          name: 'chatDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'orderDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'orderId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'customer',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:Person',
        ),
        _i2.ColumnDefinition(
          name: 'vendor',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:Person',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'vendorId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'messages',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:BookingMessage>',
        ),
        _i2.ColumnDefinition(
          name: 'chatStatus',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'booking_order_chat_fk_0',
          columns: ['customerId'],
          referenceTable: 'person',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'booking_order_chat_fk_1',
          columns: ['vendorId'],
          referenceTable: 'person',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'booking_order_chat_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'channel',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'channel_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'channel',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'channel_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'chat_message',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'chat_message_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'bookingChatId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'senderId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'sender',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:Person',
        ),
        _i2.ColumnDefinition(
          name: 'recieverId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'reciever',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:Person',
        ),
        _i2.ColumnDefinition(
          name: 'message',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'dateCreated',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'chat_message_fk_0',
          columns: ['senderId'],
          referenceTable: 'person',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'chat_message_fk_1',
          columns: ['recieverId'],
          referenceTable: 'person',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'chat_message_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'location',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'location_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'cityName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'neighbourhoodName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'mapName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'lat',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'long',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'location_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'message',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'message_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'topicId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'topic',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'senderId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'sender',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:Person',
        ),
        _i2.ColumnDefinition(
          name: 'recieverId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'reciever',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:Person',
        ),
        _i2.ColumnDefinition(
          name: 'message',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'message_fk_0',
          columns: ['senderId'],
          referenceTable: 'person',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'message_fk_1',
          columns: ['recieverId'],
          referenceTable: 'person',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'message_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'order_chat',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'order_chat_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'dateCreated',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'order',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:SaleOrder',
        ),
        _i2.ColumnDefinition(
          name: 'messages',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:Message>',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'order_chat_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'order_message',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'order_message_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'createdDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'orderType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'orderId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'essage',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:Message',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'order_message_fk_0',
          columns: ['orderId'],
          referenceTable: 'sale_order',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'order_message_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'sale_order',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'sale_order_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'bookingOrderId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'orderType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'orderedItem',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:BeautyStyle',
        ),
        _i2.ColumnDefinition(
          name: 'orderCreatedDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'orderCornfirmedDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'orderBookedTime',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'orderBookedDate',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'customer',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:Person',
        ),
        _i2.ColumnDefinition(
          name: 'orderingFor',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'vendor',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:Person',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'vendorId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'customerRating',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'stylistRating',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'searchTerm',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'orderStatus',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'sale_order_fk_0',
          columns: ['bookingOrderId'],
          referenceTable: 'booking_order',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'sale_order_fk_1',
          columns: ['customerId'],
          referenceTable: 'person',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'sale_order_fk_2',
          columns: ['vendorId'],
          referenceTable: 'person',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'sale_order_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'person',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'person_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'firstName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'lastName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'phone',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'password',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'pin',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'city',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'neighbourhood',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'locationCoordinate',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'walletId',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'specialization',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'rating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'accountType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'isCustomer',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
        ),
        _i2.ColumnDefinition(
          name: 'isTrader',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
        ),
        _i2.ColumnDefinition(
          name: 'followers',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<protocol:Person>?',
        ),
        _i2.ColumnDefinition(
          name: 'searchTerm',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'profileImagePathLocation',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdDate',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'person_fk_0',
          columns: ['locationCoordinate'],
          referenceTable: 'location',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'person_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'product',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'product_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'category',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'cityName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'neighbourhoodName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'dateAdded',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'amount',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'images',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<protocol:Images>?',
        ),
        _i2.ColumnDefinition(
          name: 'tags',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<protocol:Tag>?',
        ),
        _i2.ColumnDefinition(
          name: 'shares',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<protocol:Share>?',
        ),
        _i2.ColumnDefinition(
          name: 'stylistId',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'searchTerm',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdDate',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'product_fk_0',
          columns: ['stylistId'],
          referenceTable: 'person',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'product_fk_1',
          columns: ['customerId'],
          referenceTable: 'person',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'product_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'profile_images',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'profile_images_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'dateAdded',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'personId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'pathLocation',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'profile_images_fk_0',
          columns: ['personId'],
          referenceTable: 'person',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'profile_images_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'share',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'share_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'dateAdded',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'stylistId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'beautyStyleId',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'shareBy',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'sharewith',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'share_fk_0',
          columns: ['stylistId'],
          referenceTable: 'person',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'share_fk_1',
          columns: ['beautyStyleId'],
          referenceTable: 'beauty_style',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'share_fk_2',
          columns: ['shareBy'],
          referenceTable: 'person',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'share_fk_3',
          columns: ['sharewith'],
          referenceTable: 'person',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'share_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'tag',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'tag_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'dateAdded',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'stylistId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'beautyStyleId',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'personTaggedId',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'tag_fk_0',
          columns: ['stylistId'],
          referenceTable: 'person',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'tag_fk_1',
          columns: ['beautyStyleId'],
          referenceTable: 'beauty_style',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'tag_fk_2',
          columns: ['personTaggedId'],
          referenceTable: 'person',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'tag_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetDatabaseDefinition.tables,
    ..._i4.Protocol.targetDatabaseDefinition.tables,
    ..._i2.Protocol.targetDatabaseDefinition.tables,
  ]);

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i5.BeautyStyle) {
      return _i5.BeautyStyle.fromJson(data, this) as T;
    }
    if (t == _i6.BeautyStyleCreateMessage) {
      return _i6.BeautyStyleCreateMessage.fromJson(data, this) as T;
    }
    if (t == _i7.Images) {
      return _i7.Images.fromJson(data, this) as T;
    }
    if (t == _i8.BeautyStyleAppendMessage) {
      return _i8.BeautyStyleAppendMessage.fromJson(data, this) as T;
    }
    if (t == _i9.BeautyStyleStateMessage) {
      return _i9.BeautyStyleStateMessage.fromJson(data, this) as T;
    }
    if (t == _i10.BeautyStylistsState) {
      return _i10.BeautyStylistsState.fromJson(data, this) as T;
    }
    if (t == _i11.BeautyStylistsStateMessage) {
      return _i11.BeautyStylistsStateMessage.fromJson(data, this) as T;
    }
    if (t == _i12.BookingOrder) {
      return _i12.BookingOrder.fromJson(data, this) as T;
    }
    if (t == _i13.AppendBookingMessage) {
      return _i13.AppendBookingMessage.fromJson(data, this) as T;
    }
    if (t == _i14.BookingOrderAppendMessage) {
      return _i14.BookingOrderAppendMessage.fromJson(data, this) as T;
    }
    if (t == _i15.BookingOrderChatAppendMessage) {
      return _i15.BookingOrderChatAppendMessage.fromJson(data, this) as T;
    }
    if (t == _i16.BookingMessage) {
      return _i16.BookingMessage.fromJson(data, this) as T;
    }
    if (t == _i17.BookingOrderCreateMessage) {
      return _i17.BookingOrderCreateMessage.fromJson(data, this) as T;
    }
    if (t == _i18.BookingOrderChat) {
      return _i18.BookingOrderChat.fromJson(data, this) as T;
    }
    if (t == _i19.BookingOrderStateMessage) {
      return _i19.BookingOrderStateMessage.fromJson(data, this) as T;
    }
    if (t == _i20.Channel) {
      return _i20.Channel.fromJson(data, this) as T;
    }
    if (t == _i21.ChatMessage) {
      return _i21.ChatMessage.fromJson(data, this) as T;
    }
    if (t == _i22.ChatMessageCreateMessage) {
      return _i22.ChatMessageCreateMessage.fromJson(data, this) as T;
    }
    if (t == _i23.Example) {
      return _i23.Example.fromJson(data, this) as T;
    }
    if (t == _i24.Location) {
      return _i24.Location.fromJson(data, this) as T;
    }
    if (t == _i25.Message) {
      return _i25.Message.fromJson(data, this) as T;
    }
    if (t == _i26.OrderChat) {
      return _i26.OrderChat.fromJson(data, this) as T;
    }
    if (t == _i27.OrderChatAppendMessage) {
      return _i27.OrderChatAppendMessage.fromJson(data, this) as T;
    }
    if (t == _i28.OrderMessage) {
      return _i28.OrderMessage.fromJson(data, this) as T;
    }
    if (t == _i29.SaleOrder) {
      return _i29.SaleOrder.fromJson(data, this) as T;
    }
    if (t == _i30.Person) {
      return _i30.Person.fromJson(data, this) as T;
    }
    if (t == _i31.Product) {
      return _i31.Product.fromJson(data, this) as T;
    }
    if (t == _i32.ProfileImages) {
      return _i32.ProfileImages.fromJson(data, this) as T;
    }
    if (t == _i33.Share) {
      return _i33.Share.fromJson(data, this) as T;
    }
    if (t == _i34.Tag) {
      return _i34.Tag.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i5.BeautyStyle?>()) {
      return (data != null ? _i5.BeautyStyle.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.BeautyStyleCreateMessage?>()) {
      return (data != null
          ? _i6.BeautyStyleCreateMessage.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i7.Images?>()) {
      return (data != null ? _i7.Images.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i8.BeautyStyleAppendMessage?>()) {
      return (data != null
          ? _i8.BeautyStyleAppendMessage.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i9.BeautyStyleStateMessage?>()) {
      return (data != null
          ? _i9.BeautyStyleStateMessage.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i10.BeautyStylistsState?>()) {
      return (data != null
          ? _i10.BeautyStylistsState.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i11.BeautyStylistsStateMessage?>()) {
      return (data != null
          ? _i11.BeautyStylistsStateMessage.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i12.BookingOrder?>()) {
      return (data != null ? _i12.BookingOrder.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i13.AppendBookingMessage?>()) {
      return (data != null
          ? _i13.AppendBookingMessage.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i14.BookingOrderAppendMessage?>()) {
      return (data != null
          ? _i14.BookingOrderAppendMessage.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i15.BookingOrderChatAppendMessage?>()) {
      return (data != null
          ? _i15.BookingOrderChatAppendMessage.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i16.BookingMessage?>()) {
      return (data != null ? _i16.BookingMessage.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i17.BookingOrderCreateMessage?>()) {
      return (data != null
          ? _i17.BookingOrderCreateMessage.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i18.BookingOrderChat?>()) {
      return (data != null ? _i18.BookingOrderChat.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i19.BookingOrderStateMessage?>()) {
      return (data != null
          ? _i19.BookingOrderStateMessage.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i20.Channel?>()) {
      return (data != null ? _i20.Channel.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i21.ChatMessage?>()) {
      return (data != null ? _i21.ChatMessage.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i22.ChatMessageCreateMessage?>()) {
      return (data != null
          ? _i22.ChatMessageCreateMessage.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i23.Example?>()) {
      return (data != null ? _i23.Example.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i24.Location?>()) {
      return (data != null ? _i24.Location.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i25.Message?>()) {
      return (data != null ? _i25.Message.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i26.OrderChat?>()) {
      return (data != null ? _i26.OrderChat.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i27.OrderChatAppendMessage?>()) {
      return (data != null
          ? _i27.OrderChatAppendMessage.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i28.OrderMessage?>()) {
      return (data != null ? _i28.OrderMessage.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i29.SaleOrder?>()) {
      return (data != null ? _i29.SaleOrder.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i30.Person?>()) {
      return (data != null ? _i30.Person.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i31.Product?>()) {
      return (data != null ? _i31.Product.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i32.ProfileImages?>()) {
      return (data != null ? _i32.ProfileImages.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i33.Share?>()) {
      return (data != null ? _i33.Share.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i34.Tag?>()) {
      return (data != null ? _i34.Tag.fromJson(data, this) : null) as T;
    }
    if (t == List<_i35.Images>) {
      return (data as List).map((e) => deserialize<_i35.Images>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i35.Tag>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i35.Tag>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i35.Share>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i35.Share>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i35.BeautyStyle>) {
      return (data as List)
          .map((e) => deserialize<_i35.BeautyStyle>(e))
          .toList() as dynamic;
    }
    if (t == List<_i35.BeautyStylistsState>) {
      return (data as List)
          .map((e) => deserialize<_i35.BeautyStylistsState>(e))
          .toList() as dynamic;
    }
    if (t == List<_i35.BookingMessage>) {
      return (data as List)
          .map((e) => deserialize<_i35.BookingMessage>(e))
          .toList() as dynamic;
    }
    if (t == List<_i35.BookingOrder>) {
      return (data as List)
          .map((e) => deserialize<_i35.BookingOrder>(e))
          .toList() as dynamic;
    }
    if (t == List<_i35.Message>) {
      return (data as List).map((e) => deserialize<_i35.Message>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i35.Person>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i35.Person>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i35.Images>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i35.Images>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i35.Tag>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i35.Tag>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i35.Share>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i35.Share>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i36.BookingOrder>) {
      return (data as List)
          .map((e) => deserialize<_i36.BookingOrder>(e))
          .toList() as dynamic;
    }
    if (t == List<_i37.ChatMessage>) {
      return (data as List)
          .map((e) => deserialize<_i37.ChatMessage>(e))
          .toList() as dynamic;
    }
    if (t == List<_i38.BookingOrderChat>) {
      return (data as List)
          .map((e) => deserialize<_i38.BookingOrderChat>(e))
          .toList() as dynamic;
    }
    if (t == List<_i39.Person>) {
      return (data as List).map((e) => deserialize<_i39.Person>(e)).toList()
          as dynamic;
    }
    if (t == List<_i40.Product>) {
      return (data as List).map((e) => deserialize<_i40.Product>(e)).toList()
          as dynamic;
    }
    if (t == List<_i41.BeautyStyle>) {
      return (data as List)
          .map((e) => deserialize<_i41.BeautyStyle>(e))
          .toList() as dynamic;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    className = _i4.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_chat.$className';
    }
    if (data is _i5.BeautyStyle) {
      return 'BeautyStyle';
    }
    if (data is _i6.BeautyStyleCreateMessage) {
      return 'BeautyStyleCreateMessage';
    }
    if (data is _i7.Images) {
      return 'Images';
    }
    if (data is _i8.BeautyStyleAppendMessage) {
      return 'BeautyStyleAppendMessage';
    }
    if (data is _i9.BeautyStyleStateMessage) {
      return 'BeautyStyleStateMessage';
    }
    if (data is _i10.BeautyStylistsState) {
      return 'BeautyStylistsState';
    }
    if (data is _i11.BeautyStylistsStateMessage) {
      return 'BeautyStylistsStateMessage';
    }
    if (data is _i12.BookingOrder) {
      return 'BookingOrder';
    }
    if (data is _i13.AppendBookingMessage) {
      return 'AppendBookingMessage';
    }
    if (data is _i14.BookingOrderAppendMessage) {
      return 'BookingOrderAppendMessage';
    }
    if (data is _i15.BookingOrderChatAppendMessage) {
      return 'BookingOrderChatAppendMessage';
    }
    if (data is _i16.BookingMessage) {
      return 'BookingMessage';
    }
    if (data is _i17.BookingOrderCreateMessage) {
      return 'BookingOrderCreateMessage';
    }
    if (data is _i18.BookingOrderChat) {
      return 'BookingOrderChat';
    }
    if (data is _i19.BookingOrderStateMessage) {
      return 'BookingOrderStateMessage';
    }
    if (data is _i20.Channel) {
      return 'Channel';
    }
    if (data is _i21.ChatMessage) {
      return 'ChatMessage';
    }
    if (data is _i22.ChatMessageCreateMessage) {
      return 'ChatMessageCreateMessage';
    }
    if (data is _i23.Example) {
      return 'Example';
    }
    if (data is _i24.Location) {
      return 'Location';
    }
    if (data is _i25.Message) {
      return 'Message';
    }
    if (data is _i26.OrderChat) {
      return 'OrderChat';
    }
    if (data is _i27.OrderChatAppendMessage) {
      return 'OrderChatAppendMessage';
    }
    if (data is _i28.OrderMessage) {
      return 'OrderMessage';
    }
    if (data is _i29.SaleOrder) {
      return 'SaleOrder';
    }
    if (data is _i30.Person) {
      return 'Person';
    }
    if (data is _i31.Product) {
      return 'Product';
    }
    if (data is _i32.ProfileImages) {
      return 'ProfileImages';
    }
    if (data is _i33.Share) {
      return 'Share';
    }
    if (data is _i34.Tag) {
      return 'Tag';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (data['className'].startsWith('serverpod_chat.')) {
      data['className'] = data['className'].substring(15);
      return _i4.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'BeautyStyle') {
      return deserialize<_i5.BeautyStyle>(data['data']);
    }
    if (data['className'] == 'BeautyStyleCreateMessage') {
      return deserialize<_i6.BeautyStyleCreateMessage>(data['data']);
    }
    if (data['className'] == 'Images') {
      return deserialize<_i7.Images>(data['data']);
    }
    if (data['className'] == 'BeautyStyleAppendMessage') {
      return deserialize<_i8.BeautyStyleAppendMessage>(data['data']);
    }
    if (data['className'] == 'BeautyStyleStateMessage') {
      return deserialize<_i9.BeautyStyleStateMessage>(data['data']);
    }
    if (data['className'] == 'BeautyStylistsState') {
      return deserialize<_i10.BeautyStylistsState>(data['data']);
    }
    if (data['className'] == 'BeautyStylistsStateMessage') {
      return deserialize<_i11.BeautyStylistsStateMessage>(data['data']);
    }
    if (data['className'] == 'BookingOrder') {
      return deserialize<_i12.BookingOrder>(data['data']);
    }
    if (data['className'] == 'AppendBookingMessage') {
      return deserialize<_i13.AppendBookingMessage>(data['data']);
    }
    if (data['className'] == 'BookingOrderAppendMessage') {
      return deserialize<_i14.BookingOrderAppendMessage>(data['data']);
    }
    if (data['className'] == 'BookingOrderChatAppendMessage') {
      return deserialize<_i15.BookingOrderChatAppendMessage>(data['data']);
    }
    if (data['className'] == 'BookingMessage') {
      return deserialize<_i16.BookingMessage>(data['data']);
    }
    if (data['className'] == 'BookingOrderCreateMessage') {
      return deserialize<_i17.BookingOrderCreateMessage>(data['data']);
    }
    if (data['className'] == 'BookingOrderChat') {
      return deserialize<_i18.BookingOrderChat>(data['data']);
    }
    if (data['className'] == 'BookingOrderStateMessage') {
      return deserialize<_i19.BookingOrderStateMessage>(data['data']);
    }
    if (data['className'] == 'Channel') {
      return deserialize<_i20.Channel>(data['data']);
    }
    if (data['className'] == 'ChatMessage') {
      return deserialize<_i21.ChatMessage>(data['data']);
    }
    if (data['className'] == 'ChatMessageCreateMessage') {
      return deserialize<_i22.ChatMessageCreateMessage>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i23.Example>(data['data']);
    }
    if (data['className'] == 'Location') {
      return deserialize<_i24.Location>(data['data']);
    }
    if (data['className'] == 'Message') {
      return deserialize<_i25.Message>(data['data']);
    }
    if (data['className'] == 'OrderChat') {
      return deserialize<_i26.OrderChat>(data['data']);
    }
    if (data['className'] == 'OrderChatAppendMessage') {
      return deserialize<_i27.OrderChatAppendMessage>(data['data']);
    }
    if (data['className'] == 'OrderMessage') {
      return deserialize<_i28.OrderMessage>(data['data']);
    }
    if (data['className'] == 'SaleOrder') {
      return deserialize<_i29.SaleOrder>(data['data']);
    }
    if (data['className'] == 'Person') {
      return deserialize<_i30.Person>(data['data']);
    }
    if (data['className'] == 'Product') {
      return deserialize<_i31.Product>(data['data']);
    }
    if (data['className'] == 'ProfileImages') {
      return deserialize<_i32.ProfileImages>(data['data']);
    }
    if (data['className'] == 'Share') {
      return deserialize<_i33.Share>(data['data']);
    }
    if (data['className'] == 'Tag') {
      return deserialize<_i34.Tag>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i4.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i5.BeautyStyle:
        return _i5.BeautyStyle.t;
      case _i7.Images:
        return _i7.Images.t;
      case _i12.BookingOrder:
        return _i12.BookingOrder.t;
      case _i16.BookingMessage:
        return _i16.BookingMessage.t;
      case _i18.BookingOrderChat:
        return _i18.BookingOrderChat.t;
      case _i20.Channel:
        return _i20.Channel.t;
      case _i21.ChatMessage:
        return _i21.ChatMessage.t;
      case _i24.Location:
        return _i24.Location.t;
      case _i25.Message:
        return _i25.Message.t;
      case _i26.OrderChat:
        return _i26.OrderChat.t;
      case _i28.OrderMessage:
        return _i28.OrderMessage.t;
      case _i29.SaleOrder:
        return _i29.SaleOrder.t;
      case _i30.Person:
        return _i30.Person.t;
      case _i31.Product:
        return _i31.Product.t;
      case _i32.ProfileImages:
        return _i32.ProfileImages.t;
      case _i33.Share:
        return _i33.Share.t;
      case _i34.Tag:
        return _i34.Tag.t;
    }
    return null;
  }

  @override
  _i2.DatabaseDefinition getTargetDatabaseDefinition() =>
      targetDatabaseDefinition;
}
