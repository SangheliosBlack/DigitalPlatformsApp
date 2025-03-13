import 'package:flutter_template/features/features/features.dart';
import 'package:flutter_template/features/shared/shared.dart';
import 'package:flutter_template/features/admin/admin.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter_template/core/core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FeaturesUnderConsiderationScreen extends StatelessWidget {

  static const String path = "/admin/features/under_consideration";

  static const int status = 2;

  const FeaturesUnderConsiderationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 10,
                children: [
                  Text(
                    "Bajo consideracion",
                    style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 25
                    ),
                  ),
                  Icon(
                    BootstrapIcons.chevron_right,
                    size: 18,
                  ),
                  Text(
                    "Q1",
                    style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 25
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: (){
                  CustomDialogService.showAlertDialog(
                    context: context, 
                    content: AddNewFeatureDialog(
                      status: status,
                    )
                  );
                },
                behavior: HitTestBehavior.translucent,
                child: Row(
                  spacing: 12,
                  children: [
                    Text(
                      "Agregar",
                      style: GoogleFonts.quicksand(
                        color: Colors.black,
                        fontSize: 16
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppTheme.primary,
                        shape: BoxShape.circle
                      ),
                      child: Icon(BootstrapIcons.plus, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ), 
          QuantityFeaturesLabel(
            status: status,
          ),
          Gap(20),
          /*
          Divider(
            color: Colors.grey.withAlpha(40),
            height: 1,
            thickness: .5,
          ),
          */
          PlannedFunctionalitiesList(
            status: status,
          )
        ],
      ),
    );

  }

}