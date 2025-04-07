
import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/features/release/application/dtos/create_release_request_dto.dart';
import 'package:flutter_template/features/release/domain/entities/release_entity.dart';

abstract interface class ReleaseRepository {

  Future<DataState<Map<String, ReleaseEntity>>>  fetchAllReleases();

  Future<DataState<ReleaseEntity>> createNewRelease({required CreateReleaseRequestDto requestDto });

}