import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageLoader extends StatefulWidget {
  final String image;
  final BoxFit fit;
  final bool isImageAssets;

  const ImageLoader({Key key, this.image, this.fit, this.isImageAssets})
      : super(key: key);

  @override
  _ImageLoaderState createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {
  @override
  Widget build(BuildContext context) {
    var image = widget.image;
    var fit = widget.fit;
    return CachedNetworkImage(
      imageUrl: widget.image,
      fit: widget.fit,
      placeholder: (context, url) => const Center(
        child: SizedBox(
          width: 25,
          height: 25,
          child: CircularProgressIndicator(),
        ),
      ),
      errorWidget: (context, url, error) => SvgPicture.asset(
        "assets/no_image.svg",
        fit: BoxFit.cover,
      ),
    );
  }
}
