import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/features/application/providers/features_provider.dart';
import 'package:flutter_template/features/features/domain/entities/feature/feature_entity.dart';
import 'package:flutter_template/features/features/presentation/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureAnswerZone extends ConsumerWidget {

  final FeatureEntity feature;

  const FeatureAnswerZone({
    super.key,
    required this.feature
  });

  @override
  Widget build(BuildContext context,ref) {

    return Column(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Describa cómo le ayudará esta función y qué importancia tiene para usted.",
          style: GoogleFonts.quicksand(
            color: Colors.black
          ),
        ),
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_,i){

              final answer = feature.featureAnswers[i];
          
              return FeatureAnswerButton(answer: answer);
          
            }, 
            separatorBuilder: (_,__) => Gap(15), 
            itemCount: 4
          ),
        ),
        TextFormField(
          initialValue: ref.read(featuresProvider).comment.isNotEmpty ? ref.read(featuresProvider).comment : null,
          maxLines: 7,
          onChanged: (value){

            ref.read(featuresProvider.notifier).updateCommentFeatureSurver(value: value);

          },
          style: GoogleFonts.poppins(
            fontSize: 13,
            color: Colors.black,
            fontWeight: FontWeight.w300
          ),
          decoration: InputDecoration(
            hintText : "¿Por qué necesitas esto? (Cualquier contexto nos puede ayudar a hacer la funcionalidad mejor para los clientes)",
            hintStyle: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.black.withAlpha(150)
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0),width: 1)
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey,width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey..withValues(alpha: 0),width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.withValues(alpha: .1),width: 1)
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey,width: 1)
            ),
        ),
      ),
      ],
    );

  }

}