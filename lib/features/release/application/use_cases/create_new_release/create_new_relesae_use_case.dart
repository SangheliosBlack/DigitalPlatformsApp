import 'package:flutter_template/core/core.dart';

import 'package:flutter_template/features/release/application/dtos/create_release_request_dto.dart';
import 'package:flutter_template/features/release/domain/domain.dart';

class CreateNewReleaseUseCase {

  final ReleaseRepository repository;

  CreateNewReleaseUseCase({required this.repository});

  Future<DataState<ReleaseEntity>> call({required CreateReleaseRequestDto requestDto}){

    return repository.createNewRelease(requestDto: requestDto);

  }

}  
