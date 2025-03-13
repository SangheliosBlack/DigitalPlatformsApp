import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';

class LogoWiget extends StatelessWidget {

  const LogoWiget({super.key});


  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(left: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width:50,
          height: 50,
          decoration: BoxDecoration(
            color: AppTheme.primary,
            borderRadius: BorderRadius.circular(10)
          ),
        ),
      ),
    );

  }

}
/*
Image(
            image: AssetImage(
              "assets/images/tuali.jpg",
            ),
            fit: BoxFit.fitWidth,
          ),
          */