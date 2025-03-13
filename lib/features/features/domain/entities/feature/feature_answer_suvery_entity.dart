class AnswerSurveryEntity {

    String id;
    String comment;
    String feature;
    int ratingFeature;
    DateTime createdAt;

    AnswerSurveryEntity({
      required this.id,
      required this.comment,
      required this.feature,
      required this.ratingFeature,
      required this.createdAt,
    });

    bool get answerComplete{

      return comment.isNotEmpty && id.isNotEmpty;

    }

}
