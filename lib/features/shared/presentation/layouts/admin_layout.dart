import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/admin/presentation/widgets/widgets.dart';
import 'package:flutter_template/features/admin/presentation/widgets/x/card_list_test.dart';
import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_template/features/shared/presentation/layouts/x.dart';

class AdminLayout extends StatelessWidget {

  final Widget child;

  const AdminLayout({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 25
        ),
        child: Row(
          children: [
            AdminAsideMenu(),
            Expanded(
            child: Column(
              spacing: 15,
              children: [
                TopAsideWidget(),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 15
                    ),
                    child: Row(
                      spacing: 15,
                      children: [
                        Expanded(
                          flex: 7,
                          child: Column(
                            spacing: 15 ,
                            children: [
                              //RowInformationWidget(),
                              CardListTestWidget()
                              //Expanded(child: MultiBoardListExample(usuarios: [
                                //UserEntity(id: "", email: "email.com", name: "Julio Villagrana", role: Role.ADMIN, lastUpdate: DateTime.now())
                              //],
                              //)
                              //)
                            ],
                          )
                        ),
                        SizedBox(
                          width: 0,
                          child: Column(
                            spacing: 15,
                            children: [
                              AdminUsersWidget(),
                              AdminFreightWidget()
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            )
          ],
        ),
      ),
    );
  
  }

}