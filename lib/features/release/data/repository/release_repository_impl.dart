import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/features/release/application/dtos/create_release_request_dto.dart';
import 'package:flutter_template/features/release/data/data_source/remote/interface/release_remote_data_source.dart';
import 'package:flutter_template/features/release/data/mappers/get_all_releases_mapper_list.dart';
import 'package:flutter_template/features/release/data/mappers/release_mapper.dart';
import 'package:flutter_template/features/release/domain/domain.dart';

class ReleaseRepositoryImpl implements ReleaseRepository  {

  final ReleaseRemoteDataSource remoteDataSource;

  ReleaseRepositoryImpl({
    required this.remoteDataSource
  });

  @override
  Future<DataState<Map<String, ReleaseEntity>>> fetchAllReleases() async {

    final remoteResponse = await remoteDataSource.fetchAllReleases();

    if(remoteResponse is DataSuccess){

      final responseToEntity = GetAllReleasesListMapper.fromDtoList(dtoList: remoteResponse.data!);

      return DataSuccess(responseToEntity);

    }

    return DataFailed(remoteResponse.error!);

  }

  @override
  Future<DataState<ReleaseEntity>> createNewRelease({required CreateReleaseRequestDto requestDto}) async {

    final remoteResponse = await remoteDataSource.createNewRelease(requestDto: requestDto);

    if(remoteResponse is DataSuccess){

      final responseToEntity = ReleaseMapper.fromDto(dto: remoteResponse.data!.newRelease);

      return DataSuccess(responseToEntity);

    }

    return DataFailed(remoteResponse.error!);

  }

}