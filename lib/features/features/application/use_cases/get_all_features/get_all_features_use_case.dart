import 'package:flutter_template/features/features/domain/domain.dart';
import 'package:flutter_template/core/core.dart';

class GetAllFeaturesUseCase {

  final FeaturesRepository repository;

  GetAllFeaturesUseCase({required this.repository});

  Future<DataState<Map<String, FeatureEntity>>>  execute(){

    return repository.fetchAllFeatures();

  }

}