import 'package:flutter/material.dart';

class AnimationForExtraWidgets extends StatelessWidget {
  const AnimationForExtraWidgets({
    super.key,
    required this.decidingVariableToShowWidget,
    required this.childrens,
  });
  final List<Widget> childrens;
  final bool decidingVariableToShowWidget;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
        duration: Duration(milliseconds: 300),
        curve: Curves.fastEaseInToSlowEaseOut,
        child: decidingVariableToShowWidget
            ? SizedBox.shrink()
            : SizedBox(
                //height: 200,
                width: double.infinity,
                child: Column(spacing: 12, children: childrens)));
  }
}
