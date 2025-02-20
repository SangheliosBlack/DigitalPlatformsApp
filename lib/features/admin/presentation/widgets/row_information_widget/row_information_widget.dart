import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter_template/features/admin/presentation/widgets/row_information_widget/information_card_widget.dart';
import 'package:flutter/material.dart';

class RowInformationWidget extends StatelessWidget {

  const RowInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 95,
      child: Row(
        spacing: 15,
        children: [
          InformationCardWidget(
            cardTitle: 'Liberaciones recientes', 
            icon: BootstrapIcons.rocket,
            value: 18.toString(),
            percent: "13.3",
          ),
          InformationCardWidget(
            cardTitle: 'Funcionalidades planeadas',
            value:541.toString(),
            icon: BootstrapIcons.diagram_2,
            percent: "2.3",
            ),
          InformationCardWidget(
            cardTitle: 'Bajo consideracion',
            icon: BootstrapIcons.lightning,
            value: 34.toString(),
            percent: "29.3",
          ),
          InformationCardWidget(
            cardTitle: 'Ideas',
            icon: BootstrapIcons.lightbulb,
            value: 34.toString(),
            percent: "29.3",
          )
        ],
      )
    );

  }

}