import 'package:flutter/material.dart';
import 'package:flutter_template/features/admin/presentation/widgets/freight_widget/header_widget/widgets.dart';

class AdminBoardHeader extends StatelessWidget {

  const AdminBoardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CurrentTaskLabel()
      ],
    );
  }
}