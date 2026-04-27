/*  
 *  Created by asandyputra on 16/04/2026.
 */

import 'package:flutter/material.dart';
import '../models/layanan_model.dart';

class LayananData {
  static const List<Layanan> list = [
    Layanan(title: "Pengujian", icon: Icons.biotech_rounded),
    Layanan(title: "Kalibrasi", icon: Icons.precision_manufacturing),
    Layanan(title: "Sertifikasi Produk", icon: Icons.verified),
    Layanan(
      title: "Sertifikasi Industri Hijau",
      icon: Icons.energy_savings_leaf_rounded,
    ),
    Layanan(
      title: "Sertifikasi Sistem Manajemen Mutu",
      icon: Icons.wallet_membership_rounded,
    ),
    Layanan(title: "LPH Halal", icon: Icons.health_and_safety_outlined),
    Layanan(title: "Verifikasi TKDN", icon: Icons.view_in_ar_sharp),
    Layanan(title: "Bimtek", icon: Icons.groups_outlined),
    Layanan(title: "Sertifikasi HACCP", icon: Icons.bubble_chart_rounded),
    Layanan(title: "Sertifikasi GRK", icon: Icons.cloud_done_sharp),
    Layanan(title: "Sertifikasi ISPO", icon: Icons.grass_outlined),
    Layanan(title: "RPBI", icon: Icons.bento_outlined),
    Layanan(title: "Pemanfaatan Aset", icon: Icons.business_sharp),
    Layanan(title: "Penggunaan SDM", icon: Icons.supervised_user_circle),
    Layanan(title: "Inspeksi Teknis", icon: Icons.engineering_sharp),
    Layanan(title: "Pendampingan & Konsultasi", icon: Icons.support_agent),
    Layanan(title: "Pengambilan Contoh Uji", icon: Icons.science),
  ];
}
