import 'package:flutter/material.dart';
import 'package:geza_lite/utils/colors.dart';

class BgImageWidget extends StatelessWidget {
  const BgImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/bg.png',
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          color: CustomColor.primaryColor.withOpacity(0.7),
        )
      ],
    );
  }
}
