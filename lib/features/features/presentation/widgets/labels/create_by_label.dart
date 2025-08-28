import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/features/domain/entities/feature/feature_entity.dart';
import 'package:flutter_template/features/features/presentation/views/edit_survey_feature_dialog.dart';
import 'package:flutter_template/features/shared/domain/domain.dart';
import 'package:flutter_template/features/shared/presentation/utils/show_customd_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCreateByLabel extends ConsumerWidget {

  final FeatureEntity feature;
  final UserProfileEntity user;
  final bool showEdit;

  const UserCreateByLabel({
    super.key,
    required this.user,
    required this.feature,
    required this.showEdit
  });

  @override
  Widget build(BuildContext context,ref) {


    return Column(
      spacing: 7,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Creado por:",
          style: GoogleFonts.quicksand(
            fontSize: 11,
            color: Colors.grey,
            fontWeight: FontWeight.w500
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 7,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: SizedBox(
                    width:  30,
                    height: 30,
                    child: Image(
                      image: NetworkImage(user.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  user.fullName,
                  style: GoogleFonts.quicksand(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
            Offstage(
              offstage: showEdit,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: (){
              
                  CustomDialogService.showAlertDialog(
                    context: context, 
                    content: EditSurveyFeatureDialog(
                      feature:feature
                  ));
              
                },
                child: Icon(BootstrapIcons.pencil_square)
              ),
            )
          ],
        ),
      ],
    );

  }

}