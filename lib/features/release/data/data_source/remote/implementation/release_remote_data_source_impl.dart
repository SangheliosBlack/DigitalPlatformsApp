import 'package:dio/dio.dart';
import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/features/release/application/dtos/create_release_request_dto.dart';
import 'package:flutter_template/features/release/data/data_source/remote/remote.dart';
import 'package:flutter_template/features/release/data/dtos/create_release/create_new_release_resonse_dto.dart';
import 'package:flutter_template/features/release/data/dtos/get_all_releases/get_all_releases_response_dto.dart';

class FeatureRemoteDataSourceImpl implements ReleaseRemoteDataSource {

  final HttpClientServiceImpl httpClientService;

  FeatureRemoteDataSourceImpl({required this.httpClientService});

  @override
  Future<DataState<GetAllReleasesListDto>> fetchAllReleases() async {

    try {
      
      final response = await httpClientService.get(path: '/releases');

        if(response.statusCode == 200){

        final apiResponse = ApiResponse<List<dynamic>>.fromJson(response.data);
        
        final userLoginResponseDTO = GetAllReleasesListDto.fromJson(apiResponse.data!);

        return DataSuccess(userLoginResponseDTO);


      }else{

        return DataFailed(DioException(
          message: "The server returned an empty response. This could be due to an issue with the server or a timeout. Please try again later.",
          requestOptions: RequestOptions(
            path: '/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}/releases',
          ),
        ));

      }

    } on NetworkException catch (e) {

        return DataFailed(DioException(
        message: e.message,
        requestOptions: RequestOptions(
          path: '/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}/releases',
        ),
      ));
      
    }

  }

  @override
  Future<DataState<CreateNewReleaseResonseDto>> createNewRelease({required CreateReleaseRequestDto requestDto}) async {
    
    try {
      
      final response = await httpClientService.postMultiPartRaw(path: '/releases',data: requestDto.toJson(),file: requestDto.file, fileBytes: requestDto.fileBytes,fileName: requestDto.fileName);

      if(response.statusCode == 200 || response.statusCode == 201 ){

        final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);
        
        final createNewReleaseDto = CreateNewReleaseResonseDto.fromJson(jsonMap: apiResponse.data!);

        return DataSuccess(createNewReleaseDto);


      }else{

        return DataFailed(DioException(
          message: "The server returned an empty response. This could be due to an issue with the server or a timeout. Please try again later.",
          requestOptions: RequestOptions(
            path: '/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}/releases',
          ),
        ));

      }

    } on NetworkException catch (e) {

        return DataFailed(DioException(
        message: e.message,
        requestOptions: RequestOptions(
          path: '/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}/releases',
        ),
      ));
      
    }


  }

  

}