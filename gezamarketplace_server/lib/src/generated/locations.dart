/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Location extends _i1.TableRow {
  Location({
    int? id,
    required this.cityName,
    required this.neighbourhoodName,
    required this.mapName,
    required this.lat,
    required this.long,
  }) : super(id);

  factory Location.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Location(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      cityName: serializationManager
          .deserialize<String>(jsonSerialization['cityName']),
      neighbourhoodName: serializationManager
          .deserialize<String>(jsonSerialization['neighbourhoodName']),
      mapName: serializationManager
          .deserialize<String>(jsonSerialization['mapName']),
      lat: serializationManager.deserialize<String>(jsonSerialization['lat']),
      long: serializationManager.deserialize<String>(jsonSerialization['long']),
    );
  }

  static final t = LocationTable();

  String cityName;

  String neighbourhoodName;

  String mapName;

  String lat;

  String long;

  @override
  String get tableName => 'location';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cityName': cityName,
      'neighbourhoodName': neighbourhoodName,
      'mapName': mapName,
      'lat': lat,
      'long': long,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'cityName': cityName,
      'neighbourhoodName': neighbourhoodName,
      'mapName': mapName,
      'lat': lat,
      'long': long,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'cityName': cityName,
      'neighbourhoodName': neighbourhoodName,
      'mapName': mapName,
      'lat': lat,
      'long': long,
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
      case 'cityName':
        cityName = value;
        return;
      case 'neighbourhoodName':
        neighbourhoodName = value;
        return;
      case 'mapName':
        mapName = value;
        return;
      case 'lat':
        lat = value;
        return;
      case 'long':
        long = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Location>> find(
    _i1.Session session, {
    LocationExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Location>(
      where: where != null ? where(Location.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Location?> findSingleRow(
    _i1.Session session, {
    LocationExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Location>(
      where: where != null ? where(Location.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Location?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Location>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required LocationExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Location>(
      where: where(Location.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Location row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Location row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Location row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    LocationExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Location>(
      where: where != null ? where(Location.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef LocationExpressionBuilder = _i1.Expression Function(LocationTable);

class LocationTable extends _i1.Table {
  LocationTable() : super(tableName: 'location');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final cityName = _i1.ColumnString('cityName');

  final neighbourhoodName = _i1.ColumnString('neighbourhoodName');

  final mapName = _i1.ColumnString('mapName');

  final lat = _i1.ColumnString('lat');

  final long = _i1.ColumnString('long');

  @override
  List<_i1.Column> get columns => [
        id,
        cityName,
        neighbourhoodName,
        mapName,
        lat,
        long,
      ];
}

@Deprecated('Use LocationTable.t instead.')
LocationTable tLocation = LocationTable();
