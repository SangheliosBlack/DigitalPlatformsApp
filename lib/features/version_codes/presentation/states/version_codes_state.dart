import 'package:flutter_template/features/version_codes/domain/entities/version_code_entity.dart';

class VersionCodesState {

  final List<VersionCodeEntity> list;
  final String versionCodeSelected;

  VersionCodesState({
    this.list = const [],
    this.versionCodeSelected = ""
  });

  VersionCodeEntity? get getCurrentVersionCode {

    if(list.isEmpty) return null;

    if(versionCodeSelected.isEmpty) return list.firstWhere((e)=> e.current);

    return list.firstWhere( (version) => version.id == versionCodeSelected);

  }

  VersionCodesState copyWith({
    List<VersionCodeEntity>? list,
    String? versionCodeSelected
  }) {
    return VersionCodesState(
      list: list ?? this.list,
      versionCodeSelected :  versionCodeSelected ?? this.versionCodeSelected
    );
  }
  
}
