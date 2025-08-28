import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/features/application/use_cases/update_feature/update_feature.dart';
import 'package:flutter_template/features/features/domain/repository/features_repository.dart';
import 'package:flutter_template/features/features/domain/repository/features_repository_provider.dart';

final updateFeatureProvider = Provider<UpdateFeature>((ref){

  final FeaturesRepository repository = ref.watch(featuresRepositoryProvider);

  return UpdateFeature(
    repository: repository
  );

});