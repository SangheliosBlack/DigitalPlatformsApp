import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/features/application/providers/features_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class QuantityFeaturesLabel extends ConsumerWidget {

  final int status;

  const QuantityFeaturesLabel({
    super.key,
    required this.status
  });

  @override
  Widget build(BuildContext context,ref) {

    final featuresQuantity = ref.watch(featuresProvider).getFeaturesByStatus(status: status);

    return RichText(
      text: TextSpan(
      children: [
        TextSpan(
        text: "( ${featuresQuantity.length} )",
        style: GoogleFonts.quicksand(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        ),
        TextSpan(
        text: " resultados",
        style: GoogleFonts.quicksand(
          color: Colors.grey,
          fontSize: 16,
        ),
        ),
      ],
      ),
    );

  }

}