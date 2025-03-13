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

    return Column(
      spacing: 15,
      children: [
        Expanded(
          child: Row(
            spacing: 10,
            children: [
              DottedBorder(
                radius: Radius.circular(20),
                borderType: BorderType.RRect,
                color: Colors.grey,
                
                child: Container(
                  width: 350,
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
                        Text(
                        "Crear nueva liberacion",
                        style: GoogleFonts.lora(
                          fontSize: 27,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                        maxLines: 5,
                        ),
                        Gap(15),
                        TextFormField(
                        maxLines: 1,
                        style: GoogleFonts.quicksand(
                          fontSize: 15,
                          color: Colors.black
                        ),
                        decoration: InputDecoration(
                          labelText: "Titulo de la liberacion",
                          labelStyle: GoogleFonts.quicksand(
                          fontSize: 18,
                          color: Colors.black
                          ),
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        ),
                        Gap(20),
                        TextFormField(
                        maxLines: 7,
                        style: GoogleFonts.quicksand(
                          fontSize: 15,
                          color: Colors.black
                          ),
                          decoration: InputDecoration(
                          labelText: "Descripcion de la liberacion",
                          labelStyle: GoogleFonts.quicksand(
                          fontSize: 18,
                          color: Colors.black
                          ),
                              disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0),width: 1)
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey,width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey..withValues(alpha: 0),width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.withValues(alpha: .1),width: 1)
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey,width: 1)
    ),
                          ),
                        ),
                        Gap(10),
                        Text(
                          "Multimedia",
                          style: GoogleFonts.quicksand(
                          fontSize: 15,
                          color: Colors.black
                          ),
                        ),
                        Gap(10),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 22,
                            horizontal: 15
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.backgroundColorSencondary,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Icon(
                            BootstrapIcons.image_alt,
                            color: Colors.grey,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.primary,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15
                            ),
                            child: Center(
                              child: Text(
                                "Crear liberacion",
                                style: GoogleFonts.quicksand(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ),
              ),
              Container(
                width: 350,
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
                      Text(
                        "Liberacion reciente 1",
                        style: GoogleFonts.lora(
                          fontSize: 27,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                        maxLines: 5,
                      ),
                      
                      Gap(10),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, molestie ipsum et, ultricies nunc. Nulla facilisi. Nullam nec nunc nec nunc.",
                        style: GoogleFonts.quicksand(
                          fontSize: 13,
                          color: Colors.black
                        ),
                        maxLines: 100,
                      ),
                      Gap(15),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
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
                                Gap(5),
                                Row(
                                  spacing: 7,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Container(
                                        width:  20,
                                        height: 20,
                                        child: Image(
                                          image: NetworkImage("https://plus.unsplash.com/premium_photo-1682096259050-361e2989706d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aG9tYnJlJTIwam92ZW58ZW58MHx8MHx8fDA%3D"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Julio Villagrana",
                                      style: GoogleFonts.quicksand(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "Fecha de liberacion:",
                                style: GoogleFonts.quicksand(
                                  fontSize: 11,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              Gap(5),
                              Text(
                                "12/12/2021",
                                style: GoogleFonts.quicksand(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Gap(15),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 12
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primary,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text(
                          "Q1",
                          style: GoogleFonts.quicksand(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Gap(20),
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: AssetImage("assets/images/ss.png")
                            ,fit: BoxFit.fitHeight,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ],
    );

  }

}