class FormState {
  final String title;
  final String description;
  final String? emailError;
  final String? passwordError;
  final List<String> improvements;

  FormState({
    this.title = '',
    this.description = '',
    this.emailError,
    this.passwordError,
    this.improvements = const [],
  });

  bool get isValid {
    
    return title.isNotEmpty && description.isNotEmpty && improvements.isNotEmpty;}

  FormState copyWith({
    String? title,
    String? description,
    String? emailError,
    String? passwordError,
    List<String>? improvements,
  }) {
    return FormState(
      title: title ?? this.title,
      description: description ?? this.description,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      improvements: improvements ?? this.improvements,
    );
  }
}
