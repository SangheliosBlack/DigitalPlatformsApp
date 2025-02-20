import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryCardDescription extends StatelessWidget {

  const DeliveryCardDescription({super.key});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        padding:  EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 10,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Numero de flete",
                  style: GoogleFonts.quicksand(
                    color: Colors.black.withAlpha(150),
                    fontSize: 12,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "#001321312AXSA",
                      style: GoogleFonts.quicksand(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        right: 10
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                "Unidad",
                                style: GoogleFonts.quicksand(
                                  color: Colors.grey,
                                  fontSize: 9,
                                ),
                              ),
                               Text(
                                "374S82",
                                style: GoogleFonts.quicksand(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Gap(10),
                          SizedBox(
                            width: 40,
                            child: DottedLine(
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.center,
                              lineLength: double.infinity,
                              lineThickness: .6,
                              dashLength: 4.0,
                              dashColor: Colors.grey.withValues(alpha: 0.6),
                              dashRadius: 0,
                              dashGapLength: 2.0,
                              dashGapColor: Colors.transparent,
                              dashGapRadius: 0.0,
                            ),
                          ),
                          DottedBorder(
                            borderType: BorderType.Circle,
                            color: Colors.grey.withAlpha(100),
                            strokeWidth: 1,
                            child: Container(
                              width:  7,
                              height: 7,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 170,
                  child: Row(
                    spacing: 5,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(238,249,240,1)
                        ),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(  
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(117,181,150,1)
                          ),
                        )
                        ,
                      ),
                      Expanded(
                        child: Text(
                          "Lagos De Moreno - Leon 406, 37128 El Laurel, Gto.",
                          style: GoogleFonts.quicksand(
                            color: const Color.fromARGB(255, 14, 21, 116),
                            fontSize: 10,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10
                  ),
                  child: Icon(
                    BootstrapIcons.arrow_right_short,
                    color: const Color.fromARGB(255, 14, 21, 116),
                    size: 15,
                  ),
                ),
                SizedBox(
                  width: 170,
                  child: Row(
                    spacing: 5,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(241,243,254	,1)
                        ),
                        child: SizedBox(
                          width: 10,
                          height: 10,
                          child: Icon(
                            BootstrapIcons.geo_alt_fill,
                              color: Color.fromRGBO(107,126,220,1),
                              size: 10,
                          ),
                        )
                        ,
                      ),
                      Expanded(
                        child: Text(
                          "Lagos De Moreno - Leon 406, 37128 El Laurel, Gto.",
                          style: GoogleFonts.quicksand(
                            color: const Color.fromARGB(255, 14, 21, 116),
                            fontSize: 10,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );

  }

}