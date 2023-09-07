import 'package:cdio_web/components/image/BaseImage.dart';
import 'package:flutter/material.dart';

class ImageAlbum extends StatefulWidget {
  const ImageAlbum(this.images, {super.key});
  final List<String> images;

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
              child: BaseImage(
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
              itemCount: widget.images.length,
              itemBuilder: (_, index) {
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