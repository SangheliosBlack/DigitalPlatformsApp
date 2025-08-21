import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/version_codes/application/providers/versIon_code_provider_di.dart';
import 'package:flutter_template/features/version_codes/application/use_cases/get_all_version_codes.dart';

class VersionCodesUseCasesDi {

  final Ref ref;

  VersionCodesUseCasesDi({required this.ref});

  GetAllVersionCodes get getAllVersionCode => ref.read(getAllVersionCodes);

}

final versionCodesUseCasesProvider = Provider<VersionCodesUseCasesDi>((ref) => VersionCodesUseCasesDi(ref: ref) );
