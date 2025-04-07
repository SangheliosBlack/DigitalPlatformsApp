import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter_template/features/release/application/dtos/create_release_request_dto.dart';
import 'package:flutter_template/features/release/application/providers/form_release/form_release_notifier.dart';
import 'package:flutter_template/features/release/application/use_cases/use_cases.dart';
import 'package:flutter_template/features/release/domain/entities/entities.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'releases_provider.g.dart';

@Riverpod(keepAlive: true)
class Releases extends _$Releases{

  @override
    ReleasesState build() {

      return ReleasesState();
    
    }

    ReleasesUseCases get useCases => ref.read(useCasesReleases);

    Future<void> fetchAllReleases() async {

      final response = await useCases.getAllReleases.execute();

      if(response is DataSuccess){

        state = state.copyWith(releases: response.data);

      }

    }

    Future<void> createNewRelease() async{

      state = state.copyWith(isLoading: true);
      
      final formReleaseState = ref.read(releaseFormProvider);

      final commercialFigure = ref.watch(authProvider).commercialFigureIdSelected;

      final requestDto = CreateReleaseRequestDto(
        title: formReleaseState.title,
        description: formReleaseState.description,
        file: formReleaseState.file,
        quarter: 1, 
        commercialFigure: commercialFigure,
        fileBytes: formReleaseState.fileBytes,
        fileName: formReleaseState.fileName
      );

      final response = await useCases.createNewRelease.execute(requestDto: requestDto);

      if(response is DataSuccess){

        final newRelease = response.data;

        final List<MapEntry<String, ReleaseEntity>> releasesList = [
          MapEntry(newRelease!.id, newRelease),
          ...state.releases.entries, 
        ];
  
        final updatedFeatures = Map<String, ReleaseEntity>.fromEntries(releasesList);
        
        ref.read(releaseFormProvider.notifier).resetForm();
        
        state = state.copyWith(
          releases: updatedFeatures,
          isLoading: false
        );

      }

    }

}