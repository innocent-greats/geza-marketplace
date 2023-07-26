/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class Message extends _i1.TableRow {
  Message({
    int? id,
    required this.topicId,
    required this.topic,
    this.createdDate,
    required this.senderId,
    required this.sender,
    required this.recieverId,
    required this.reciever,
    required this.message,
  }) : super(id);

  factory Message.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Message(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      topicId:
          serializationManager.deserialize<int>(jsonSerialization['topicId']),
      topic:
          serializationManager.deserialize<String>(jsonSerialization['topic']),
      createdDate: serializationManager
          .deserialize<DateTime?>(jsonSerialization['createdDate']),
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
    );
  }

  static final t = MessageTable();

  int topicId;

  String topic;

  DateTime? createdDate;

  int senderId;

  _i2.Person sender;

  int recieverId;

  _i2.Person reciever;

  String message;

  @override
  String get tableName => 'message';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'topicId': topicId,
      'topic': topic,
      'createdDate': createdDate,
      'senderId': senderId,
      'sender': sender,
      'recieverId': recieverId,
      'reciever': reciever,
      'message': message,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'topicId': topicId,
      'topic': topic,
      'createdDate': createdDate,
      'senderId': senderId,
      'sender': sender,
      'recieverId': recieverId,
      'reciever': reciever,
      'message': message,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'topicId': topicId,
      'topic': topic,
      'createdDate': createdDate,
      'senderId': senderId,
      'sender': sender,
      'recieverId': recieverId,
      'reciever': reciever,
      'message': message,
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
      case 'topicId':
        topicId = value;
        return;
      case 'topic':
        topic = value;
        return;
      case 'createdDate':
        createdDate = value;
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
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Message>> find(
    _i1.Session session, {
    MessageExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Message>(
      where: where != null ? where(Message.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Message?> findSingleRow(
    _i1.Session session, {
    MessageExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Message>(
      where: where != null ? where(Message.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Message?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Message>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required MessageExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Message>(
      where: where(Message.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Message row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Message row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Message row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    MessageExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Message>(
      where: where != null ? where(Message.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef MessageExpressionBuilder = _i1.Expression Function(MessageTable);

class MessageTable extends _i1.Table {
  MessageTable() : super(tableName: 'message');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final topicId = _i1.ColumnInt('topicId');

  final topic = _i1.ColumnString('topic');

  final createdDate = _i1.ColumnDateTime('createdDate');

  final senderId = _i1.ColumnInt('senderId');

  final sender = _i1.ColumnSerializable('sender');

  final recieverId = _i1.ColumnInt('recieverId');

  final reciever = _i1.ColumnSerializable('reciever');

  final message = _i1.ColumnString('message');

  @override
  List<_i1.Column> get columns => [
        id,
        topicId,
        topic,
        createdDate,
        senderId,
        sender,
        recieverId,
        reciever,
        message,
      ];
}

@Deprecated('Use MessageTable.t instead.')
MessageTable tMessage = MessageTable();
