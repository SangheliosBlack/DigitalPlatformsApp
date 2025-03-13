import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/features/features/application/application.dart';
import 'package:flutter_template/features/features/domain/domain.dart';

class CreateFeatureUseCase {

  final FeaturesRepository repository;

  CreateFeatureUseCase({required this.repository});

  Future<DataState<FeatureEntity>> execute({required CreateFeatureRequestDto request}){

    return repository.createFeature(request: request);

  }

}