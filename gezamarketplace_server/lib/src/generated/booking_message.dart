/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class BookingMessage extends _i1.TableRow {
  BookingMessage({
    int? id,
    required this.bookingChatId,
    required this.chatMessage,
  }) : super(id);

  factory BookingMessage.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return BookingMessage(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      bookingChatId: serializationManager
          .deserialize<int>(jsonSerialization['bookingChatId']),
      chatMessage: serializationManager
          .deserialize<_i2.ChatMessage>(jsonSerialization['chatMessage']),
    );
  }

  static final t = BookingMessageTable();

  int bookingChatId;

  _i2.ChatMessage chatMessage;

  @override
  String get tableName => 'booking_message';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bookingChatId': bookingChatId,
      'chatMessage': chatMessage,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'bookingChatId': bookingChatId,
      'chatMessage': chatMessage,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'bookingChatId': bookingChatId,
      'chatMessage': chatMessage,
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
      case 'chatMessage':
        chatMessage = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<BookingMessage>> find(
    _i1.Session session, {
    BookingMessageExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<BookingMessage>(
      where: where != null ? where(BookingMessage.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<BookingMessage?> findSingleRow(
    _i1.Session session, {
    BookingMessageExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<BookingMessage>(
      where: where != null ? where(BookingMessage.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<BookingMessage?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<BookingMessage>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required BookingMessageExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BookingMessage>(
      where: where(BookingMessage.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    BookingMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    BookingMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    BookingMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    BookingMessageExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<BookingMessage>(
      where: where != null ? where(BookingMessage.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef BookingMessageExpressionBuilder = _i1.Expression Function(
    BookingMessageTable);

class BookingMessageTable extends _i1.Table {
  BookingMessageTable() : super(tableName: 'booking_message');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final bookingChatId = _i1.ColumnInt('bookingChatId');

  final chatMessage = _i1.ColumnSerializable('chatMessage');

  @override
  List<_i1.Column> get columns => [
        id,
        bookingChatId,
        chatMessage,
      ];
}

@Deprecated('Use BookingMessageTable.t instead.')
BookingMessageTable tBookingMessage = BookingMessageTable();
