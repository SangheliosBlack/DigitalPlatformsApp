import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/features/application/providers/features_provider.dart';
import 'package:flutter_template/features/release/application/providers/releases_provider.dart';
import 'package:flutter_template/features/version_codes/domain/entities/version_code_entity.dart';
import 'package:flutter_template/features/version_codes/presentation/providers/version_codes_provider.dart';
import 'package:google_fonts/google_fonts.dart';


class VersionCodeSelectorButton extends ConsumerStatefulWidget {

  const VersionCodeSelectorButton({super.key});

  @override
  ConsumerState<VersionCodeSelectorButton> createState() =>
      _VersionCodeSelectorButtonState();
}

class _VersionCodeSelectorButtonState
    extends ConsumerState<VersionCodeSelectorButton> {
  @override
  Widget build(BuildContext context) {

    final versionCodes = ref.watch(versionCodesProvider);

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: versionCodes.list.isNotEmpty 
      ? DropdownButtonHideUnderline(
        key: ValueKey<String>("VL1"),
        child: DropdownButton2<String>(
          isExpanded: true,
          underline: Divider(
            color: Colors.red,
            height: 10,
          ),
          customButton: _buildCustomButton(versionCode: versionCodes.getCurrentVersionCode, currentCode: versionCodes.list.firstWhere((e) => e.current).id),
          items: _buildDropdownItems(versionCodes.list,versionCodes.versionCodeSelected),
          value: versionCodes.versionCodeSelected,
          onChanged: (String? value) {

            ref.read(versionCodesProvider.notifier).updateSelectedFilter(versionCode: value ?? "");
            
            ref.read(releasesProvider.notifier).fetchAllReleases();

            ref.read(featuresProvider.notifier).fetchAllFeatures();

          },
          menuItemStyleData: const MenuItemStyleData(
            height: 35,
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
      )
      : Container(
        key: ValueKey<String>("VL2"),
      )
    );
  }

  Widget _buildCustomButton({required VersionCodeEntity? versionCode,required String currentCode}) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: AnimatedContainer(
              width: currentCode != versionCode?.id  ? 120 : 85.5,
                  duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
            color: currentCode == versionCode?.id  ? Colors.transparent : AppTheme.delete,
            borderRadius: BorderRadius.circular(100)
                  ),
                  child:  Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 7,
                  horizontal: 15
                ),
                decoration: BoxDecoration(
                  color: AppTheme.backgroundColorSencondary,
                  borderRadius: BorderRadius.circular(100)
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    Icon(
                      BootstrapIcons.rocket_takeoff,
                      color: Color.fromRGBO(35,34,64,1),
                      size: 13,
                    ),
                    Text(
                      "v${versionCode?.code ?? ""}",
                      style: GoogleFonts.roboto(
                        color: Color.fromRGBO(35,34,64,1),
                        fontSize: 12,
                        fontWeight: FontWeight.w300
                      ),
                    )
                  ],
                ),
              ),
              currentCode != versionCode?.id  ? GestureDetector(
                child: GestureDetector(
                  onTap: (){

                    ref.read(versionCodesProvider.notifier).updateSelectedFilter(versionCode: "");

                       ref.read(releasesProvider.notifier).fetchAllReleases();

                      ref.read(featuresProvider.notifier).fetchAllFeatures();

                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 5
                    ),
                    child: Icon(
                      BootstrapIcons.x,
                      color: Colors.white,
                    ),
                  ),
                )
              ) : Container()
            ],
                  ),
                ),
          ),
        );
    
  }

  List<DropdownMenuItem<String>> _buildDropdownItems( List<VersionCodeEntity>  commercialFigures, String selected) {
    
    return commercialFigures
        .map(
          (VersionCodeEntity item) => DropdownMenuItem<String>(
            value: item.id,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 10,
              children: [
                AnimatedOpacity(
                  opacity: item.id == selected ? 1 : 0,
                  duration: Duration(milliseconds: 200),
                  child: Icon(
                    BootstrapIcons.check,
                    color: Colors.white,
                    size: 17,
                  ),
                ),
                Row(
                  spacing: 10,
                  children: [
                    Center(
                      child: RichText(
                      text: TextSpan(
                        children: [
                        TextSpan(
                          text: 'v',
                          style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: ' ${item.code}',
                          style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                          ),
                        ),
                        ],
                      ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: item.current ? 1 : 0,
                      duration: Duration(milliseconds: 200),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 20,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.primary,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: Text(
                              "Actual",
                              style: GoogleFonts.quicksand(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
      width: 180,
      openInterval: Interval(0.1,0.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.black,
      ),
      offset: const Offset(0, -10),
      scrollbarTheme: ScrollbarThemeData(
        radius: const Radius.circular(40),
        thickness: MaterialStateProperty.all(6),
        thumbVisibility: MaterialStateProperty.all(true),
      ),
      
    );
  }
}
