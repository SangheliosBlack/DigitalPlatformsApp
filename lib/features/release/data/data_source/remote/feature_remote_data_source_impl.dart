import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/features/release/data/data_source/remote/remote.dart';

class FeatureRemoteDataSourceImpl implements FeatureRemoteDataSource {

  final HttpClientServiceImpl httpClientService;

  FeatureRemoteDataSourceImpl({required this.httpClientService});

  

}