/*  
 *  Created by asandyputra on 16/04/2026.
 */

import 'package:flutter/material.dart';
import 'package:sibiru_dev/shared/widgets/skeleton_box.dart';

class ProfilPageSkeleton extends StatelessWidget {
  const ProfilPageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const ValueKey('profil-skeleton'),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Row(
              children: [
                SkeletonBox(
                  width: 64,
                  height: 64,
                  borderRadius: BorderRadius.all(Radius.circular(99)),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkeletonBox(width: 150, height: 14),
                      SizedBox(height: 10),
                      SkeletonBox(width: 120, height: 10),
                      SizedBox(height: 10),
                      SkeletonBox(width: 170, height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const _SectionTitleSkeleton(),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              children: List.generate(
                3,
                (index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      SkeletonBox(width: 42, height: 42),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SkeletonBox(width: 120, height: 12),
                            SizedBox(height: 8),
                            SkeletonBox(width: 160, height: 10),
                          ],
                        ),
                      ),
                      SizedBox(width: 12),
                      SkeletonBox(width: 18, height: 18),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const _SectionTitleSkeleton(),
          const SizedBox(height: 12),
          const Row(
            children: [
              Expanded(
                child: SkeletonBox(
                  height: 96,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: SkeletonBox(
                  height: 96,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SkeletonBox(height: 130, borderRadius: BorderRadius.circular(22)),
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
        SkeletonBox(width: 145, height: 16),
        Spacer(),
        SkeletonBox(width: 70, height: 12),
      ],
    );
  }
}
