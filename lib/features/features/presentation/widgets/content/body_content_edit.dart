import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/features/application/providers/form_feature/edit_form_feature_notifier.dart';
import 'package:flutter_template/features/features/domain/entities/feature/feature_entity.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyContentEdit extends ConsumerWidget {

  final FeatureEntity feature;

  const BodyContentEdit({
    super.key,
    required this.feature
  });

  @override
  Widget build(BuildContext context,ref) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: feature.title,
          style: GoogleFonts.lora(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          onChanged: (value) {
            
            ref.read(editFormFeatureProvider.notifier).updateTitle(value);

          },
          maxLines: 3,
          decoration: const InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            filled: false,
            isDense: false,
            contentPadding: EdgeInsets.zero,
          ),
        ),
        Gap(15),
        TextFormField(
          initialValue: feature.description,
          style: GoogleFonts.quicksand(
            fontSize: 13,
            color: Colors.black,
          ),
          onChanged: (value) {
            
            ref.read(editFormFeatureProvider.notifier).updateDescription(value);

          },
          maxLines: 5,
          decoration: const InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            filled: false,
            isDense: false,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ],
    );

  }
  
}