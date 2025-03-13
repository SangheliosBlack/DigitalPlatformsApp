import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/admin/presentation/widgets/widgets.dart';
import 'package:flutter_template/features/features/application/providers/features_provider.dart';

class AdminLayout extends ConsumerStatefulWidget {
  final Widget child;

  const AdminLayout({
    super.key,
    required this.child,
  });

  @override
  AdminLayoutState createState() => AdminLayoutState();
}

class AdminLayoutState extends ConsumerState<AdminLayout> {

  @override
  void initState() {

    super.initState();

    Future.microtask(() => ref.read(featuresProvider.notifier).fetchAllFeatures());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 25,
        ),
        child: Row(
          children: [
            AdminAsideMenu(),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    TopAsideWidget(),
                    Expanded(child: widget.child),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
