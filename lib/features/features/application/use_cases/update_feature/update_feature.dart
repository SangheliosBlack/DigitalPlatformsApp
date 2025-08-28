import 'package:dartz/dartz.dart';
import 'package:flutter_template/features/features/application/dtos/update_feature_request_dto.dart';
import 'package:flutter_template/features/features/domain/domain.dart';

class UpdateFeature {

  final FeaturesRepository repository;

  UpdateFeature({required this.repository});

  Future<Either<String,FeatureEntity>> call({required UpdateFeatureRequestDto request}){

    return repository.updateFeature(request: request);

  }

}