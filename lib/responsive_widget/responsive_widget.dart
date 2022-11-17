import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobileWidget;
  final Widget tabletWidget;
  final Widget webWidget;
  const ResponsiveWidget({
    Key? key,
    required this.mobileWidget,
    required this.tabletWidget,
    required this.webWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: (context, cons) {
        if (cons.maxWidth < 700) return mobileWidget;

        if (cons.maxWidth > 1200) return webWidget;

        return tabletWidget;
      });
}
