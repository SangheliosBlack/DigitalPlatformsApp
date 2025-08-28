class CreateFeatureRequestDto {

  final String title;
  final String description;
  final List<String> listImprovements;
  final int status;
  final String commercialFigure;
  final String versionCode;

  CreateFeatureRequestDto({
    required this.title,
    required this.description,
    required this.listImprovements,
    required this.status,
    required this.commercialFigure,
    required this.versionCode
  });

   Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'list_improvements': listImprovements,
      'status': status,
      'commercial_figure': commercialFigure,
      'version_code' : versionCode
    };
  }

}