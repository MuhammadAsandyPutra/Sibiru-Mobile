/*  
 *  Created by asandyputra on 16/04/2026.
 */

import 'package:flutter/material.dart';

class AnnouncementWidget extends StatelessWidget {
  const AnnouncementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.campaign, color: Colors.green),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "Layanan pengujian terbuka Senin–Jumat, 08.00–16.00 WITA",
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
