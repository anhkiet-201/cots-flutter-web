import 'package:cdio_web/components/space.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class ProductCardSkeleton extends StatelessWidget {
  const ProductCardSkeleton( {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 300,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(1, 1),
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 1)
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const SkeletonAvatar(),
            ),
          ),
          SpacerV(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeletonParagraph(
                    style: const SkeletonParagraphStyle(
                      lines: 2
                    ),
                  ),
                  SpacerV(5),
                  const SizedBox(
                    height: 25,
                    width: 75,
                    child: SkeletonAvatar(),
                  )
                ],
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                  width: double.infinity,
                  child: SkeletonAvatar()
              )
          ),
          SpacerV(),
        ],
      ),
    );
  }
}
