import 'package:flutter/material.dart';
import 'package:flutter_template/features/shared/domain/domain.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCreateByLabel extends StatelessWidget {

  final UserProfileEntity user;

  const UserCreateByLabel({
    super.key,
    required this.user
  });

  @override
  Widget build(BuildContext context) {

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
      ],
    );

  }

}