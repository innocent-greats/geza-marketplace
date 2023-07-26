import 'package:flutter/material.dart';
import 'package:geza_lite/utils/dimensions.dart';
// import 'package:geza_lite/data/image.dart';
import 'package:gezamarketplace_client/gezamarketplace_client.dart';

class GalleryWidget extends StatefulWidget {
  final List<BeautyStyle> beautyStyles;

  const GalleryWidget({super.key, required this.beautyStyles});

  @override
  _GalleryWidgetState createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: widget.beautyStyles.length,
        itemBuilder: (context, index) {
          BeautyStyle beautyStyle = widget.beautyStyles[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: Dimensions.heightSize),
            child: Image.network(
              beautyStyle.images[0].pathLocation.toString(),
              height: 220,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
