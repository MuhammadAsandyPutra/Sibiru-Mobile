/*  
 *  Created by asandyputra on 16/04/2026.
 */

import 'package:flutter/material.dart';
import 'package:sibiru_dev/shared/widgets/skeleton_box.dart';

class LayananPageSkeleton extends StatelessWidget {
  const LayananPageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const ValueKey('layanan-skeleton'),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonBox(height: 132, borderRadius: BorderRadius.circular(24)),
          const SizedBox(height: 18),
          const _SectionTitleSkeleton(),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeletonBox(width: 44, height: 44),
                  Spacer(),
                  SkeletonBox(width: 110, height: 12),
                  SizedBox(height: 8),
                  SkeletonBox(width: 80, height: 10),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const _SectionTitleSkeleton(),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: List.generate(
                4,
                (index) => const Padding(
                  padding: EdgeInsets.only(bottom: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkeletonBox(
                        width: 10,
                        height: 10,
                        borderRadius: BorderRadius.all(Radius.circular(99)),
                        margin: EdgeInsets.only(top: 5),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SkeletonBox(width: 120, height: 12),
                            SizedBox(height: 8),
                            SkeletonBox(height: 10),
                            SizedBox(height: 6),
                            SkeletonBox(width: 150, height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const _SectionTitleSkeleton(),
          const SizedBox(height: 12),
          SkeletonBox(height: 110, borderRadius: BorderRadius.circular(20)),
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
        SkeletonBox(width: 140, height: 16),
        Spacer(),
        SkeletonBox(width: 90, height: 12),
      ],
    );
  }
}
