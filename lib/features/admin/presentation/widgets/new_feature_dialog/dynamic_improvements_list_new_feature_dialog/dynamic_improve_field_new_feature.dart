import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/features/application/application.dart';
import 'package:google_fonts/google_fonts.dart';

class DynamicImproveFieldNewFeature extends ConsumerStatefulWidget {

  final int index;
  final TextEditingController controller;

  const DynamicImproveFieldNewFeature({
    super.key, 
    required this.controller,
    required this.index
  });

  @override
  ConsumerState<DynamicImproveFieldNewFeature> createState() => _DynamicImproveFieldNewFeatureState();

}

class _DynamicImproveFieldNewFeatureState extends ConsumerState<DynamicImproveFieldNewFeature> {

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (mounted) {
        setState(() {}); 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: widget.controller,
        style: GoogleFonts.roboto(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w300,
        ),
        onChanged: (value) {
          
          ref.read(formProvider.notifier).updateImprovements(improvement: value, index: widget.index);

        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: "Mejora ${widget.index}",
          hintStyle: GoogleFonts.roboto(
            color: Colors.grey.withAlpha(200),
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
