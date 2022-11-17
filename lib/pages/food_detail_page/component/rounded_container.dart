import 'package:flutter/material.dart';

//uso sta classe tipo 5-6 volte, allora l'ho riciclata
class RoundedContainer extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  final Widget? child;
  const RoundedContainer({
    Key? key,
    this.color,
    this.width = 40.0,
    this.height = 40.0,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(5.0),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: color,
        ),
        child: child,
      );
}
