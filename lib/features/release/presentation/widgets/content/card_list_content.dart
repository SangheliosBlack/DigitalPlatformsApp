import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter_template/features/release/application/providers/releases_provider.dart';
import 'package:flutter_template/features/release/presentation/widgets/cards/cards.dart';
import 'package:flutter_template/features/version_codes/presentation/providers/version_codes_provider.dart';
import 'package:gap/gap.dart';

class CardListTestWidget extends ConsumerStatefulWidget {
  const CardListTestWidget({super.key});

  @override
  CardListTestWidgetState createState() => CardListTestWidgetState();
}

class CardListTestWidgetState extends ConsumerState<CardListTestWidget> {
  final ScrollController _listScrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    Future.microtask(
        () => ref.read(releasesProvider.notifier).fetchAllReleases());
    Future.microtask(
        () => ref.read(versionCodesProvider.notifier).getAllVersionCodes());
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final commercialFigure =
        ref.watch(authProvider).commercialFigureIdSelected;

    final releases = ref
        .watch(releasesProvider)
        .getReleasesByCommercialFigures(commercialFigure);

    return Row(
      children: [
        const AddNewReleaseCard(),
        Expanded(
          child: RawScrollbar(
            controller: _listScrollController,
            padding: EdgeInsets.only(left: 16,right: 16),
          radius: const Radius.circular(10),
          trackRadius: const Radius.circular(10),
          thumbColor: AppTheme.primary,
          thumbVisibility: true,
          trackColor: Color.fromRGBO(215, 212, 213, .2),
          trackVisibility: true,
          thickness: 10,
            child: ListView.separated(
              controller: _listScrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) {
                final release = releases.entries.elementAt(i).value;
                return ReleaseCard(release: release);
              },
              separatorBuilder: (_, __) => const Gap(10),
              itemCount: releases.length,
            ),
          ),
        ),
      ],
    );
  }
}
