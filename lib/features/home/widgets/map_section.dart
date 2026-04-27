/*  
 *  Created by asandyputra on 16/04/2026.
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MapSection extends StatelessWidget {
  const MapSection({super.key});

  static const String _address = 'BSPJI Banjarbaru, Kalimantan Selatan';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Lokasi Kami',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade300,
          ),
          child: const Center(child: Icon(Icons.map, size: 40)),
        ),
        const SizedBox(height: 8),
        const Text(_address, style: TextStyle(fontSize: 12)),
        const SizedBox(height: 10),
        OutlinedButton.icon(
          onPressed: () async {
            await Clipboard.setData(const ClipboardData(text: _address));
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Alamat berhasil disalin')),
            );
          },
          icon: const Icon(Icons.copy),
          label: const Text('Salin Alamat'),
        ),
      ],
    );
  }
}
