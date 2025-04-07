import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/release/application/use_cases/use_cases.dart';

class ReleasesUseCases {

  final Ref ref;

  ReleasesUseCases({required this.ref});

  GetAllReleasesUseCase get getAllReleases => ref.read(getAllReleasesUseCaseProvider);

  CreateNewReleaseUseCase get createNewRelease => ref.read(createNewReleaseUseCaseProvide);

}

final useCasesReleases = Provider((ref) => ReleasesUseCases(ref: ref) );
