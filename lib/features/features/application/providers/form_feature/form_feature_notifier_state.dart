class FormState {
  final String title;
  final String description;
  final String? emailError;
  final String? passwordError;
  final List<String> improvements;
  final String versionCode;

  FormState({
    this.title = '',
    this.description = '',
    this.emailError,
    this.passwordError,
    this.improvements = const [],
    this.versionCode = ""
  });

  bool get isValid {
    
    return title.isNotEmpty && description.isNotEmpty && improvements.isNotEmpty;}

  FormState copyWith({
    String? title,
    String? description,
    String? emailError,
    String? passwordError,
    List<String>? improvements,
    String? versionCode
  }) {
    return FormState(
      title: title ?? this.title,
      description: description ?? this.description,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      improvements: improvements ?? this.improvements,
      versionCode: versionCode ?? this.versionCode
    );
  }
}
