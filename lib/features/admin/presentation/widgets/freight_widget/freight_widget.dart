import 'package:flutter/material.dart';
import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/features/admin/presentation/widgets/freight_widget/widget.dart';

class AdminFreightWidget extends StatelessWidget {

  const AdminFreightWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return  Expanded(
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: UiConstantsValues.defaultDecoration,
        child: Column(
          children: [
            AdminBoardHeader(),
            Divider(
              color: Colors.grey.withAlpha(50),
              height: 10,
            ), 
            FreightContentWidget()
          ],
        ),
      ),
    );

  }

}