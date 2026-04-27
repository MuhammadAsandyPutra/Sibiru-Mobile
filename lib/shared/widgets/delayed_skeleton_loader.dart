/*  
 *  Created by asandyputra on 16/04/2026.
 */

import 'dart:async';

import 'package:flutter/material.dart';

class DelayedSkeletonLoader extends StatefulWidget {
  final Widget skeleton;
  final Widget child;
  final Duration delay;

  const DelayedSkeletonLoader({
    super.key,
    required this.skeleton,
    required this.child,
    this.delay = const Duration(milliseconds: 700),
  });

  @override
  State<DelayedSkeletonLoader> createState() => _DelayedSkeletonLoaderState();
}

class _DelayedSkeletonLoaderState extends State<DelayedSkeletonLoader> {
  Timer? _timer;
  bool _showChild = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer(widget.delay, () {
      if (mounted) {
        setState(() {
          _showChild = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: _showChild ? widget.child : widget.skeleton,
    );
  }
}
