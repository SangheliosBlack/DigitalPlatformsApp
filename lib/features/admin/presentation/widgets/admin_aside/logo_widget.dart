import 'package:flutter/material.dart';

class LogoWiget extends StatelessWidget {

  const LogoWiget({super.key});


  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(left: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width:50,
          child: Image(
            image: AssetImage(
              "assets/images/tuali.jpg",
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );

  }

}