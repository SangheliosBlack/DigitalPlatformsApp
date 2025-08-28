import 'package:flutter_template/features/features/domain/domain.dart';
import 'package:flutter_template/core/core.dart';

class GetAllFeaturesUseCase {

  final FeaturesRepository repository;

  GetAllFeaturesUseCase({required this.repository});

  Future<DataState<Map<String, FeatureEntity>>> call({required String versionCode}){

    return repository.fetchAllFeatures(versionCode: versionCode);

  }

}