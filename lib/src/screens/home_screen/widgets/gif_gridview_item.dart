import 'package:flutter/material.dart';
import 'package:giphy_search/src/models/giphy.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:share/share.dart';
class GifGridViewItem extends StatelessWidget {
  final Giphy giphy;

  GifGridViewItem({@required this.giphy});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Share.share(giphy.images.previewWebp.url);
      },
      child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: giphy.images.previewWebp.url,
          fit: BoxFit.cover),
    );
  }
}
