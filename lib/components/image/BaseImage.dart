import 'package:cdio_web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class BaseImage extends StatelessWidget {
  const BaseImage(this.url, {super.key, this.fit = BoxFit.cover, this.width, this.height});
  final String url;
  final BoxFit fit;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(
        url
      ),
      loadingBuilder: (_, widget, event) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: event == null ? widget : SizedBox(
            width: width,
            height: height,
            child: const SkeletonAvatar(),
          ),
        );
      },
      fit: fit,
      width: width,
      height: height,
    );
  }
}
