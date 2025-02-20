import 'package:flutter/material.dart';
import 'package:flutter_template/features/admin/presentation/widgets/delivery_widget/widgets.dart';

class DeliveryWidget extends StatelessWidget {

  const DeliveryWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          spacing: 15,
          children: [
            DeliveryHeader(),
            DeliveryBodyWidget()
          ],
        ),
      ),
    );

  }

}