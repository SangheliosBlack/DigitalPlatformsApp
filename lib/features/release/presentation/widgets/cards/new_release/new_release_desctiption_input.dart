import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/release/application/providers/providers.dart';
import 'package:google_fonts/google_fonts.dart';

class NewReleaseDescriptionInput extends ConsumerStatefulWidget {
  const NewReleaseDescriptionInput({super.key});

  @override
  ConsumerState<NewReleaseDescriptionInput> createState() => _NewReleaseDescriptionInputState();
}

class _NewReleaseDescriptionInputState extends ConsumerState<NewReleaseDescriptionInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

      ref.listen(releaseFormProvider, (_, next) {
      if (next.description.isEmpty) {
        _controller.clear(); 
      }
    });


    return TextFormField(
      controller: _controller,
      onChanged: (value) {
        ref.read(releaseFormProvider.notifier).updateDescription(value);
      },
      maxLines: 7,
      style: GoogleFonts.quicksand(
        fontSize: 15,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        labelText: "Descripcion de la liberacion",
        labelStyle: GoogleFonts.quicksand(
          fontSize: 16,
          color: Colors.grey
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.withAlpha(0), width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.withAlpha(0), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.withAlpha(35), width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
    );
  }
}
