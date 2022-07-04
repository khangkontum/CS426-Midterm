import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork({Key? key, required this.imageLink}) : super(key: key);

  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageLink.toString(),
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      errorBuilder: (context, exception, stackTrace) => Image.asset(
        'image/error_image.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
