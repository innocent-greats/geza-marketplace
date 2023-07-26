import 'package:gezamarketplace_server/src/generated/protocol.dart';
import 'package:gezamarketplace_server/src/utils/strings.dart';
import 'package:serverpod/serverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const beautyStylesChannel = 'beauty-style-channel';

class BeautyStyleEndpoint extends Endpoint {
  @override
  Future<void> streamOpened(StreamingSession session) async {
    print('BeautyStyles stream opened');
    List<BeautyStylistsState> marketPlaceBeautyStylists =
        <BeautyStylistsState>[];

    // var marketPlaceBeautyStyles = await BeautyStyle.find(session);
    var marketPlaceBeautyStyles = await BeautyStyle.find(session);
    var query = await Person.find(session,
        where: (person) => person.isTrader.equals(true));
    // print('stylists resolved query $query');

    for (var s in query) {
      // print('stylist list $s');
      var styles = await BeautyStyle.find(session,
          where: (style) => style.stylistId.equals(s.id));
      if (styles.isNotEmpty) {
        marketPlaceBeautyStylists
            .add(BeautyStylistsState(stylist: s, beautyStyles: styles));
      }
    }
    // print('marketPlaceBeautyStylists stream opened $marketPlaceBeautyStylists');

    sendStreamMessage(session,
        BeautyStyleStateMessage(beautyStyles: marketPlaceBeautyStyles));
    sendStreamMessage(session,
        BeautyStylistsStateMessage(beautyStylists: marketPlaceBeautyStylists));
    session.messages.addListener(beautyStylesChannel, (update) {
      sendStreamMessage(session, update);
    });
  }

  @override
  Future<void> handleStreamMessage(
      StreamingSession session, SerializableEntity message) async {
    if (message is BeautyStyleCreateMessage) {
      final identifier = generateRandomString(16);
      print(
        'handleStreamMessage BeautyStyleCreateMessage $message',
      );
      final searchTerm =
          '${message.name} ${message.cityName}  ${message.category} ${message.neighbourhoodName}';
      final newBeautyStyle = BeautyStyle(
          stylistId: message.stylistId,
          name: message.name,
          category: message.category,
          neighbourhoodName: message.neighbourhoodName,
          cityName: message.cityName,
          description: message.description,
          amount: message.amount,
          images: message.images,
          dateAdded: DateTime.now().toString(),
          searchTerm: searchTerm);
      session.log('searchTerm $searchTerm');
      session.log('createBeautyStyle called');

      await BeautyStyle.insert(session, newBeautyStyle);
      final beautyStyle = await BeautyStyle.findSingleRow(
        session,
        where: (beautyStyle) =>
            beautyStyle.stylistId.equals(message.stylistId) &
            beautyStyle.name.equals(message.name),
      );
      session.log('message.images ${message.images}');
      session.log('message.images ${message.images.length.toString()}');
      if (message.images.length > 0) {
        session.log(
            'message.images is not empty ${message.images.length.toString()}');
        for (var image in message.images) {
          session.log(
              'image.pathLocation: ${image.pathLocation.toString()} created');
          image = Images(
              uploaderId: beautyStyle!.stylistId as int,
              pathLocation: image.pathLocation,
              beautyStyleId: beautyStyle.id,
              dateAdded: DateTime.timestamp());
          await Images.insert(session, image);
          session.log('BeautyStyle Image ${image.dateAdded} created');
        }
        final beautyStyleImages = await Images.find(
          session,
          where: (images) => images.beautyStyleId.equals(beautyStyle?.id),
        );
        session.log('beautyStyleImages:  $beautyStyleImages');
      } else {
        session.log(
            'message.images is empty:  ${message.images.length.toString()}');
      }
      print(
        'handleStreamMessage created BeautyStyle $beautyStyle',
      );
      session.messages.postMessage(beautyStylesChannel,
          BeautyStyleAppendMessage(beautyStyle: beautyStyle!),
          global: false);
    }
  }

  Future<List<BeautyStyle>> getAllBeautyStyles(
    Session session,
  ) async {
    var all = await BeautyStyle.find(session);
    return all;
  }

  Future<List<BeautyStyle>> getAccountBeautyStyles(
      Session session, int id) async {
    session.log('Get Account Services $id');
    try {
      var beautyStyles = await BeautyStyle.find(
        session,
        where: (beautyStyle) => beautyStyle.stylistId.equals(id),
      );
      session.log('getAccountBeautyStyles $beautyStyles');

      return beautyStyles;
    } catch (e) {
      session.log(e.toString());
    }
    return [];
  }

  Future<String?> createBeautyStyle(
      Session session, BeautyStyle beautyBeautyStyle) async {
    try {
      session.log('createBeautyStyle called');
      await BeautyStyle.insert(session, beautyBeautyStyle);
      final beautyStyle = await BeautyStyle.findSingleRow(
        session,
        where: (beautyStyle) =>
            beautyStyle.stylistId.equals(beautyBeautyStyle.stylistId) &
            beautyStyle.name.equals(beautyBeautyStyle.name),
      );
      return jsonEncode(beautyStyle);
    } catch (e) {
      session.log(e.toString());
      return e.toString();
    } finally {}
  }

  Future<BeautyStyle?> getBeautyStyle(Session session, int id) async {
    var result = await BeautyStyle.findById(session, id);
    return result;
  }

  Future<bool> updateBeautyStyle(
      Session session, BeautyStyle beautyBeautyStyle) async {
    try {
      session.log('updateBeautyStyle called');
      await BeautyStyle.update(session, beautyBeautyStyle);
    } catch (e) {
      session.log(e.toString());
    } finally {}
    return true;
  }

  Future<bool> deleteBeautyStyle(Session session, int id) async {
    var result =
        await BeautyStyle.delete(session, where: (t) => t.id.equals(id));
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
