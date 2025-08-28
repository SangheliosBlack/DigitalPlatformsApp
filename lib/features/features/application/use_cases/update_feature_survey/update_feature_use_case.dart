import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/features/features/application/dtos/dtos.dart';
import 'package:flutter_template/features/features/domain/domain.dart';

class UpdateFeatureSurveyUseCase {

  final FeaturesRepository repository;

  UpdateFeatureSurveyUseCase({required this.repository});

  Future<DataState<FeatureEntity>> execute({required UpdateFeatureSurveyRequestDto request}){

    return repository.updateFeatureSurvey(request: request);

  }

}