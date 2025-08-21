import 'dart:io';
import 'dart:typed_data';

class ReleaseFormState {

  final String title;
  final String description;
  final File? file;
  final Uint8List? fileBytes; 
  final String? fileName;
  final String versionCode;

  ReleaseFormState({
    this.title = '',
    this.description = '',
    this.file,
    this.fileBytes,
    this.fileName,
    this.versionCode = ""
  });

  bool get isValid {
  
    return title.isNotEmpty && description.isNotEmpty && versionCode.isNotEmpty;

  }

  ReleaseFormState copyWith({
    String? title,
    String? description,
    File? file,
    Uint8List? fileBytes,
    String? fileName,
    String? versionCode
  }) {
    return ReleaseFormState(
      title: title ?? this.title,
      description: description ?? this.description,
      file: file ?? this.file,
      fileBytes: fileBytes ?? this.fileBytes,
      fileName : fileName ?? this.fileName,
      versionCode : versionCode ?? this.versionCode
    );
  }
  
}

