import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/admin/presentation/presentation.dart';
import 'package:flutter_template/features/auth/domain/entities/commercial_figure_entity.dart';
import 'package:flutter_template/features/auth/presentation/providers/auth_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminAsideSelectCommercialPlatformButton extends ConsumerStatefulWidget {

  const AdminAsideSelectCommercialPlatformButton({super.key});

  @override
  ConsumerState<AdminAsideSelectCommercialPlatformButton> createState() =>
      _AdminAsideSelectCommercialPlatformButtonState();
}

class _AdminAsideSelectCommercialPlatformButtonState
    extends ConsumerState<AdminAsideSelectCommercialPlatformButton> {
  @override
  Widget build(BuildContext context) {

    final commercialFigures = ref.watch(authProvider);

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        underline: Divider(
          color: Colors.red,
          height: 10,
        ),
        customButton: _buildCustomButton(),
        items: _buildDropdownItems(commercialFigures.commercialFigures,ref.watch(authProvider).commercialFigureSelected),
        value: commercialFigures.commercialFigureSelected,
        onChanged: (String? value) {
          ref.read(authProvider.notifier).updateCommercialFigure(name: value ?? "");
        },
        menuItemStyleData: const MenuItemStyleData(
          height: 50,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
        dropdownStyleData: _buildDropdownStyleData(),
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          height: 40,
          width: 140,
        ),
      ),
    );
  }

  Widget _buildCustomButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const LogoWiget(),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Digital Platforms",
                            style: GoogleFonts.quicksand(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                          const AdminAsideCommercialPlatformSelected(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.keyboard_arrow_down_sharp),
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems( List<CommercialFigureEntity> commercialFigures, String selected) {
    
    return commercialFigures
        .map(
          (CommercialFigureEntity item) => DropdownMenuItem<String>(
            value: item.name,
            child: Row(
              spacing: 10,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width:  35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: item.name == selected ?  AppTheme.primary :Colors.black,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        item.name.split(" ").map((word) => word[0]).take(2).join(),
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontSize: 15
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  item.name,
                  style: GoogleFonts.quicksand(
                    fontSize: 14,
                    color: Colors.black
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();
  }

  DropdownStyleData _buildDropdownStyleData() {
    return DropdownStyleData(
      elevation: 0,
      width: 220,
      openInterval: Interval(0.1,0.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
      ),
      offset: const Offset(10, -10),
      scrollbarTheme: ScrollbarThemeData(
        radius: const Radius.circular(40),
        thickness: MaterialStateProperty.all(6),
        thumbVisibility: MaterialStateProperty.all(true),
      ),
      
    );
  }
}
