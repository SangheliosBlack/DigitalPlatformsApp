import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/release/application/providers/providers.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateReleaseInputTitle extends ConsumerStatefulWidget {
  const CreateReleaseInputTitle({super.key});

  @override
  ConsumerState<CreateReleaseInputTitle> createState() => _CreateReleaseInputTitleState();
}

class _CreateReleaseInputTitleState extends ConsumerState<CreateReleaseInputTitle> {

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
      if (next.title.isEmpty) {
        _controller.clear(); 
      }
    });


    return TextFormField(
      controller: _controller,
      maxLines: 1,
      style: GoogleFonts.quicksand(
        fontSize: 15,
        color: Colors.black,
      ),
      onChanged: (value) {
        ref.read(releaseFormProvider.notifier).updateTitle(value);
      },
      decoration: InputDecoration(
        labelText: "Titulo de la liberacion",
        labelStyle: GoogleFonts.quicksand(
          fontSize: 16,
          color: Colors.grey
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}