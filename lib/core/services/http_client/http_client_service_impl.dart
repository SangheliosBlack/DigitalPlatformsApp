import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/constants/local_storage_keys.dart';
import 'package:flutter_template/core/utils/errors/datasource_exception.dart';
import 'package:flutter_template/core/constants/environments.dart';
import 'package:flutter_template/core/resources/handle_api_request.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

import '../local_storage/local_storage_service.dart';
import 'http_client.dart';


import 'dart:typed_data';



class HttpClientServiceImpl extends HttpClientService {

  late final Dio _dio;

  final Ref<HttpClientService> ref;

  final LocalStorageService localStorageService;

  HttpClientServiceImpl({required this.localStorageService, required this.ref}) {
    
    _dio = Dio(
      BaseOptions(baseUrl: '${Environments.PATH_URL}/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}'),
    );
    
    _dio.interceptors.clear();
    _dio.interceptors.add(HttpClientInterceptor(localStorageService: localStorageService));
    
    /*
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
    */

  } 

  @override
  Future post({required String path, Map<String, dynamic>? data}) async {

  return handleApiRequest(() async {
      return await _dio.post(path, data: data);
    });
  }

  

  @override
  Future get({required String path}) async {

    try {

      final Response<dynamic>  response = await _dio.get(path);

      return response;

    } on DioException catch (e) {

      throw NetworkException(message: e.response?.statusMessage ?? "", statusCode: e.response!.statusCode ?? 0);

    }

  }

  @override
  Future delete({required String path}) async {

    try {

      final Response<dynamic>  response = await _dio.delete(path);

      return response;

    } on DioException catch (e) {

      throw NetworkException(message: e.response?.statusMessage ?? "", statusCode: e.response!.statusCode ?? 0);

    }

  }

  @override
  Future put({required String path, required Map<String, dynamic> data}) async {

    try {

      final Response<dynamic>  response = await _dio.put(path, data: data);

      return response;

    } on DioException catch (e) {

      throw NetworkException(message: e.response?.statusMessage ?? "", statusCode: e.response!.statusCode?? 0);

    }
    
  }
  
  @override
  Future patch({required String path, Map<String, dynamic>? data}) async {
    
    try {

      final Response<dynamic>  response = await _dio.patch(path, data: data);

      return response;

    } on DioException catch (e) {

      throw NetworkException(message: e.response?.statusMessage ?? "", statusCode: e.response!.statusCode?? 0);

    }

  }


  @override
  Future postMultiPartRaw({required String path, Map<String, dynamic>? data, File? file,Uint8List? fileBytes, String? fileName}) async {

    FormData formData = FormData();

  if (file != null) {
    
    if (kIsWeb) {

       formData.files.add(MapEntry(
            'image',
            MultipartFile.fromBytes(
              fileBytes ?? [],
              filename: fileName,
              contentType: MediaType.parse(_getMimeType(fileName ?? "")),
            ),
          ));
        
    } else {
      // Flutter Mobile/Desktop
      formData.files.add(MapEntry(
        'image',
        await MultipartFile.fromFile(
          file.path,
          filename: basename(file.path),
          contentType:MediaType.parse(_getMimeType(file.path)),
        ),
      ));
    }
  }

    if (data != null) {
      data.forEach((key, value) {
      formData.fields.add(MapEntry(key, value.toString()));
      });
    }

    final accessToken = await localStorageService.getValue(key: LocalStorageKeys.ACCESS_TOKEN);

    final Response<dynamic> response = await _dio.post(
      path,
      data: formData,
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'multipart/form-data',
        },
      ),
    );

    return response;
  }

  String _getMimeType(String filePath) {
    String ext = extension(filePath).toLowerCase();
    switch (ext) {
      case '.jpg':
      case '.jpeg':
        return 'image/jpeg';
      case '.png':
        return 'image/png';
      case '.gif':
        return 'image/gif';
      default:
        return 'application/octet-stream';
    }
}

/*

Future<Uint8List> fileToUint8List(dynamic file) async {
  if (kIsWeb) {
    
     final reader = html.FileReader();
    final completer = Completer<Uint8List>();

    reader.onLoadEnd.listen((event) {
      completer.complete(reader.result as Uint8List);
    });
  

    reader.readAsArrayBuffer(file);

    return completer.future;
  } else {
    return await (file as File).readAsBytes();
  }
}
*/

}
