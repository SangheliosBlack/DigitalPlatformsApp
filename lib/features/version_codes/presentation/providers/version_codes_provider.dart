import 'package:flutter_template/features/version_codes/application/providers/version_codes_use_cases_di.dart';
import 'package:flutter_template/features/version_codes/presentation/states/version_codes_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'version_codes_provider.g.dart';

@Riverpod(keepAlive: true)
class VersionCodes extends _$VersionCodes{

  @override
  VersionCodesState build() => VersionCodesState();

  VersionCodesUseCasesDi get _useCases => ref.read(versionCodesUseCasesProvider);

  void getAllVersionCodes() async {

    final versionCodes = await _useCases.getAllVersionCode();

    versionCodes.fold(
      (error){

      }, 
      (data){
        
        state =  state.copyWith(list: data);

        if(state.versionCodeSelected.isEmpty){

          state = state.copyWith(versionCodeSelected: data.first.id);

        }

      }
    );

  }

  void updateSelectedFilter({required String versionCode}){

    final current = state.list.firstWhere((e) => e.current);

    state = state.copyWith(versionCodeSelected: versionCode.isEmpty ? current.id : versionCode);

  }
    
}