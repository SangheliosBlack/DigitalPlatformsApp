class EditFeatureFormState {

  final String title;
  final String description;
  final String versionCode;

  EditFeatureFormState({
    this.title = '',
    this.description = '',
    this.versionCode = ""
  });

  bool get isValid {
    
    return title.isNotEmpty && description.isNotEmpty;

  }

  EditFeatureFormState copyWith({
    String? title,
    String? description,
    String? versionCode,
  }) {
    return EditFeatureFormState(
      title: title ?? this.title,
      description: description ?? this.description,
      versionCode: versionCode ?? this.versionCode
    );
  }
}
