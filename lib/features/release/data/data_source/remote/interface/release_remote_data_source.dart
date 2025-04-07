import 'package:flutter_template/features/release/application/dtos/create_release_request_dto.dart';
import 'package:flutter_template/features/release/data/dtos/dtos.dart';
import 'package:flutter_template/core/resources/data_state.dart';

abstract interface class ReleaseRemoteDataSource {

  Future<DataState<GetAllReleasesListDto>> fetchAllReleases();
  Future<DataState<CreateNewReleaseResonseDto>> createNewRelease({required CreateReleaseRequestDto requestDto});

}