import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/release/application/providers/form_release/form_release_notifier.dart';

class NewReleaseAddImage extends ConsumerWidget {

  const NewReleaseAddImage({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final file = ref.watch(releaseFormProvider).file;

    if(file != null){

      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 80,
              height: 90,
              child: kIsWeb
                ? Image.network(
                  file.path,
                  fit: BoxFit.cover,
                )
                : Image.file(
                  file,
                  fit: BoxFit.cover,
                ),
        ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: GestureDetector(
              onTap: () {
                ref.read(releaseFormProvider.notifier).clearFile();
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
                ),
                child: Icon(
              Icons.close,
              color: Colors.black,
              size: 20,
                ),
              ),
            ),
          ),
        ],
      );

    }

    return GestureDetector(
      onTap: () async {

        await ref.read(releaseFormProvider.notifier).pickFile();

      },
      child: Container(
        width: 80,
        height: 90,
        padding: EdgeInsets.symmetric(
          vertical: 22,
          horizontal: 15
        ),
        decoration: BoxDecoration(
          color: AppTheme.backgroundColorSencondary,
          borderRadius: BorderRadius.circular(10)
        ),
        child:  Icon(
          BootstrapIcons.image_alt,
          color: Colors.grey,
        ),
      ),
    );

  }

}