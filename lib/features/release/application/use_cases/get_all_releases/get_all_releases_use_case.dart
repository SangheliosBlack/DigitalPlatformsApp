import 'package:flutter_template/features/release/domain/entities/release_entity.dart';
import 'package:flutter_template/features/release/domain/repository/repository.dart';
import 'package:flutter_template/core/resources/data_state.dart';

class GetAllReleasesUseCase {

  final ReleaseRepository repository;

  GetAllReleasesUseCase({required this.repository});

   Future<DataState<Map<String, ReleaseEntity>>> execute(){

    return repository.fetchAllReleases();

  }

}