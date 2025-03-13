import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/auth/data/providers/auth_repository_provider.dart';
import 'package:flutter_template/features/auth/domain/usecases/load_user.dart';

final loadUserCaseProvider = Provider<LoadUserCase>((ref){

  final authRepository = ref.read(authRepositoryProvider);

  return LoadUserCase(authRepository);

});