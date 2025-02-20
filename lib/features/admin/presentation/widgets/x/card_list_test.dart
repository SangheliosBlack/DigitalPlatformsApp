import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CardListTestWidget extends StatelessWidget {

  const CardListTestWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Column(
        spacing: 15,
        children: [
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.white.withAlpha(100),
                )
              ),
              Container(
              width: 100,
              padding: EdgeInsets.symmetric(
                vertical: 7,
                horizontal: 15
              ),
              decoration: BoxDecoration(
                color: AppTheme.backgroundColorSencondary,
                borderRadius: BorderRadius.circular(100)
              ),
              child: Row(
                spacing: 10,
                children: [
                  Icon(
                    BootstrapIcons.calendar_minus,
                    color: Color.fromRGBO(35,34,64,1),
                    size: 13,
                  ),
                  Text(
                    "Q1 2025",
                    style: GoogleFonts.roboto(
                      color: Color.fromRGBO(35,34,64,1),
                      fontSize: 12,
                      fontWeight: FontWeight.w300
                    ),
                  )
                ],
              ),
                      ),
                      Expanded(
                child: Divider(
                  color: Colors.white.withAlpha(100),
                )
              ),
            ],
          ),
          Expanded(
            child: Row(
              spacing: 10,
              children: [
                ClipRRect(
                  child: Container(
                    width: 280,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Liberacion reciente 1",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                  maxLines: 5,
                                ),
                              ),
                              Column(
                                children: [
                                   Text(
                                "10",
                                style: GoogleFonts.quicksand(
                                  fontSize: 11,
                                  color: Colors.black
                                ),
                              ),
                                  Icon(
                                    BootstrapIcons.eye_fill,
                                    size: 18,
                                    color: Color(0xffDD052B),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Julio Villagrana - 12/12/2021",
                                style: GoogleFonts.quicksand(
                                  fontSize: 11,
                                  color: Colors.blueGrey
                                ),
                              ),
                            ],
                          ),
                          Gap(10),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, molestie ipsum et, ultricies nunc. Nulla facilisi. Nullam nec nunc nec nunc.",
                            style: GoogleFonts.quicksand(
                              fontSize: 12,
                              color: Colors.black.withAlpha(200),
                            ),
                            maxLines: 100,
                          ),
                          Gap(15),
                          Expanded(
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  image: AssetImage("assets/images/ss.png")
                                  ,fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ),
                ),
                ClipRRect(
                  child: Container(
                    width: 280,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Liberacion reciente 1",
                                  style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                  maxLines: 5,
                                ),
                              ),
                              Column(
                                children: [
                                   Text(
                                "10",
                                style: GoogleFonts.quicksand(
                                  fontSize: 11,
                                  color: Colors.black
                                ),
                              ),
                                  Icon(
                                    BootstrapIcons.eye_fill,
                                    size: 20,
                                    color: Color(0xffDD052B),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Julio Villagrana - 12/12/2021",
                                style: GoogleFonts.quicksand(
                                  fontSize: 11,
                                  color: Colors.blueGrey
                                ),
                              ),
                            ],
                          ),
                          Gap(10),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, molestie ipsum et, ultricies nunc. Nulla facilisi. Nullam nec nunc nec nunc.",
                            style: GoogleFonts.quicksand(
                              fontSize: 12,
                              color: Colors.black.withAlpha(200),
                            ),
                            maxLines: 100,
                          ),
                          Gap(15),
                          Expanded(
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  image: AssetImage("assets/images/ss.png")
                                  ,fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }

}