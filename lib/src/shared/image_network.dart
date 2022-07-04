import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  ImageNetwork({Key? key, required this.imageLink}) : super(key: key);

  String imageLink;

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
