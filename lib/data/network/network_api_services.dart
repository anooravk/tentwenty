import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tentwenty/data/network/base_api_services.dart';

import '../app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
  Map<String, String> header = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YzZlZjMzZDg2ZTNhNGE2MTk4NDI1MmNhMGMwN2M3YSIsIm5iZiI6MTczMjY1MDE2Ny41MDI4NjcsInN1YiI6IjY1OWQ5ZWNkMWQzNTYzMDI1YzU0OWNlZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.nNNJxIwDUuoIh8fsbWCsVJbKVNA-WVin5ueF9YzC7z0',
    'accept': 'application/json'
  };
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }

    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: header).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: data, headers: header).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      default:
        throw FetchDataException('Error accoured while communicating with server ${response.statusCode}');
    }
  }
}
