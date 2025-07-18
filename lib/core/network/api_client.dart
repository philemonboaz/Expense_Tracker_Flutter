import 'dart:convert';

import 'package:expense_tracker/core/constants/app_constants.dart';
import 'package:expense_tracker/core/utils/api_error_response_model.dart';
import 'package:expense_tracker/core/utils/api_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../constants/constant_enums.dart';
import '../constants/urls.dart';
import '../utils/global.dart';

class ApiClient {
  // GET Method API Call
  Future<BaseApiResponse> get(
    String endPoint,
  ) async {
    final url = Uri.parse("${Urls.baseUrl}$endPoint");
    Map<String, String>? headers = _getHeaders();
    try {
      final response = await http.get(url, headers: headers);
      return _parseResponse(response);
    } catch (e) {
      return _handleError();
    }
  }

  // POST Method API Call
  Future<BaseApiResponse> post(String endPoint,
      {Map<String, String>? headers,
      required Map<String, dynamic> body}) async {
    final url = Uri.parse("${Urls.baseUrl}$endPoint");

    try {
      final response = await http.post(url,
          headers: headers ?? _getHeaders(), body: jsonEncode(body));
      return _parseResponse(response);
    } catch (e, stack) {
      debugPrint("Exception caught: $e\n$stack");
      // return FailureResp("Token parsing failed");
      return _handleError();
    }
  }

  // Common parser for response
  BaseApiResponse _parseResponse(http.Response response) {
    try {
      final decodedResp = jsonDecode(utf8.decode(response.bodyBytes));
      if (decodedResp["status"] == "Success") {
        return BaseApiResponse.fromJson(decodedResp);
      } else {
        return BaseApiResponse(
          status: Status.error,
          statusCode: decodedResp["statusCode"],
          message: decodedResp["message"] ?? "Backend Error",
          data: null,
          error: const ApiErrorResponse(
              errorCode: 500, errorMessage: AppConstants.serverError),
        );
      }
    } catch (e, stack) {
      debugPrint("Exception caught: $e\n$stack");
      // return FailureResp("Token parsing failed");
      return _handleError();
    }
  }

  // Generic Error Response
  BaseApiResponse _handleError() {
    return BaseApiResponse(
      status: Status.error,
      statusCode: 500,
      message: "Internal Server Error",
      data: null,
      error: const ApiErrorResponse(
          errorCode: 500, errorMessage: AppConstants.serverError),
    );
  }

  Map<String, String>? _getHeaders() {
    return {
      "Authorization": "Bearer ${Global.jwtToken}",
      "Content-Type": 'application/json'
    };
  }

  Future<BaseApiResponse> tokenGenPost(String endPoint,
      {required Map<String, dynamic> body}) async {
    // Step 1: Your credentials
    const username = 'admin';
    const password = 'boaz';

    // Step 2: Encode to Base64
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    final url = Uri.parse("${Urls.baseUrl}$endPoint");

    try {
      final response = await http.post(url,
          headers: {
            "authorization": basicAuth,
            'Content-Type': 'application/json'
          },
          body: jsonEncode(body));
      return _parseResponse(response);
    } catch (e, stack) {
      debugPrint("Exception caught: $e\n$stack");
      // return FailureResp("Token parsing failed");
      return _handleError();
    }
  }
}
