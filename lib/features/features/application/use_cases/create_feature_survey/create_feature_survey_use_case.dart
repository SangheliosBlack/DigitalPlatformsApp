import 'package:flutter_template/features/features/application/application.dart';
import 'package:flutter_template/features/features/domain/domain.dart';
import 'package:flutter_template/core/core.dart';

class CreateFeatureSurveyUseCase {

  final FeaturesRepository repository;

  CreateFeatureSurveyUseCase({required this.repository});

  Future<DataState<FeatureEntity>> execute({required CreateFeatureSurveyRequestDto request}){

    return repository.createFeatureSurvey(request: request);

  }

}