import 'package:flutter/material.dart';
import 'package:flutter_template/features/admin/presentation/widgets/delivery_widget/body/widgets.dart';
import 'package:gap/gap.dart';

class DeliveryBodyWidget extends StatelessWidget {

  const DeliveryBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.only(
          bottom: 15
        ),
        shrinkWrap: true,
        itemBuilder: (_,i){
      
          return DeliveryCardWidget();
      
        }, 
        separatorBuilder: (_,__) => Gap(10), 
        itemCount: 6
      ),
    );

  }

}