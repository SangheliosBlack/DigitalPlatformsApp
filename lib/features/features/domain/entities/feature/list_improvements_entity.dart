class ListImprovementEntity {
  
  String title;
  String id;

  ListImprovementEntity({
      required this.title,
      required this.id,
  });

  factory ListImprovementEntity.fromJson(Map<String, dynamic> json) => ListImprovementEntity(
      title: json["title"],
      id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
      "title": title,
      "_id": id,
  };
}