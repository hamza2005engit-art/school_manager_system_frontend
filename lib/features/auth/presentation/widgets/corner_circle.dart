import 'package:flutter/material.dart';

class CornerCircles extends StatelessWidget {
  const CornerCircles({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.shortestSide * 0.6;
    double circleSize = (size<300)? size : 300;
    return Stack(
      children: [
        Positioned(
          top: -circleSize / 2,
          right: -circleSize / 2,
          child: _Circle(circleSize, true,context),
        ),
        Positioned(
          bottom: -circleSize / 2,
          left: -circleSize / 2,
          child: _Circle(circleSize, false,context),
        ),
      ],
    );
  }

  //_Circle
  Widget _Circle(double size, bool isTop,context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.secondary],
        begin: (isTop)
            ? AlignmentGeometry.bottomLeft
            : AlignmentGeometry.topRight,
        end: (isTop)
            ? AlignmentGeometry.topRight
            : AlignmentGeometry.bottomLeft,
      ),
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.secondary,
          offset: Offset(-6, 6),
          blurRadius: 10,
        ),
        BoxShadow(
          color: Theme.of(context).colorScheme.secondary,
          offset: Offset(6, -6),
          blurRadius: 10,
        ),
      ],
    ),
  );
}
