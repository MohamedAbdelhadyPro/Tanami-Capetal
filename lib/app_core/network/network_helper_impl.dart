import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:multiple_result/multiple_result.dart';

import '../routes/app_routes.dart';
import '../routes/nav_service.dart';
import '../storage/storage_keys.dart';
import '../storage/storage_repo.dart';
import '../unit/failures.dart';
import 'network_helper.dart';

class NetworkHelperImpl extends NetworkHelper {
  StorageRepo storage;

  NetworkHelperImpl({required this.storage});

  @override
  Future<Result<String?, Failure>> get(String url,
      {Map<String, String>? headers, bool? isNeedAuth = true}) async {
    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: await appendHeader(
              head: headers ?? {},
              isNeedAuth: isNeedAuth,
            ),
          )
          .timeout(const Duration(minutes: 2));
      return handleResponse(response: response);
    } catch (e) {
      GoTo.pushNamedAndRemoveUntil(AppRoutes.serverErrorScreen);
      return const Error(
        Failure(statusCode: 0, message: ""),
      );
    }
  }

  @override
  Future<Map<String, String>> appendHeader(
      {Map<String, String>? head, bool? isNeedAuth = true}) async {
    String? language = await storage.read(StorageKeys.locale) ?? "en";

    Map<String, String> headers = {
      'Content-Type': 'application/json ; charset=utf-8',
      'Accept': 'application/json',
      'language': language,
    };
    if (head != null) {
      headers.addAll(head);
    }
    if (isNeedAuth!) {
      try {
        String? token = await storage.read(StorageKeys.authToken);
        headers.addAll({'Authorization': "Bearer $token"});
      } catch (e) {}
    }
    return headers;
  }

  @override
  Result<String?, Failure> handleResponse(
      {http.Response? response, String? requestBody}) {
    final int statusCode = response!.statusCode;
    if (statusCode >= 500) {
      Map msg = jsonDecode(utf8.decode(response.bodyBytes));
      return Error(
        Failure(message: msg['message'].toString(), statusCode: statusCode),
      );
    } else if (statusCode >= 400) {
      Map msg = jsonDecode(utf8.decode(response.bodyBytes));
      if (!msg.containsKey('message')) {
        return Error(
          Failure(message: 'Error $statusCode', statusCode: statusCode),
        );
      }
      return Error(
        Failure(message: msg['message'].toString(), statusCode: statusCode),
      );
    } else {
      try {
        return Success(utf8.decode(response.bodyBytes));
      } catch (e) {
        return Success(response.body);
      }
    }
  }
}
