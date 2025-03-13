class FeatureAnswersDto {

    String id;
    String title;
    bool active;
    int value;

    FeatureAnswersDto({
        required this.id,
        required this.title,
        required this.active,
        required this.value,
    });

    factory FeatureAnswersDto.fromJson(Map<String, dynamic> json) => FeatureAnswersDto(
        id: json["_id"],
        title: json["title"],
        active: json["active"],
        value: json["value"],
    );

}
