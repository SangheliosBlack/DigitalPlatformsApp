import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

class DeliveryHeaderIcon extends StatelessWidget {

  const DeliveryHeaderIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey.withAlpha(50),
        ),
        borderRadius: BorderRadius.circular(7)
      ),
      child: Icon(
        BootstrapIcons.truck,
        color: Colors.blue,
        size: 15,
      ),
    );
  }
}