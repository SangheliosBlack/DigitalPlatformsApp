import 'package:flutter_template/features/features/application/dtos/create_feature_request_dto.dart';
import 'package:flutter_template/features/features/application/dtos/create_feature_survey_dto.dart';
import 'package:flutter_template/features/features/application/dtos/update_feature_survey_request_dto.dart';
import 'package:flutter_template/features/features/data/data_sources/datasources.dart';
import 'package:flutter_template/features/features/data/dtos/dtos.dart';
import 'package:flutter_template/core/core.dart';
import 'package:dio/dio.dart';

class FeatureRemoteDatasourceImpl implements FeaturesRemoteDataSource {

  final HttpClientServiceImpl httpClientService;

  FeatureRemoteDatasourceImpl({required this.httpClientService});

  @override
  Future<DataState<GetAllFeaturesListDto>> fetchAllFeatures() async {

    try {
      
      final response = await httpClientService.get(path: '/features');

     if(response.statusCode == 200){

        final apiResponse = ApiResponse<List<dynamic>>.fromJson(response.data);
        
        final userLoginResponseDTO = GetAllFeaturesListDto.fromJson(apiResponse.data!);

        return DataSuccess(userLoginResponseDTO);


      }else{

        return DataFailed(DioException(
          message: "The server returned an empty response. This could be due to an issue with the server or a timeout. Please try again later.",
          requestOptions: RequestOptions(
            path: '/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}/features',
          ),
        ));

      }

    } on NetworkException catch (e) {

      return DataFailed(DioException(
        message: e.message,
        requestOptions: RequestOptions(
          path: '/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}/features',
        ),
      ));

    }

  }
  
  @override
  Future<DataState<FeatureDto>> createFeature({required CreateFeatureRequestDto request}) async {
    
    try {

      final data = {
        "title": request.title,
        "description": request.description,
        "list_improvements" : request.listImprovements,
        "status": request.status
      };
      
      final response = await httpClientService.post(path: '/features',data: data);

     if(response.statusCode == 200){

        final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);

        final featureResponseDto = FeatureDto.fromJson(apiResponse.data!);

        return DataSuccess(featureResponseDto);


      }else{

        return DataFailed(DioException(
          message: "The server returned an empty response. This could be due to an issue with the server or a timeout. Please try again later.",
          requestOptions: RequestOptions(
            path: '/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}/features',
          ),
        ));

      }

    } on NetworkException catch (e) {

      return DataFailed(DioException(
        message: e.message,
        requestOptions: RequestOptions(
          path: '/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}/features',
        ),
      ));

    }

  }

  @override
  Future<DataState<FeatureDto>> createFeatureSurvey({required CreateFeatureSurveyRequestDto request}) async {

    try {

      final response = await httpClientService.post(path: '/featureSurvey',data: request.toJson());

      if(response.statusCode == 200){

        final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);

        final featureResponseDto = FeatureDto.fromJson(apiResponse.data!);

        return DataSuccess(featureResponseDto);

      }else{

        return DataFailed(DioException(
          message: "The server returned an empty response. This could be due to an issue with the server or a timeout. Please try again later.",
          requestOptions: RequestOptions(
            path: '/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}/features',
          ),
        ));

      }


    } on NetworkException catch (e) {

      return DataFailed(DioException(
        message: e.message,
        requestOptions: RequestOptions(
          path: '/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}/features',
        ),
      ));

    }

  }

  @override
  Future<DataState<FeatureDto>> updateFeatureSurvey({required UpdateFeatureSurveyRequestDto request}) async {
    
    try {

      final response = await httpClientService.patch(path: '/featureSurvey',data: request.toJson());

      if(response.statusCode == 200){

        final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(response.data);

        final featureResponseDto = FeatureDto.fromJson(apiResponse.data!);

        return DataSuccess(featureResponseDto);

      }else{

        return DataFailed(DioException(
          message: "The server returned an empty response. This could be due to an issue with the server or a timeout. Please try again later.",
          requestOptions: RequestOptions(
            path: '/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}/features',
          ),
        ));

      }


    } on NetworkException catch (e) {

      return DataFailed(DioException(
        message: e.message,
        requestOptions: RequestOptions(
          path: '/api/${Environments.API_VERSION}/${Environments.ENVIROMENT}/features',
        ),
      ));

    }

  }

}