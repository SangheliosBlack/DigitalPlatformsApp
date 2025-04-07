import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/auth/application/use_cases/get_commercial_figures/get_commercial_figures_use_case.dart';
import 'package:flutter_template/features/auth/data/providers/auth_repository_provider.dart';

final getCommercialFiguresUseCaseProvider = Provider<GetCommercialFiguresUseCase>((ref){

  final authRepository = ref.read(authRepositoryProvider);

  return GetCommercialFiguresUseCase(
    authRepository: authRepository
  );

});