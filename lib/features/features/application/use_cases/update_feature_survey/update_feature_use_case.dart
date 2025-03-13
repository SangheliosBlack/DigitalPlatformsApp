import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/features/features/application/dtos/dtos.dart';
import 'package:flutter_template/features/features/domain/domain.dart';

class UpdateFeatureUseCase {

  final FeaturesRepository repository;

  UpdateFeatureUseCase({required this.repository});

  Future<DataState<FeatureEntity>> execute({required UpdateFeatureSurveyRequestDto request}){

    return repository.updateFeatureSurvey(request: request);

  }

}