/*  
 *  Created by asandyputra on 16/04/2026.
 */

import 'package:flutter/material.dart';
import 'package:sibiru_dev/splash/splash_screen.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const BSPJIMobile());
}

class BSPJIMobile extends StatelessWidget {
  const BSPJIMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BSPJI Mobile',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
