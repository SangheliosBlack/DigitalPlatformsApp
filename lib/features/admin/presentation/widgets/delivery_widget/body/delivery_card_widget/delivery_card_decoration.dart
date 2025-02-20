import 'package:flutter/material.dart';

class DeliveryCardDecoration extends StatelessWidget {

  final Widget child;
  final bool hover;

  const DeliveryCardDecoration({
    super.key,
    required this.child,
    required this.hover
  });

  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(
      margin: EdgeInsets.symmetric(
        horizontal: 15
      ),
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 2,
          color: Color.fromRGBO(199,216,241,hover ? 1: 0)
        ),
        boxShadow: hover ? [
          BoxShadow(
            color: Colors.blueAccent.withAlpha(20),
            offset: Offset(0,0),
            spreadRadius: 5,
            blurRadius: 10
          )
        ] : null,
        borderRadius: BorderRadius.circular(17)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: hover ?  const Color.fromARGB(255, 69, 146, 208) : Colors.grey.withAlpha(50)
            ),
            borderRadius: BorderRadius.circular(15)
          ),
          child: child,
        ),
      ),
    );

  }

}