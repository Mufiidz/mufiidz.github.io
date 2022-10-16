import 'package:flutter/material.dart';

class ItemDesignWidget extends StatelessWidget {
  final String image;
  final BoxFit? fit;
  const ItemDesignWidget({Key? key, required this.image, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              image,
              fit: fit,
            )),
      ),
    );
  }
}
