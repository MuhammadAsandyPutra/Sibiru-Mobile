/*  
 *  Created by asandyputra on 16/04/2026.
 */

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonBox extends StatelessWidget {
  final double? width;
  final double height;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? margin;

  const SkeletonBox({
    super.key,
    this.width,
    required this.height,
    this.borderRadius,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(12);

    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(borderRadius: radius),
      child: Shimmer.fromColors(
        baseColor: const Color(0xFFE8EEF6),
        highlightColor: const Color(0xFFF7FAFC),
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.white, borderRadius: radius),
        ),
      ),
    );
  }
}
