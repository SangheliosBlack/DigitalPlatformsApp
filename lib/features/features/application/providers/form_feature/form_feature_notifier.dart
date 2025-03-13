import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/features/application/providers/form_feature/form_feature_notifier_state.dart';

class FormStateNotifier extends StateNotifier<FormState> {
  FormStateNotifier() : super(FormState());

  void updateTitle(String value) {
    state = state.copyWith(
      title: value,
      emailError: _validateEmail(value),
    );
  }

  void updateDescription(String value) {
    state = state.copyWith(
      description: value,
      passwordError: _validatePassword(value),
    );
  }

  void updateImprovements({required String improvement, required int index}) {

    final improvements = List<String>.from(state.improvements);

    if (index >= 0 && index < improvements.length) {
      improvements[index] = improvement;
    } else {

      if (improvement.split(' ').length > 1 && !improvements.contains(improvement)) {
        improvements.add(improvement);
      }

      if(state.improvements.isEmpty){

        improvements.add(improvement);

      }

    }

    state = state.copyWith(improvements: improvements);
  }

  void resetForm() {
    state = FormState();
  }

  String? _validateEmail(String email) {
    if (email.isEmpty) return 'El email es obligatorio';
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      return 'Email no válido';
    }
    return null;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) return 'La contraseña es obligatoria';
    if (password.length < 6) return 'Debe tener al menos 6 caracteres';
    return null;
  }
}

final formProvider = StateNotifierProvider<FormStateNotifier, FormState>(
  (ref) => FormStateNotifier(),
);
