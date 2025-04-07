class UserProfileEntity {
  
  String id;
  String fullName;
  String imageUrl;

  UserProfileEntity({
      required this.id,
      required this.fullName,
      required this.imageUrl,
  });

  factory UserProfileEntity.fromJson(Map<String, dynamic> json) => UserProfileEntity(
      id: json["_id"],
      fullName: json["full_name"],
      imageUrl: json["image_url"],
  );

  Map<String, dynamic> toMap() => {
      "_id": id,
      "full_name": fullName,
      "image_url": imageUrl,
  };
}