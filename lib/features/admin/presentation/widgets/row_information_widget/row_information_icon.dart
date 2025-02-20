import 'package:flutter/material.dart';

class RowInformationIcon extends StatelessWidget {

  final IconData icon;

  const RowInformationIcon({
    super.key,
    required this.icon
  });

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
        icon,
        color: Colors.blue,
        size: 15,
      ),
    );

  }

}