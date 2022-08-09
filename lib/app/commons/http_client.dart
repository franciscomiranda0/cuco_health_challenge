import 'dart:convert' show jsonDecode;

import 'package:cuco_health_challenge/app/commons/environment_variables.dart';
import 'package:http/http.dart' as http show get;

abstract class HttpClientInterface {
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });
}

class HttpClient implements HttpClientInterface {
  const HttpClient._();

  factory HttpClient() => const HttpClient._();

  /// Do not start [endpoint]s with slash as its already provided.
  @override
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final Map<String, dynamic> response;
    final rawResponse = await http.get(
      Uri(
        scheme: EnvironmentVariables.scheme,
        host: EnvironmentVariables.host,
        path: endpoint,
        queryParameters: queryParameters,
      ),
    );

    if (rawResponse.statusCode == 200) {
      response = jsonDecode(rawResponse.body);
    } else {
      throw Exception('''Could not complete request properly. 
          Code: ${rawResponse.statusCode}.''');
    }

    return response;
  }
}
