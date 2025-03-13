import 'package:flutter/widgets.dart';
import 'package:flutter_template/features/features/domain/entities/feature/list_improvements_entity.dart';

class ListImprovementsWidget extends StatelessWidget {

  final List<ListImprovementEntity> listImprovements;

  const ListImprovementsWidget({
    super.key,
    required this.listImprovements
  });

  @override
  Widget build(BuildContext context) {

    return Container();

    /*

    return ListView.separated(
      itemBuilder: itemBuilder, 
      separatorBuilder: separatorBuilder, 
      itemCount: itemCount
    );
    */

  }

}