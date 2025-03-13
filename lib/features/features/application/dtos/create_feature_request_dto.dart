class CreateFeatureRequestDto {

  final String title;
  final String description;
  final List<String> listImprovements;
  final int status;

  CreateFeatureRequestDto({
    required this.title,
    required this.description,
    required this.listImprovements,
    required this.status,
  });

}