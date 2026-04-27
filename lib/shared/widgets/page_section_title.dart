/*  
 *  Created by asandyputra on 16/04/2026.
 */

import 'package:flutter/material.dart';

class PageSectionTitle extends StatelessWidget {
  final String title;
  final String? actionLabel;

  const PageSectionTitle({super.key, required this.title, this.actionLabel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Color(0xFF0F172A),
            ),
          ),
        ),
        if (actionLabel != null)
          Text(
            actionLabel!,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E4FA1),
            ),
          ),
      ],
    );
  }
}
