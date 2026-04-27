/*  
 *  Created by asandyputra on 16/04/2026.
 */

import 'package:flutter/material.dart';
import 'package:sibiru_dev/features/home/data/layanan_repository.dart';
import 'package:sibiru_dev/features/home/models/layanan_model.dart';
import 'package:sibiru_dev/features/home/widgets/announcment.dart';
import 'package:sibiru_dev/features/home/widgets/berita_section.dart';
import 'package:sibiru_dev/features/home/widgets/header.dart';
import 'package:sibiru_dev/features/home/widgets/layanan_grid.dart';
import 'package:sibiru_dev/features/home/widgets/map_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _repository = LayananRepository();
  late final List<Layanan> layanan;

  @override
  void initState() {
    super.initState();
    layanan = _repository.getLayanan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderWidget(),
              const SizedBox(height: 15),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: AnnouncementWidget(),
              ),

              const SizedBox(height: 15),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Layanan Kami",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: LayananGrid(layanan: layanan),
              ),

              const SizedBox(height: 20),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: BeritaSection(),
              ),

              const SizedBox(height: 20),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: MapSection(),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
