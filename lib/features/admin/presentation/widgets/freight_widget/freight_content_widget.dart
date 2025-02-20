import 'package:flutter/material.dart';

class FreightContentWidget extends StatelessWidget {

  const FreightContentWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          spacing: 10,
          children: [
            
          ],
        ),
      ),
    );
    
  }

}