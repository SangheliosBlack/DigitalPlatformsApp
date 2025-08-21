import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/resources/api_response.dart';
import 'package:flutter_template/core/services/http_client/http_client_service_impl.dart';
import 'package:flutter_template/core/utils/errors/datasource_exception.dart';
import 'package:flutter_template/features/version_codes/data/data_sources/remote/version_codes_remote_data_source.dart';
import 'package:flutter_template/features/version_codes/data/dtos/version_code_dto.dart';

class VersionCodesRemoteDataSourceImpl implements VersionCodesRemoteDataSource {

  final HttpClientServiceImpl httpClientService;

  VersionCodesRemoteDataSourceImpl({required this.httpClientService});

  @override
  Future<Either<String, List<VersionCodeDto>>> fetchAllVersionCodes() async {

    try {
      
      final response = await httpClientService.get(path: '/versionCodes');

        if(response.statusCode == 200){

        final apiResponse = ApiResponse<List<dynamic>>.fromJson(response.data);
        
        final versionCodes = VersionCodeDto.fromJsonList(apiResponse.data!);

        return Right(versionCodes);


      }else{

        return Left("The server returned an empty response. This could be due to an issue with the server or a timeout. Please try again later.");

      }

    } on NetworkException catch (e) {

      return Left(e.message);
      
    }

  }

}