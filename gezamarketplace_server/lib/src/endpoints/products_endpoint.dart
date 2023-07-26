import 'package:gezamarketplace_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductsEndpoint extends Endpoint {
  Future<List<Product>> getAllProducts(
    Session session,
  ) async {
    var allCommodities = await Product.find(session);
    return allCommodities;
  }

  Future<List<Product>> getAccountProducts(
      Session session, int id) async {
    session.log('getAccountProducts called');
    try {
      var beautyStyles = await Product.find(
        session,
        where: (beautyStyle) => beautyStyle.stylistId.equals(id),
      );
      session.log('getAccountProducts called');

      return beautyStyles;
    } catch (e) {
      session.log(e.toString());
    }
    return [];
  }

  Future<String?> createProduct(
      Session session, Product beautyProduct) async {
    try {
      session.log('createProduct called');
      await Product.insert(session, beautyProduct);
      final account = await Product.findSingleRow(
        session,
        where: (account) =>
            account.stylistId.equals(beautyProduct.stylistId) &
            account.name.equals(beautyProduct.name),
      );
      return jsonEncode(account);
    } catch (e) {
      session.log(e.toString());
      return e.toString();
    } finally {}
  }

  Future<Product?> getProduct(Session session, int id) async {
    var result = await Product.findById(session, id);
    return result;
  }

  Future<bool> updateProduct(
      Session session, Product beautyProduct) async {
    try {
      session.log('updateProduct called');
      await Product.update(session, beautyProduct);
    } catch (e) {
      session.log(e.toString());
    } finally {}
    return true;
  }

  Future<bool> deleteProduct(Session session, int id) async {
    var result =
        await Product.delete(session, where: (t) => t.id.equals(id));
    return result == 1;
  }

  Future<String> pushToChain(Session session) async {
    var url = Uri.http('127.0.0.1:5000',
        '/api/v1/namespaces/default/apis/asset_transfer/invoke/CreateAsset');
    print('the url $url');
    var body = json.encode({
      "type": "start",
      "name": "asset_transfer",
      "namespace": "default",
      "autoack": true
    });

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await http.post(url, headers: headers, body: body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response.body.toString();
  }

  Future<String?> getUploadDescription(Session session, String path) async {
    session.log('getUploadDescription: $path');
    return await session.storage.createDirectFileUploadDescription(
      storageId: 'public',
      path: path,
    );
  }

  Future<bool> verifyUpload(Session session, String path) async {
    session.log('verifyUpload: $path');

    return await session.storage.verifyDirectFileUpload(
      storageId: 'public',
      path: path,
    );
  }

  Future<String?> getUploadedFile(Session session, String path) async {
    session.log('getUploadedFile path: $path');

    var fileByteData = await session.storage.retrieveFile(
      storageId: 'public',
      path: path,
    );
    session.log('getUploadedFile fileByteData: $fileByteData');

    return fileByteData.toString();
  }
}
