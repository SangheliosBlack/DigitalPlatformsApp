import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

class DynamicIconAdd extends StatelessWidget {

  final bool canShow;
  final VoidCallback onPressed;

  const DynamicIconAdd({
    super.key,
    required this.canShow,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: canShow ? 1 : 0,
      duration: Duration(milliseconds: 200),
      child: IconButton(
        icon: Icon(
          BootstrapIcons.plus,
          color: AppTheme.primary,
          size: 20,
        ),
        onPressed: canShow? onPressed : null,
      ),
    );
  }
}
