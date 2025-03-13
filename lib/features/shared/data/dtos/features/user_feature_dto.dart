class UserFeatureDto {
  
    String id;
    String fullName;
    String imageUrl;

    UserFeatureDto({
        required this.id,
        required this.fullName,
        required this.imageUrl,
    });

    factory UserFeatureDto.fromJson(Map<String, dynamic> json) => UserFeatureDto(
        id: json["_id"],
        fullName: json["full_name"],
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "full_name": fullName,
        "image_url": imageUrl,
    };
}
