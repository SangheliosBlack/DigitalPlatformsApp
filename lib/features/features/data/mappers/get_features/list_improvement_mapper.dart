import 'package:flutter_template/features/features/data/dtos/dtos.dart';
import 'package:flutter_template/features/features/domain/domain.dart';

class  ListImprovementsFeaturesMapper {

  static ListImprovementEntity fromDto ({required ListImprovementsFeaturesDto improvement}){

    return ListImprovementEntity(
      id: improvement.id,
      title: improvement.title, 
    );

  }

}