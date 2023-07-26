/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class ChatMessage extends _i1.TableRow {
  ChatMessage({
    int? id,
    required this.bookingChatId,
    required this.senderId,
    required this.sender,
    required this.recieverId,
    required this.reciever,
    required this.message,
    required this.dateCreated,
  }) : super(id);

  factory ChatMessage.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ChatMessage(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      bookingChatId: serializationManager
          .deserialize<int>(jsonSerialization['bookingChatId']),
      senderId:
          serializationManager.deserialize<int>(jsonSerialization['senderId']),
      sender: serializationManager
          .deserialize<_i2.Person>(jsonSerialization['sender']),
      recieverId: serializationManager
          .deserialize<int>(jsonSerialization['recieverId']),
      reciever: serializationManager
          .deserialize<_i2.Person>(jsonSerialization['reciever']),
      message: serializationManager
          .deserialize<String>(jsonSerialization['message']),
      dateCreated: serializationManager
          .deserialize<DateTime>(jsonSerialization['dateCreated']),
    );
  }

  static final t = ChatMessageTable();

  int bookingChatId;

  int senderId;

  _i2.Person sender;

  int recieverId;

  _i2.Person reciever;

  String message;

  DateTime dateCreated;

  @override
  String get tableName => 'chat_message';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bookingChatId': bookingChatId,
      'senderId': senderId,
      'sender': sender,
      'recieverId': recieverId,
      'reciever': reciever,
      'message': message,
      'dateCreated': dateCreated,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'bookingChatId': bookingChatId,
      'senderId': senderId,
      'sender': sender,
      'recieverId': recieverId,
      'reciever': reciever,
      'message': message,
      'dateCreated': dateCreated,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'bookingChatId': bookingChatId,
      'senderId': senderId,
      'sender': sender,
      'recieverId': recieverId,
      'reciever': reciever,
      'message': message,
      'dateCreated': dateCreated,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'bookingChatId':
        bookingChatId = value;
        return;
      case 'senderId':
        senderId = value;
        return;
      case 'sender':
        sender = value;
        return;
      case 'recieverId':
        recieverId = value;
        return;
      case 'reciever':
        reciever = value;
        return;
      case 'message':
        message = value;
        return;
      case 'dateCreated':
        dateCreated = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<ChatMessage>> find(
    _i1.Session session, {
    ChatMessageExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ChatMessage>(
      where: where != null ? where(ChatMessage.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ChatMessage?> findSingleRow(
    _i1.Session session, {
    ChatMessageExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<ChatMessage>(
      where: where != null ? where(ChatMessage.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ChatMessage?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<ChatMessage>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ChatMessageExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ChatMessage>(
      where: where(ChatMessage.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    ChatMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    ChatMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    ChatMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ChatMessageExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ChatMessage>(
      where: where != null ? where(ChatMessage.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ChatMessageExpressionBuilder = _i1.Expression Function(
    ChatMessageTable);

class ChatMessageTable extends _i1.Table {
  ChatMessageTable() : super(tableName: 'chat_message');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final bookingChatId = _i1.ColumnInt('bookingChatId');

  final senderId = _i1.ColumnInt('senderId');

  final sender = _i1.ColumnSerializable('sender');

  final recieverId = _i1.ColumnInt('recieverId');

  final reciever = _i1.ColumnSerializable('reciever');

  final message = _i1.ColumnString('message');

  final dateCreated = _i1.ColumnDateTime('dateCreated');

  @override
  List<_i1.Column> get columns => [
        id,
        bookingChatId,
        senderId,
        sender,
        recieverId,
        reciever,
        message,
        dateCreated,
      ];
}

@Deprecated('Use ChatMessageTable.t instead.')
ChatMessageTable tChatMessage = ChatMessageTable();
