/*  
 *  Created by asandyputra on 16/04/2026.
 */

import 'package:flutter/material.dart';
import 'package:sibiru_dev/features/layanan/webview_page.dart';
import 'package:sibiru_dev/features/layanan/widgets/layanan_page_skeleton.dart';
import 'package:sibiru_dev/shared/widgets/delayed_skeleton_loader.dart';
import 'package:sibiru_dev/shared/widgets/page_hero_card.dart';
import 'package:sibiru_dev/shared/widgets/page_section_title.dart';

class LayananPage extends StatelessWidget {
  const LayananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DelayedSkeletonLoader(
          skeleton: const LayananPageSkeleton(),
          child: SingleChildScrollView(
            key: const ValueKey('layanan-content'),
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                PageHeroCard(
                  title: 'Pusat Layanan',
                  subtitle: 'Akses kebutuhan industri dalam satu halaman.',
                  icon: Icons.apps_rounded,
                ),
                SizedBox(height: 18),
                PageSectionTitle(
                  title: 'Layanan Utama',
                  actionLabel: 'Semua Kategori',
                ),
                SizedBox(height: 12),
                _ServiceHighlightGrid(),
                SizedBox(height: 20),
                PageSectionTitle(
                  title: 'Langkah Pengajuan',
                  actionLabel: 'Panduan',
                ),
                SizedBox(height: 12),
                _ProcessTimeline(),
                SizedBox(height: 20),
                PageSectionTitle(
                  title: 'Informasi Cepat',
                  actionLabel: 'Detail',
                ),
                SizedBox(height: 12),
                _InfoBanner(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ServiceHighlightGrid extends StatelessWidget {
  const _ServiceHighlightGrid();

  static const List<
    ({
      String title,
      String label,
      String meta,
      IconData icon,
      List<Color> colors,
      String? url,
    })
  >
  _items = [
    (
      title: 'Pengujian',
      label: 'Respon cepat',
      meta: 'Laboratorium terakreditasi',
      icon: Icons.biotech_rounded,
      colors: [Color(0xFFEAF2FF), Color(0xFFD6E6FF)],
      url: 'https://bspjibanjarbaru.kemenperin.go.id/pengujian/',
    ),
    (
      title: 'Kalibrasi',
      label: 'Slot tersedia',
      meta: 'Penjadwalan terintegrasi',
      icon: Icons.precision_manufacturing,
      colors: [Color(0xFFEAFBF1), Color(0xFFD8F5E5)],
      url: 'https://bspjibanjarbaru.kemenperin.go.id/pengambilan-contoh-uji/',
    ),
    (
      title: 'Sertifikasi Produk',
      label: 'Dokumen digital',
      meta: 'Proses tertelusur',
      icon: Icons.verified,
      colors: [Color(0xFFFFF1DF), Color(0xFFFFE6C7)],
      url: 'https://bspjibanjarbaru.kemenperin.go.id/sertifikasi/',
    ),
    (
      title: 'Pendampingan & Konsultasi',
      label: 'Tim ahli',
      meta: 'Pendampingan kebutuhan industri',
      icon: Icons.support_agent,
      colors: [Color(0xFFEEF1FF), Color(0xFFE0E6FF)],
      url: 'https://bspjibanjarbaru.kemenperin.go.id/pendampingan-industri/',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.82,
      ),
      itemBuilder: (context, index) {
        final item = _items[index];

        return Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(22),
            onTap: () {
              if (item.url != null) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                        LayananWebViewPage(title: item.title, url: item.url!),
                  ),
                );
                return;
              }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${item.title} segera tersedia')),
              );
            },
            child: Ink(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: const Color(0xFFDCE6F4)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF123A78).withValues(alpha: 0.06),
                    blurRadius: 18,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: item.colors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      item.icon,
                      color: const Color(0xFF123A78),
                      size: 24,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F7FD),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      item.label,
                      style: const TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF123A78),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xFF0F172A),
                    ),
                  ),

                  const SizedBox(height: 6),

                  Expanded(
                    child: Text(
                      item.meta,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        height: 1.45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ProcessTimeline extends StatelessWidget {
  const _ProcessTimeline();

  static const List<({String step, String detail})> _steps = [
    (
      step: 'Ajukan layanan',
      detail: 'Isi formulir pengajuan dan unggah dokumen kebutuhan industri.',
    ),
    (
      step: 'Verifikasi administrasi',
      detail: 'Petugas memeriksa kelengkapan, validitas, dan kesiapan jadwal.',
    ),
    (
      step: 'Pelaksanaan teknis',
      detail:
          'Pengujian, kalibrasi, atau sertifikasi dilakukan sesuai layanan.',
    ),
    (
      step: 'Hasil dan tindak lanjut',
      detail: 'Dokumen hasil diterbitkan dan dapat dipantau melalui sistem.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFDCE6F4)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF123A78).withValues(alpha: 0.05),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: List.generate(_steps.length, (index) {
          final item = _steps[index];
          final isLast = index == _steps.length - 1;

          return IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: const Color(0xFF123A78),
                          borderRadius: BorderRadius.circular(999),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(
                                0xFF123A78,
                              ).withValues(alpha: 0.18),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      if (!isLast)
                        Expanded(
                          child: Container(
                            width: 2,
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFFD7E3F4),
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 2, bottom: isLast ? 0 : 4),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FBFF),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: const Color(0xFFE1EAF7)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.step,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF0F172A),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              item.detail,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _InfoBanner extends StatelessWidget {
  const _InfoBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF8FBFF), Color(0xFFF2F7FD)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFD6E4F3)),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xFF123A78),
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: SizedBox(
              width: 44,
              height: 44,
              child: Icon(
                Icons.schedule_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jam Operasional Layanan',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0F172A),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Senin-Jumat, 08.00-16.00 WITA. Pengajuan yang diterima di luar jam operasional akan diproses pada hari kerja berikutnya.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
