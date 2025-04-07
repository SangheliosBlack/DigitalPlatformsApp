import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/release/application/use_cases/create_new_release/create_new_relesae_use_case.dart';
import 'package:flutter_template/features/release/domain/repository/release_repository_provider.dart';

final createNewReleaseUseCaseProvide =  Provider<CreateNewReleaseUseCase>((ref){

  final releasesRepository = ref.read(releaseRepositoyProvider);

  return CreateNewReleaseUseCase(
    repository: releasesRepository
  );

});