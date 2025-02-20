import 'package:flutter_template/features/admin/presentation/widgets/row_information_widget/widgets.dart';
import 'package:flutter/material.dart';

class InformationCardWidget extends StatelessWidget {

  final String cardTitle;
  final IconData icon;
  final String value;
  final String percent;

  const InformationCardWidget({
    super.key,
    required this.cardTitle,
    required this.icon,
    required this.value,
    required this.percent
  });

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: MouseRegion(
        cursor: SystemMouseCursors.click, 
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleRow(cardTitle: cardTitle),
                  RowInformationQuanity(value: value),
                  RowInformationDescription(percent: percent,)
                ],
              ),
              RowInformationIcon(
                icon: icon
              )
            ],
          ),
        ),
      ),
    );

  }
}