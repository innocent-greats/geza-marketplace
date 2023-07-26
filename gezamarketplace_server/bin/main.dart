import 'package:gezamarketplace_server/server.dart';
// ignore_for_file: avoid_print
// ignore: depend_on_referenced_packages

/// This is the starting point for your Serverpod server. Typically, there is
/// no need to modify this file.
void main(List<String> args) async {
  // Create a WebSocket client.
  // final uri = Uri.parse(
  //     'ws://localhost:5000/ws?namespace=default&name=geza-marketplace&autoack');
  // const backoff = ConstantBackoff(Duration(seconds: 1));
  // final socket = WebSocket(uri, backoff: backoff);

  // // Listen for changes in the connection state.
  // socket.connection.listen((state) => print('state: "$state"'));
  // await socket.connection.firstWhere((state) => state is Connected);
  // // Listen for incoming messages.
  // socket.messages.listen((message) {
  //   print('messages: "$message"');
  // });

  // await Future<void>.delayed(const Duration(seconds: 3));

  // Close the connection.
  // socket.close();
  run(args);
}
