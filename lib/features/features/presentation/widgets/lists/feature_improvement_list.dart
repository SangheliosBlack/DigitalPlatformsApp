import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/features/features/domain/entities/entities.dart';

class FeatureImprovementList extends StatelessWidget {

  final FeatureEntity feature;

  const FeatureImprovementList({
    super.key,
    required this.feature
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10
      ),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_,i) {
      
          final String improvement = feature.listImprovements[i].title;
      
          return Row(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 25,
                child: Center(
                  child: Text(
                    "${i+1} .-",
                    style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                ),
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                  text: improvement,
                  style: GoogleFonts.quicksand(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                    text: ' (Pendiente)',
                    style: GoogleFonts.quicksand(
                      color: AppTheme.primary,
                      fontStyle: FontStyle.italic,
                    ),
                    ),
                  ],
                  ),
                ),
              ),
            ],
          );
      
      
        } , 
        separatorBuilder: (_,__) => Gap(10), 
        itemCount: feature.listImprovements.length
      ),
    );

  }

}