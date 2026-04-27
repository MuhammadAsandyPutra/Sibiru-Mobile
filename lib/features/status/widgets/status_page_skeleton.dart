/*  
 *  Created by asandyputra on 16/04/2026.
 */

import 'package:flutter/material.dart';
import 'package:sibiru_dev/shared/widgets/skeleton_box.dart';

class StatusPageSkeleton extends StatelessWidget {
  const StatusPageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const ValueKey('status-skeleton'),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonBox(height: 132, borderRadius: BorderRadius.circular(24)),
          const SizedBox(height: 18),
          SkeletonBox(height: 96, borderRadius: BorderRadius.circular(22)),
          const SizedBox(height: 20),
          const _SectionTitleSkeleton(),
          const SizedBox(height: 12),
          const _TrackingCardSkeleton(),
          const SizedBox(height: 12),
          const _TrackingCardSkeleton(),
          const SizedBox(height: 20),
          const _SectionTitleSkeleton(),
          const SizedBox(height: 12),
          SkeletonBox(height: 128, borderRadius: BorderRadius.circular(22)),
        ],
      ),
    );
  }
}

class _TrackingCardSkeleton extends StatelessWidget {
  const _TrackingCardSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonBox(width: 160, height: 12),
          SizedBox(height: 8),
          SkeletonBox(width: 90, height: 10),
          SizedBox(height: 14),
          Row(
            children: [
              SkeletonBox(width: 120, height: 28),
              Spacer(),
              SkeletonBox(width: 32, height: 12),
            ],
          ),
          SizedBox(height: 14),
          SkeletonBox(
            height: 8,
            borderRadius: BorderRadius.all(Radius.circular(99)),
          ),
        ],
      ),
    );
  }
}

class _SectionTitleSkeleton extends StatelessWidget {
  const _SectionTitleSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SkeletonBox(width: 150, height: 16),
        Spacer(),
        SkeletonBox(width: 80, height: 12),
      ],
    );
  }
}
