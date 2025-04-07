import 'package:flutter_template/features/release/application/use_cases/get_all_releases/get_all_releases_use_case.dart';
import 'package:flutter_template/features/release/domain/repository/release_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final getAllReleasesUseCaseProvider = Provider<GetAllReleasesUseCase>((ref){

  final releasesRepository = ref.read(releaseRepositoyProvider);

  return GetAllReleasesUseCase(
    repository: releasesRepository
  );

});