import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/release/application/providers/form_release/form_release.dart';

class ReleaseFormStateNotifier extends StateNotifier<ReleaseFormState> {

  ReleaseFormStateNotifier() : super(ReleaseFormState());

  Future<void> pickFile() async {

    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image, 
    );

      if (result != null) {

        state = state.copyWith(
          file: File(result.files.first.path!),
          fileBytes: result.files.first.bytes,
          fileName: result.files.first.name
        );

      }
      

  }

  void clearFile() {
    state = state.copyWith(
      file: null,
      fileBytes: null,
      fileName: null
    );
  }


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

  void resetForm() {
    state = ReleaseFormState();
  }

}

final releaseFormProvider = StateNotifierProvider<ReleaseFormStateNotifier, ReleaseFormState>(
  (ref) => ReleaseFormStateNotifier(),
);