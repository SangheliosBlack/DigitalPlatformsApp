import 'package:flutter/material.dart';
import 'package:flutter_template/features/admin/presentation/widgets/new_feature_dialog/dynamic_improvements_list_new_feature_dialog/dynamic_improvements_list_new_feature_dialog.dart';

class DynamicImproveFieldNewFeatureWidget extends StatefulWidget {

  const DynamicImproveFieldNewFeatureWidget({super.key});

  @override
  DynamicImproveFieldNewFeatureWidgetState createState() => DynamicImproveFieldNewFeatureWidgetState();
}

class DynamicImproveFieldNewFeatureWidgetState extends State<DynamicImproveFieldNewFeatureWidget> {
  
  final List<TextEditingController> _controllers = [
    TextEditingController()
  ];

void _addField() {

  final controller = TextEditingController();
  
  controller.addListener(() {

    if (mounted) {

      setState(() {});

    }

  });

  setState(() {

    _controllers.add(controller);
    
  });

}


  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
void initState() {
  super.initState();
  _controllers.first.addListener(() {
    if (mounted) {
      setState(() {});
    }
  });
}


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          itemCount: _controllers.length,
          itemBuilder: (_, i) {
            return Row(
              spacing: 10,
              children: [
                DynamicIconAdd(canShow: i == _controllers.length - 1 && _controllers[i].text.isNotEmpty, 
                  onPressed: _addField,
                ),
                NumberNewFeatureDynamic(number: i + 1),
                DynamicImproveFieldNewFeature(
                  controller: _controllers[i],
                  index: i + 1,
                )
              ],
            );
          }, 
          separatorBuilder: (_, __) => Divider(
            color: Colors.grey.withAlpha(20),
            height: 1,
          ),
        ),
      ],
    );
  }
}
