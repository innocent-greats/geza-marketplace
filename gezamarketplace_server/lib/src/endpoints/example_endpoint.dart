import 'package:serverpod/serverpod.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// This is an example endpoint of your server. It's best practice to use the
// `Endpoint` ending of the class name, but it will be removed when accessing
// the endpoint from the client. I.e., this endpoint can be accessed through
// `client.example` on the client side.

// After adding or modifying an endpoint, you will need to run
// `serverpod generate` to update the server and client code.
class ExampleEndpoint extends Endpoint {
  // You create methods in your endpoint which are accessible from the client by
  // creating a public method with `Session` as its first parameter. Supported
  // parameter types are `bool`, `int`, `double`, `String`, `DateTime`, and any
  // objects that are generated from your `protocol` directory. The methods
  // should return a typed future; the same types as for the parameters are
  // supported. The `session` object provides access to the database, logging,
  // passwords, and information about the request being made to the server.
  Future<String> hello(Session session, String name) async {
    return 'Hello $name';
  }

  Future<String> subscribeToFirefly(Session session) async {
    var url =
        Uri.http('127.0.0.1:5000', 'api/v1/namespaces/default/subscriptions');
    print('the url $url');
    var body = json.encode({
      "namespace": "default",
      "name": "geza-marketplace",
      "transport": "websockets",
      "filter": {
        "events": "blockchain_event_received",
        "blockchainevent": {"listener": "3762b07d-0a3e-4f4d-a48f-e767d83ca544"}
      },
      "options": {"firstEvent": "oldest"}
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
}
