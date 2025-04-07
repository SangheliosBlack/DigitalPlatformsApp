import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter_template/features/release/application/providers/releases_provider.dart';
import 'package:flutter_template/features/release/presentation/widgets/cards/cards.dart';
import 'package:gap/gap.dart';

class CardListTestWidget extends ConsumerStatefulWidget {

  const CardListTestWidget({super.key});

  @override
  CardListTestWidgetState createState() => CardListTestWidgetState();

}

class CardListTestWidgetState extends ConsumerState<CardListTestWidget> {


  @override
  void initState() {

    super.initState();

    Future.microtask(() => ref.read(releasesProvider.notifier).fetchAllReleases());

  }

  @override
  Widget build(BuildContext context) {

    final commercialFigure = ref.watch(authProvider).commercialFigureIdSelected;

    final releases = ref.watch(releasesProvider).getReleasesByCommercialFigures(commercialFigure);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          AddNewReleaseCard(),
          SizedBox(
            height: double.infinity,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_,i) {
            
                final release = releases.entries.elementAt(i).value;
            
                return ReleaseCard(release: release);
            
              }, 
              separatorBuilder: (_,__ ) => Gap(10), 
              itemCount: releases.length
            ),
          )
        ],
      ),
    );
  }
}
