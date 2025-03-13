class ListImprovementsFeaturesDto {

    String title;
    String id;

    ListImprovementsFeaturesDto({
        required this.title,
        required this.id,
    });

    factory ListImprovementsFeaturesDto.fromJson(Map<String, dynamic> json) => ListImprovementsFeaturesDto(
        title: json["title"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "_id": id,
    };

}