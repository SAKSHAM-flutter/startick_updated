import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:startick/data/local/shared_pref.dart';
import 'package:startick/data/remote/endpoints.dart';
import 'package:startick/data/remote/model/response_dto.dart';
import 'package:startick/data/utils/log_tags.dart';
import 'package:startick/data/utils/response_parser.dart';

///Helper class for uploading single and multiple multipart files.
///@param path The path of the api endpoint.
///@param fields Map of fields to be added along with files.
///@param multipleFiles List of file paths to be uploaded.
class FileUploadHelper {
  FileUploadHelper(
      {required String path,
      this.apiType,
      required Map<String, String> fields,
      MultipleFiles? multipleFiles,
      Map<String, String>? headers})
      : _path = path,
        _fields = fields,
        _multipleFiles = multipleFiles,
        _headers =
            headers ?? {'Authorization': 'Bearer ${Prefs.authToken.get()}'};

  final String _path;
  final String? apiType;
  final Map<String, String> _fields;
  final MultipleFiles? _multipleFiles;
  final Map<String, String> _headers;
  late http.MultipartRequest request;

  Future<http.Response> startUpload() async {
    final endpoint = Uri.parse("${Endpoints.baseUrl}/${Endpoints.path}/$_path");
    request = http.MultipartRequest(
      apiType ?? "POST",
      endpoint,
    );

    await _addMultipleFiles();
    _addHeaders();
    _addFields();

    log('Starting File upload at $endpoint', name: LogTags.apiCall);
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    log('File Upload Completed ${response.body}', name: LogTags.apiCall);

    return response;
  }

  Future<ResponseDto<T?>> startUploadParsed<T>() async {
    final response = await startUpload();
    return parseResponseDto<T>(jsonDecode(response.body));
  }

  Future<void> _addMultipleFiles() async {
    //adding multiple files if present
    if (_multipleFiles == null) return;
    final multipleFiles = _multipleFiles;
    log(Prefs.authToken.get(), name: LogTags.initialDataLoad);
    final Iterable<Future<http.MultipartFile>> fileFutures =
        multipleFiles.filePaths.map((path) {
      return http.MultipartFile.fromPath(
        multipleFiles.fileFieldName,
        path,
        // contentType: MediaType("image", "jpeg"),
      );
    });
    final List<http.MultipartFile> files = await Future.wait(fileFutures);
    request.files.addAll(files);
  }

  void _addHeaders() {
    request.headers.addAll(_headers);
  }

  void _addFields() {
    request.fields.addAll(_fields);
  }
}

class MultipleFiles {
  List<String> filePaths;
  String fileFieldName;

  MultipleFiles({required this.fileFieldName, required this.filePaths});
}
