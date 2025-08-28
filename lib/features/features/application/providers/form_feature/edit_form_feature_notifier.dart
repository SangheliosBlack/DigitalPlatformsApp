import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/features/application/providers/form_feature/edit_form_feature_notifier_state.dart';

class EditFormStateNotifier extends StateNotifier<EditFeatureFormState> {

  EditFormStateNotifier() : super(EditFeatureFormState());

  void updateTitle(String value) {
    state = state.copyWith(
      title: value,
    );
  }

  void updateDescription(String value) {
    state = state.copyWith(
      description: value,
    );
  }


  void updateVersionCode({required String value}) {
    state = state.copyWith(
      versionCode: value
    );
  }

  void resetForm() {
    state = EditFeatureFormState();
  }

}

final editFormFeatureProvider = StateNotifierProvider<EditFormStateNotifier, EditFeatureFormState>(
  (ref) => EditFormStateNotifier(),
);
