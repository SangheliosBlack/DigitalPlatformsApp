import 'package:flutter/material.dart';
import 'package:flutter_template/core/constants/ui_constants.dart';
import 'package:flutter_template/features/admin/presentation/widgets/delivery_widget/header/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../filter_button.dart';

class DeliveryHeader extends StatelessWidget {

  const DeliveryHeader({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(
        top: 15,
        right: 15,
        left: 15,
        bottom: 0
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10,
            children: [
              DeliveryHeaderIcon(),
              Text(
                UiConstants.deliveryWidgetTitle,
                style:  GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 18
                ),
              )
            ],
          ),
          FilterButton()
        ],
      ),
    );

  }

}