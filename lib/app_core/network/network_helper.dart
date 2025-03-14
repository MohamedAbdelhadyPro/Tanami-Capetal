import 'package:http/http.dart' as http;
import 'package:multiple_result/multiple_result.dart';

import '../unit/failures.dart';

abstract class NetworkHelper {
  Future<Result<String?, Failure>> get(String url,
      {Map<String, String>? headers, bool isNeedAuth});

  Future<Map<String, String>> appendHeader(
      {Map<String, String>? head, bool isNeedAuth});

  Result<String?, Failure> handleResponse({http.Response response});
}
