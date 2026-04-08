
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

part 'network_response.dart';

class NetworkCaller {
  final Logger _logger = Logger();
  final Map<String,String> Function() headers;
  final VoidCallback onUnauthorized;

  NetworkCaller({required this.headers,required this.onUnauthorized});

  Future<NetworkResponse> getRequest(String url) async {
    try {
      final uri = Uri.parse(url);
      _logRequest(url);
      final Response response = await get(uri);
      _logResponse(response);
      final decodedJson = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          body: decodedJson,
        );
      }
      else if(response.statusCode == 401){
        onUnauthorized();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          body: null,
          errorMessage: 'Unauthorized',
        );
      }
      else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          body: null,
          errorMessage: decodedJson['message'],
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }
  Future<NetworkResponse> postRequest(String url, Map<String, dynamic>?body) async {
    try {
      final uri = Uri.parse(url);
      _logRequest(url, body: body);
      final Response response = await post(
        uri,
        headers: headers(),
        body: jsonEncode(body),
      );
      _logResponse(response);
      final decodedJson = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          body: decodedJson,
        );
      }
      else if(response.statusCode == 401){
        onUnauthorized();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          body: null,
          errorMessage: 'Unauthorized',
        );
      }
      else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: decodedJson['message'],
        );
      }


    } on Exception catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }
  Future<NetworkResponse> putRequest(String url, Map<String, dynamic>?body) async {
    try {
      final uri = Uri.parse(url);
      _logRequest(url, body: body);
      final Response response = await put(
        uri,
        headers: headers(),
        body: jsonEncode(body),
      );
      _logResponse(response);
      final decodedJson = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          body: decodedJson,
        );
      }
      else if(response.statusCode == 401){
        onUnauthorized();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          body: null,
          errorMessage: 'Unauthorized',
        );
      }
      else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: decodedJson['message'],
        );
      }


    } on Exception catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }
  Future<NetworkResponse> patchRequest(String url, Map<String, dynamic>?body) async {
    try {
      final uri = Uri.parse(url);
      _logRequest(url, body: body);
      final Response response = await patch(
        uri,
        headers: headers(),
        body: jsonEncode(body),
      );
      _logResponse(response);
      final decodedJson = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          body: decodedJson,
        );
      }
      else if(response.statusCode == 401){
        onUnauthorized();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          body: null,
          errorMessage: 'Unauthorized',
        );
      }
      else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: decodedJson['message'],
        );
      }


    } on Exception catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }
  Future<NetworkResponse> deleteRequest(String url, Map<String, dynamic>?body) async {
    try {
      final uri = Uri.parse(url);
      _logRequest(url, body: body);
      final Response response = await delete(
        uri,
        headers: headers(),
        body: jsonEncode(body),
      );
      _logResponse(response);
      final decodedJson = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          body: decodedJson,
        );
      }
      else if(response.statusCode == 401){
        onUnauthorized();
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          body: null,
          errorMessage: 'Unauthorized',
        );
      }
      else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: decodedJson['message'],
        );
      }


    } on Exception catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }



  void _logRequest(String url, {Map<String, dynamic>? body}){
    _logger.i('Request URL: $url\n Body: $body');
  }

  void _logResponse(Response response){
    _logger.i('''URL => ${response.request!.url}
    STATUS CODE => ${response.statusCode}
    BODY => ${response.body}
    ''');
  }
}

