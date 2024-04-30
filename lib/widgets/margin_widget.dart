import 'package:flutter/material.dart';

class HorizontalMargin extends StatelessWidget {
  final double margin;
  const HorizontalMargin(this.margin, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: margin,
    );
  }
}

class VerticalMargin extends StatelessWidget {
  final double margin;
  const VerticalMargin(this.margin, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: margin,
    );
  }
}
