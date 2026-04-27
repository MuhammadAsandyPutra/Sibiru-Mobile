/*  
 *  Created by asandyputra on 16/04/2026.
 */

import 'package:flutter/material.dart';
import 'package:sibiru_dev/features/profile/widgets/profile_page_skeleton.dart';
import 'package:sibiru_dev/shared/widgets/delayed_skeleton_loader.dart';
import 'package:sibiru_dev/shared/widgets/page_section_title.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DelayedSkeletonLoader(
          skeleton: const ProfilPageSkeleton(),
          child: SingleChildScrollView(
            key: const ValueKey('profil-content'),
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _ProfileHeader(),
                SizedBox(height: 20),
                PageSectionTitle(
                  title: 'Akun & Preferensi',
                  actionLabel: 'Ubah',
                ),
                SizedBox(height: 12),
                _ProfileMenuCard(),
                SizedBox(height: 20),
                PageSectionTitle(
                  title: 'Ringkasan Aktivitas',
                  actionLabel: 'Lihat Semua',
                ),
                SizedBox(height: 12),
                _ActivityStats(),
                SizedBox(height: 20),
                _HelpCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Color(0xFF1E4FA1),
            child: Text(
              'AS',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Asandy Putra',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                SizedBox(height: 4),
                Text(
                  'Koordinator Layanan Industri',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                SizedBox(height: 8),
                Text(
                  'asandy@example.com',
                  style: TextStyle(fontSize: 12, color: Colors.black45),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileMenuCard extends StatelessWidget {
  const _ProfileMenuCard();

  static const List<({IconData icon, String title, String subtitle})> _items = [
    (
      icon: Icons.badge_outlined,
      title: 'Data Perusahaan',
      subtitle: 'Kelola identitas dan dokumen usaha',
    ),
    (
      icon: Icons.notifications_none_rounded,
      title: 'Notifikasi',
      subtitle: 'Atur pengingat status dan jadwal',
    ),
    (
      icon: Icons.lock_outline_rounded,
      title: 'Keamanan Akun',
      subtitle: 'Ubah PIN atau pengaturan login',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: _items
            .map(
              (item) => ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                leading: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F0FF),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(item.icon, color: const Color(0xFF1E4FA1)),
                ),
                title: Text(
                  item.title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  item.subtitle,
                  style: const TextStyle(fontSize: 12),
                ),
                trailing: const Icon(Icons.chevron_right_rounded),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _ActivityStats extends StatelessWidget {
  const _ActivityStats();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: _ActivityCard(
            value: '17',
            label: 'Total Pengajuan',
            accent: Color(0xFFE0F2FE),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _ActivityCard(
            value: '5',
            label: 'Jadwal Aktif',
            accent: Color(0xFFDCFCE7),
          ),
        ),
      ],
    );
  }
}

class _ActivityCard extends StatelessWidget {
  final String value;
  final String label;
  final Color accent;

  const _ActivityCard({
    required this.value,
    required this.label,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: accent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class _HelpCard extends StatelessWidget {
  const _HelpCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFDCE7F8)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Butuh bantuan?',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Hubungi admin layanan untuk kendala dokumen, jadwal visitasi, atau kebutuhan konsultasi teknis.',
            style: TextStyle(fontSize: 12, color: Colors.black54, height: 1.5),
          ),
          SizedBox(height: 12),
          Text(
            'Helpdesk: 0511-000-000\nEmail: layanan@bspji.go.id',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
