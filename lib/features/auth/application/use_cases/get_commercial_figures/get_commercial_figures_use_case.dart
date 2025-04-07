import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/features/auth/domain/entities/commercial_figure_entity.dart';
import 'package:flutter_template/features/auth/domain/repository/auth_repository.dart';

class GetCommercialFiguresUseCase  {
   
  final AuthRepository authRepository;

  GetCommercialFiguresUseCase({required this.authRepository});

  Future<DataState<List<CommercialFigureEntity>>> execute() {

    return authRepository.getAllCommercialFigues();
    
  }

}