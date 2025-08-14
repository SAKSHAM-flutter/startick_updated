import 'dart:convert';
import 'dart:developer';

import 'package:built_collection/built_collection.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:startick/data/local/shared_pref.dart';
import 'package:startick/data/remote/endpoints.dart';
import 'package:startick/data/remote/logging_interceptor.dart';
import 'package:startick/data/remote/model/response_dto.dart';
import 'package:startick/data/utils/log_tags.dart';
import 'package:startick/data/utils/response_parser.dart';

final http.Client _client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
  client: http.Client(),
);

dynamic _callPostApi(
  final String path,
  final Map<String, dynamic> queryParams, [
  final String? baseUrl,
]) async {
  //common headers
  final Map<String, String> header = {'Content-Type': 'application/json'};

  if (Prefs.logging.get()) {
    header.addAll({
      'token': Prefs.authToken.get(),
      'Authorization': 'Bearer ${Prefs.authToken.get()}',
      'Cookie': 'PHPSESSID=7bbb7ddd43c0a5848e947f7a92ff4709',
    });
  }
  //creating the REST Endpoint Url
  Uri? uri;
  if (Endpoints.login == path) {
    uri = Uri(
      scheme: 'https',
      host: baseUrl ?? Endpoints.authority,
      path: path,
    );
  } else if (Prefs.baseUrl.getSafe() != null) {
    uri = Uri.tryParse("${Prefs.baseUrl.get()}$path");
  }

  if (uri == null) {
    throw Exception("No Url Found!!");
  }

  //calling the REST API
  final http.Response res = await _client.post(
    uri,
    body: json.encode(queryParams),
    headers: header,
  );

  return jsonDecode(res.body);
}

dynamic _callGetApi(
  final String path,
  final Map<String, String> queryParams, [
  final String? baseUrl,
]) async {
  //common headers
  // final Map<String, String> header = {'Content-Type': 'application/json'};
  final Map<String, String> header = {};
  if (Prefs.logging.get()) {
    header.addAll({'token': Prefs.authToken.get()});
  }
  //creating the REST Endpoint Url
  Uri? uri;
  if (Endpoints.login == path) {
    uri = Uri(
      scheme: 'https',
      host: baseUrl ?? Endpoints.authority,
      path: path,
      queryParameters: queryParams,
    );
  } else if (Prefs.baseUrl.getSafe() != null) {
    uri = Uri.tryParse("${Prefs.baseUrl.get()}$path");
  }

  if (uri == null) {
    throw Exception("No Url Found!!");
  }

  //calling the REST API
  final http.Response res = await _client.get(
    uri,
    headers: header,
  );

  return jsonDecode(res.body);
}

Future<ResponseDto<T?>> httpGet<T>(
  final String path,
  final Map<String, String> queryParams, [
  final String? baseUrl,
]) async {
  final response = await _callGetApi(path, queryParams, baseUrl);
  return parseResponseDto<T>(response);
}

Future<ResponseDto<T?>> httpPost<T>(
  final String path,
  final Map<String, dynamic> queryParams, [
  final String? baseUrl,
]) async {
  final response = await _callPostApi(path, queryParams, baseUrl);
  return parseResponseDto<T>(response);
}

Future<ResponseDto<BuiltList<T>?>> httpGetList<T>(
  final String path,
  final Map<String, String> queryParams, [
  final String? baseUrl,
]) async {
  final response = await _callGetApi(path, queryParams, baseUrl);
  log(queryParams.toString(), name: LogTags.apiCall);
  log(response.toString(), name: LogTags.apiCall);
  return parseResponseList<T>(response);
}

Future<ResponseDto<BuiltList<T>>> httpPostList<T>(
  final String path,
  final Map<String, dynamic> queryParams, [
  final String? baseUrl,
]) async {
  final response = await _callPostApi(path, queryParams, baseUrl);
  log(queryParams.toString(), name: LogTags.apiCall);
  log(response.toString(), name: LogTags.apiCall);
  return parseResponseList<T>(response);
}

Future<http.Response> multiPart(final String path,
    final Map<String, String> queryParams, final String apiType) async {
  Uri uri = Uri(
      scheme: "https",
      host: Endpoints.authority,
      path: path,
      queryParameters: queryParams.isNotEmpty ? queryParams : null);

  http.MultipartRequest request = http.MultipartRequest(apiType, uri);
  if (Prefs.logging.get()) {
    request.headers.addAll({
      'token': Prefs.authToken.get(),
      'Authorization': 'Bearer ${Prefs.authToken.get()}',
    });
  }

  final streamedResponse = await request.send();
  final response = await http.Response.fromStream(streamedResponse);
  log('APi Response ${response.body}', name: LogTags.apiCall);

  return response;
}

Future<ResponseDto<T?>> httpPostMultiPart<T>(
    final String path, final Map<String, String> queryParams) async {
  http.Response response = await multiPart(path, queryParams, "POST");
  return parseResponseDto<T>(jsonDecode(response.body));
}

Future<ResponseDto<BuiltList<T>>> httpPostListPart<T>(
    final String path, final Map<String, String> queryParams) async {
  http.Response response = await multiPart(path, queryParams, "POST");
  return parseResponseList<T>(jsonDecode(response.body));
}

Future<ResponseDto<BuiltList<T>>> httpGetListPart<T>(
    final String path, final Map<String, String> queryParams) async {
  http.Response response = await multiPart(path, queryParams, "GET");
  return parseResponseList<T>(jsonDecode(response.body));
}
