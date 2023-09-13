import 'package:cdio_web/components/image/BaseImage.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class ImageAlbum extends StatefulWidget {
  const ImageAlbum(this.images, {super.key, this.isLoading = false});
  final List<String> images;
  final bool isLoading;

  @override
  State<ImageAlbum> createState() => _ImageAlbumState();
}

class _ImageAlbumState extends State<ImageAlbum> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 720,
      ),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
                maxWidth: 720,
                maxHeight: 720
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: widget.isLoading ? const SkeletonAvatar() : BaseImage(
                widget.images[_selectedIndex],
                fit: BoxFit.cover,
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
                maxHeight: 150,
                maxWidth: 720
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.isLoading ? null : widget.images.length,
              itemBuilder: (_, index) {
                if(widget.isLoading) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: SizedBox(
                        width: 110,
                        child: SkeletonAvatar()
                    ),
                  );
                }
                return GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: index == _selectedIndex ? Border.all(
                            width: 2,
                            color: Colors.black
                        ) : null
                    ),
                    child: BaseImage(
                      widget.images[index],
                      width: 110,
                      height: 110,
                    ),
                  ),
                  onTap: () => setState(() {
                    _selectedIndex = index;
                  }),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}