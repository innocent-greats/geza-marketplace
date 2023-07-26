import 'package:flutter/material.dart';
import 'colors.dart';
import 'dimensions.dart';

class CustomStyle {
  static var textStyle = TextStyle(
      color: CustomColor.greyColor, fontSize: Dimensions.defaultTextSize);

  static var hintTextStyle = TextStyle(
      color: Colors.grey.withOpacity(0.5),
      fontSize: Dimensions.defaultTextSize);

  static var listStyle = TextStyle(
      color: Colors.white,
      fontSize: Dimensions.defaultTextSize,
      fontWeight: FontWeight.bold);

  static var defaultStyle =
      TextStyle(color: Colors.black, fontSize: Dimensions.largeTextSize);

  static var focusBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    borderSide:
        BorderSide(color: Color.fromARGB(255, 173, 170, 174), width: 2.0),
  );

  static var focusErrorBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(color: Color.fromARGB(255, 247, 10, 10), width: 1.0),
  );

  static var searchBox = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide:
        BorderSide(color: Color.fromARGB(255, 173, 170, 174), width: 1.0),
  );
}
