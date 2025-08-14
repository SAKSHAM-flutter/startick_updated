import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:startick/data/utils/log_tags.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  FutureOr<BaseRequest> interceptRequest({required BaseRequest request}) async {
    developer.log('>>>----------->>> Calling API: ${request.url}',
        name: LogTags.apiCall);
    developer.log('Request Headers: ${request.headers}', name: LogTags.apiCall);
    developer.log('Request Url: ${request.toString()}', name: LogTags.apiCall);

    if (request is http.Request) {
      developer.log('Request Body: ${request.body}', name: LogTags.apiCall);
      // request.headers.clear();
      // request.headers['Content-Type'] = 'application/json';
    } else if (request is http.MultipartRequest) {
      // Handle multipart requests
      developer.log('Multipart Fields: ${request.fields}',
          name: LogTags.apiCall);
      developer.log('Multipart Files: ${request.files}', name: LogTags.apiCall);
    } else {
      developer.log('Request Body: Unable to log body for this request type.',
          name: LogTags.apiCall);
    }

    return request;
  }

  @override
  FutureOr<BaseResponse> interceptResponse(
      {required BaseResponse response}) async {
    developer.log(
        '<<<------------<<< API Response for: ${response.request?.url}',
        name: LogTags.apiCall);
    developer.log('Response Status Code: ${response.statusCode}',
        name: LogTags.apiCall);
    developer.log('Response Headers: ${response.headers}',
        name: LogTags.apiCall);
    if (response is Response) {
      // For regular responses, log the body directly
      try {
        const encoder = JsonEncoder.withIndent('  ');
        final prettyJson = encoder.convert(jsonDecode(response.body));
        developer.log('Response Body (formatted):\n$prettyJson',
            name: LogTags.apiCall);
      } catch (e) {
        developer.log('Failed to parse response as JSON',
            name: LogTags.apiCall);
        developer.log('Response Body (raw): ${response.body}',
            name: LogTags.apiCall);
      }
    } else {
      developer.log('Unknown response type. Unable to log body.',
          name: LogTags.apiCall);
    }
    return response;
  }

  @override
  FutureOr<bool> shouldInterceptResponse() {
    // Always intercept responses; return true if interception is required
    return true;
  }

  @override
  FutureOr<bool> shouldInterceptRequest() {
    // Always intercept requests; return true if interception is required
    return true;
  }
}
