import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/admin/presentation/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';

class AdminAsideSubOption extends StatefulWidget {

  final String subTitle;
  final bool last;

  const AdminAsideSubOption({
    super.key, 
    this.last = false,
    required this.subTitle, 
  });

  @override
  State<AdminAsideSubOption> createState() => _AdminAsideSubOptionState();

}

class _AdminAsideSubOptionState extends State<AdminAsideSubOption> {

  bool hover = false;

  @override
  Widget build(BuildContext context) {

    return MouseRegion(
      cursor: SystemMouseCursors.click, 
      onEnter: (e) {

        setState(() {
          hover = true;
        });

      },
      onExit: (e) {

        setState(() {
          hover = false;
        });

      },
      child: GestureDetector(
        onTap: () {
          //Pendiente
        },
        
        behavior: HitTestBehavior.translucent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 15,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 35),
              height: 32,
              child: Column(
                children: [
                  StaticExpandSubMenu(),
                  CircleAside(
                    hover: hover,
                  ),
                  ExpandSubMenu(
                    isLast: widget.last,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                AnimatedSize(
                  
                  duration: Duration(
                    milliseconds: 300
                  ),
                  child: SizedBox(
                    width: hover ? 5 : 0,
                  ),
                ),
                Text(
                  widget.subTitle,
                  style: GoogleFonts.quicksand(
                    color: AppTheme.colorFont,
                    fontSize: 12
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
