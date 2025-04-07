import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/release/application/providers/releases_provider.dart';

import 'package:flutter_template/features/release/presentation/widgets/cards/new_release/new_release_card.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewReleaseCard extends ConsumerWidget {

  const AddNewReleaseCard({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final isLoadig = !ref.watch(releasesProvider).isLoading;

    return Stack(
      children: [
        DottedBorder(
          radius: Radius.circular(20),
          borderType: BorderType.RRect,
          color: Colors.grey,
          child: Container(
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NewReleaseCardTitle(),
                  CreateReleaseInputTitle(),
                  NewReleaseDescriptionInput(),
                  NewReleaseTitleMediaInput(),
                  NewReleaseAddImage(),
                  Spacer(),
                  NewReleaseCreateReleaseButton()
                ],
              ),
            )
          ),
        ),
        Offstage(
          offstage: isLoadig,
          child: Container(
            width: 355,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(220),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Center(
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text(
                    "Cargando",
                    style: GoogleFonts.quicksand(
                      color: Colors.black
                    ),
                  )
                ],
              )
            ),
          ),
        )
      ],
    );
  }

}