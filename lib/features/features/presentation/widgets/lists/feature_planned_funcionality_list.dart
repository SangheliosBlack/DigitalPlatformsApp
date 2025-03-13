import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/features/application/providers/features_provider.dart';
import 'package:flutter_template/features/features/presentation/widgets/widgets.dart';

class PlannedFunctionalitiesList extends ConsumerWidget {

  final int status;

  const PlannedFunctionalitiesList({
    super.key,
    required this.status
  });

  @override
  Widget build(BuildContext context,ref) {

    final plannedFunctionalities = ref.watch(featuresProvider).getFeaturesByStatus(status: status);

    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          
          await ref.read(featuresProvider.notifier).fetchAllFeatures();

        },
        child: plannedFunctionalities.isNotEmpty ? GridView.builder(
          padding: EdgeInsets.only(top: 0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, 
            crossAxisSpacing: 10, 
            mainAxisSpacing: 10, 
            childAspectRatio: 1.1,
            mainAxisExtent: 300
          ),
          itemCount: plannedFunctionalities.length,
          itemBuilder: (_, i) {
        
            final feature = plannedFunctionalities.entries.elementAt(i).value;
        
            return FeatureCard(
              feature: feature,
            );
        
          },
        ): FeatureEmptyBody()
      ),
    );

  }

}