// auth_local_data_source_impl.dart
import 'package:dio/dio.dart';
import 'package:flutter_template/core/constants/hive_box_constants.dart';
import 'package:flutter_template/core/constants/local_storage_keys.dart';
import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/core/services/cache_service/cache_service_impl.dart';
import 'package:flutter_template/core/services/local_storage/local_storage_service_impl.dart';
import 'package:flutter_template/features/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  
  final LocalStorageServiceImpl localStorageService;

  AuthLocalDataSourceImpl({required this.localStorageService});
  
  @override
  Future<void> saveToken({required String token}) async {

    await localStorageService.setValue(key: LocalStorageKeys.ACCESS_TOKEN, value: token);

  }

  @override
  Future <DataState<UserEntity>>? getCachedUser() async {
    
    final UserEntity? userEntity =  await CacheServiceImpl().getData(key: HiveBoxConstants.saveUser);

    if(userEntity != null){

      return DataSuccess(userEntity);
      
    }else{

      final error =  DioException(requestOptions: RequestOptions(path: ''),message: "Expired User Entity TTL");

      return DataFailed(error);

    }

  }

  @override
  Future<void> saveUser(UserEntity userData) async {
    
    await CacheServiceImpl().storeData(key: HiveBoxConstants.saveUser, data: userData);

    return;

  }

}
