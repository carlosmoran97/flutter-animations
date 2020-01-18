import 'package:flutter/material.dart';
import 'dart:math' as math;

class RadialExpansion extends StatelessWidget {
  RadialExpansion({
    Key key,
    this.minRadius,
    this.maxRadius,
    this.child,
  }) : clipTween = Tween<double>(
    begin: 2.0 * minRadius,
    end: 2.0 * (maxRadius / math.sqrt2),
  ),
        super(key: key);

  final double minRadius;
  final double maxRadius;
  final Tween<double> clipTween;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints size) {
        final double t = (size.biggest.width / 2.0 - minRadius) / (maxRadius - minRadius);
        final double rectClipExtent = clipTween.transform(t);
        return ClipOval(
          child: Center(
            child: SizedBox(
              width: rectClipExtent,
              height: rectClipExtent,
              child: ClipRect(
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}