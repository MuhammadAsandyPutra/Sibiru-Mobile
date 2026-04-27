/*  
 *  Created by asandyputra on 16/04/2026.
 */

import 'package:flutter/material.dart';
import 'package:sibiru_dev/features/status/widgets/status_page_skeleton.dart';
import 'package:sibiru_dev/shared/widgets/delayed_skeleton_loader.dart';
import 'package:sibiru_dev/shared/widgets/page_hero_card.dart';
import 'package:sibiru_dev/shared/widgets/page_section_title.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DelayedSkeletonLoader(
          skeleton: const StatusPageSkeleton(),
          child: SingleChildScrollView(
            key: const ValueKey('status-content'),
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                PageHeroCard(
                  title: 'Status Layanan',
                  subtitle: 'Pantau progres permohonan dan agenda terbaru.',
                  icon: Icons.track_changes_rounded,
                ),
                SizedBox(height: 18),
                _StatusOverviewCard(),
                SizedBox(height: 20),
                PageSectionTitle(
                  title: 'Progress Permohonan',
                  actionLabel: 'Riwayat',
                ),
                SizedBox(height: 12),
                _TrackingCard(
                  title: 'Kalibrasi Alat Produksi',
                  code: 'REG-240416-01',
                  status: 'Sedang diverifikasi',
                  statusColor: Color(0xFFD97706),
                  progress: 0.65,
                  stages: [
                    'Permohonan diterima',
                    'Dokumen diperiksa',
                    'Verifikasi teknis',
                    'Penjadwalan visitasi',
                  ],
                ),
                SizedBox(height: 12),
                _TrackingCard(
                  title: 'Sertifikasi Produk',
                  code: 'REG-240415-07',
                  status: 'Jadwal visitasi terbit',
                  statusColor: Color(0xFF1E4FA1),
                  progress: 0.85,
                  stages: [
                    'Permohonan diterima',
                    'Audit dokumen',
                    'Jadwal visitasi',
                    'Penerbitan hasil',
                  ],
                ),
                SizedBox(height: 20),
                PageSectionTitle(
                  title: 'Agenda Berikutnya',
                  actionLabel: 'Kalender',
                ),
                SizedBox(height: 12),
                _AgendaCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatusOverviewCard extends StatelessWidget {
  const _StatusOverviewCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
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
      child: const Row(
        children: [
          Expanded(
            child: _MiniStat(
              label: 'Aktif',
              value: '02',
              accent: Color(0xFF1E4FA1),
            ),
          ),
          Expanded(
            child: _MiniStat(
              label: 'Selesai',
              value: '14',
              accent: Color(0xFF16A34A),
            ),
          ),
          Expanded(
            child: _MiniStat(
              label: 'Perlu Tindak Lanjut',
              value: '01',
              accent: Color(0xFFD97706),
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String label;
  final String value;
  final Color accent;

  const _MiniStat({
    required this.label,
    required this.value,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: accent,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _TrackingCard extends StatelessWidget {
  final String title;
  final String code;
  final String status;
  final Color statusColor;
  final double progress;
  final List<String> stages;

  const _TrackingCard({
    required this.title,
    required this.code,
    required this.status,
    required this.statusColor,
    required this.progress,
    required this.stages,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          Text(
            code,
            style: const TextStyle(fontSize: 12, color: Colors.black45),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                '${(progress * 100).round()}%',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _VerticalStatusTimeline(
            progress: progress,
            color: statusColor,
            stages: stages,
          ),
        ],
      ),
    );
  }
}

class _VerticalStatusTimeline extends StatelessWidget {
  final double progress;
  final Color color;
  final List<String> stages;

  const _VerticalStatusTimeline({
    required this.progress,
    required this.color,
    required this.stages,
  });

  @override
  Widget build(BuildContext context) {
    final currentStage = (progress * stages.length).ceil().clamp(
      1,
      stages.length,
    );

    return Column(
      children: List.generate(stages.length, (index) {
        final stageNumber = index + 1;
        final isDone = stageNumber < currentStage;
        final isCurrent = stageNumber == currentStage;
        final isLast = index == stages.length - 1;

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 240),
                    curve: Curves.easeOut,
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isDone || isCurrent
                          ? color
                          : color.withValues(alpha: 0.12),
                      border: Border.all(
                        color: isCurrent
                            ? color.withValues(alpha: 0.24)
                            : Colors.transparent,
                        width: 4,
                      ),
                    ),
                    child: Center(
                      child: isDone
                          ? const Icon(
                              Icons.check_rounded,
                              size: 12,
                              color: Colors.white,
                            )
                          : Text(
                              '$stageNumber',
                              style: TextStyle(
                                color: isCurrent ? Colors.white : color,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
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
                          color: stageNumber < currentStage
                              ? color.withValues(alpha: 0.4)
                              : Colors.black12,
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: isLast ? 0 : 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stages[index],
                        style: TextStyle(
                          fontWeight: isCurrent
                              ? FontWeight.w700
                              : FontWeight.w600,
                          color: isDone || isCurrent
                              ? Colors.black87
                              : Colors.black45,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        isDone
                            ? 'Selesai'
                            : isCurrent
                            ? 'Sedang diproses'
                            : 'Menunggu tahap sebelumnya',
                        style: TextStyle(
                          fontSize: 12,
                          color: isDone || isCurrent ? color : Colors.black38,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _AgendaCard extends StatelessWidget {
  const _AgendaCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Visitasi Lapangan',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Jumat, 18 April 2026 • 09.30 WITA',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          SizedBox(height: 12),
          Text(
            'Pastikan dokumen pendukung dan PIC perusahaan sudah siap sebelum tim datang.',
            style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.5),
          ),
        ],
      ),
    );
  }
}
