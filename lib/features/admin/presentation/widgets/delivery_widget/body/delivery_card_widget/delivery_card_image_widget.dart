import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stroke_text/stroke_text.dart';

class DeliveryCardImageWidget extends StatelessWidget {

  final bool hover;

  const DeliveryCardImageWidget({
    super.key,
    required this.hover
  });

  @override
  Widget build(BuildContext context) {

    return SlideInRight(
      from: 20,
      animate: hover,
      child: SizedBox(
        height: 70,
        child: Stack(
          children: [
            const Image(
              image: AssetImage(
                "assets/images/truck2.jpg",
              ),
              fit: BoxFit.fitWidth,
            ),
            Positioned(
              right: -10,
              top: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  SizedBox(
                    width: 100,
                    child: StrokeText(
                      text: "2156H",
                      textStyle: GoogleFonts.bebasNeue(
                        fontSize: 32,
                        color: Colors.transparent
                      ),
                      strokeColor: Colors.black.withAlpha(50),
                      strokeWidth: 1,
                    ),
                  ),
                
                ],
              ),
            )
          ],
        ),
      ),
    );

  }

}