import 'package:flutter_template/features/admin/admin.dart';
import 'package:flutter_template/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


class AddNewFeatureDialog extends StatelessWidget {

  final int status;

  const AddNewFeatureDialog({
    super.key,
    required this.status
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 600,
      height: context.height * .75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          HeaderAddNewFeature(),
          TitleNewFeatureDialog(),
          Divider(
            color: Colors.grey.withAlpha(40),
            height: 1,
          ),
          Gap(5),
          Column(
            children: [
              TitleFieldNewFeatureDialog(),
              DescripcionFieldNewFeatureDialog(),
              DynamicImproveFieldNewFeatureWidget()
            ],
          ),
          Spacer(),
          BottomButtonsNewFeatureDialog(
            status:status
          )
        ],
      ),
    );

  }

}