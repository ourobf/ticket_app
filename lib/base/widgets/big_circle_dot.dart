import 'package:flutter/material.dart';

class BigCircleDot extends StatelessWidget {
  final bool isRight;
  const BigCircleDot({super.key, required this.isRight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 10,
      child: DecoratedBox(
          decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: isRight == true
            ? const BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
            : const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
      )),
    );
  }
}
