import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/features/domain/entities/feature/feature_entity.dart';
import 'package:google_fonts/google_fonts.dart';

class QuantityUsersFeature extends StatelessWidget {

  final FeatureEntity featureEntity;

  const QuantityUsersFeature({
    super.key,
    required this.featureEntity
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      spacing: 15,
      children: [
        Row(
          spacing: 6,
          children: [
            Icon(
              BootstrapIcons.person_fill,
              size: 15,
            ),
            Text(
              featureEntity.surveyQuantity.toString(),
              style: GoogleFonts.quicksand(
                color: Colors.black
              ),
            )
          ],
        ),
        Row(
          spacing: 6,
          children: [
            Icon(
              BootstrapIcons.star_fill,
              size: 15,
            ),
            Text(
              "${featureEntity.surveyAverage.toStringAsFixed(0)}/${featureEntity.surverMax}",
              style: GoogleFonts.quicksand(
                color: Colors.black
              ),
            )
          ],
        ),
      ],
    );

  }

}