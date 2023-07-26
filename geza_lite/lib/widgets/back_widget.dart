import 'package:flutter/material.dart';
import 'package:geza_lite/utils/dimensions.dart';

class BackWidget extends StatefulWidget {
  Color iconColor;
  BackWidget({super.key, required this.iconColor});

  @override
  _BackWidgetState createState() => _BackWidgetState();
}

class _BackWidgetState extends State<BackWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize,
          top: Dimensions.heightSize * 5,
          bottom: Dimensions.heightSize * 3),
      child: GestureDetector(
        child: SizedBox(
            width: 120,
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: widget.iconColor ?? Colors.white,
                ),
                // Text(
                //   Strings.back,
                //   style: TextStyle(
                //       color: Colors.white, fontSize: Dimensions.largeTextSize),
                // )
              ],
            )),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
