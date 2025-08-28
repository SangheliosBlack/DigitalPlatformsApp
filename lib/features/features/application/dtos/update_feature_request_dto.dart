class UpdateFeatureRequestDto {

  final String featureId;
  final String title;
  final String description;
  final String versionCode;

  UpdateFeatureRequestDto({
    required this.featureId, 
    required this.title, 
    required this.description,
    required this.versionCode
  });  

  toJson() {
    return {
      'title': title,
      'description': description,
      'version_code': versionCode
    };
  }

}