import 'package:flutter/material.dart';
import 'package:flutter_template/features/admin/presentation/widgets/delivery_widget/body/delivery_card_widget/widgets.dart';

class DeliveryCardWidget extends StatefulWidget {

  const DeliveryCardWidget({
    super.key,
  });

  @override
  DeliveryCardWidgetState createState() => DeliveryCardWidgetState();
}

class DeliveryCardWidgetState extends State<DeliveryCardWidget> {

  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (e) {
        setState(() {
          hover = true;
        });
      },
      onExit: (e) {
        setState(() {
          hover = false;
        });
      },
      child: DeliveryCardDecoration(
        hover: hover,
        child: Row(
          children: [
            DeliveryCardDescription(),
            DeliveryCardImageWidget(
              hover: hover
            ),
          ],
        ),
      ),
    );
  }
}
