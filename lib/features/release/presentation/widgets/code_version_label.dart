import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeVersionLabel extends StatelessWidget {

  final String versionCode;
  
  const CodeVersionLabel({super.key,required this.versionCode});

  @override
  Widget build(BuildContext context) {

    return Row(
      spacing: 10,
      children: [
        Icon(
          BootstrapIcons.rocket_takeoff,
          color: AppTheme.primary,
          size: 15,
        ),
          Text(
            versionCode,
            style: GoogleFonts.poppins(
              color: Color.fromRGBO(35,34,64,1),
              fontSize: 15,
              fontWeight: FontWeight.w300
            ),
          )
      ],
    );

  }

}