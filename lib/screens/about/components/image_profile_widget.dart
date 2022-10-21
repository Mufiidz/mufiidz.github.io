import 'package:flutter/material.dart';

class ImageProfileWidget extends StatelessWidget {
  final String linkImage;
  const ImageProfileWidget(this.linkImage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.centerRight,
      widthFactor: 0.65,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: linkImage.isNotEmpty
                ? Image.network(
                    linkImage,
                    fit: BoxFit.fill,
                  )
                : const Center(
                  heightFactor: 15,
                    child: Text(
                      'No Image',
                    ),
                  )),
      ),
    );
  }
}
