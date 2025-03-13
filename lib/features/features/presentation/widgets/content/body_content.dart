import 'package:flutter/material.dart';
import 'package:flutter_template/features/features/domain/entities/feature/feature_entity.dart';
import 'package:flutter_template/features/features/presentation/widgets/labels/quantity_users_feature.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyContent extends StatelessWidget {

  final FeatureEntity feature;

  const BodyContent({
    super.key,
    required this.feature
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          feature.title,
          style: GoogleFonts.lora(
            fontSize: 27,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
          maxLines: 5,
        ),
        QuantityUsersFeature(
          featureEntity: feature,
        ),
        Gap(5),
        Text(
          feature.description,
          style: GoogleFonts.quicksand(
            fontSize: 13,
            color: Colors.black
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 5,
        ),
      ],
    );

  }
  
}