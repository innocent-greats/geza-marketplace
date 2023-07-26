import 'package:flutter/material.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class MyRating extends StatefulWidget {
  final String rating;

  const MyRating({super.key, required this.rating});

  @override
  _MyRatingState createState() => _MyRatingState();
}

class _MyRatingState extends State<MyRating> {
  @override
  Widget build(BuildContext context) {
    return SmoothStarRating(
        allowHalfRating: true,
        starCount: 5,
        rating: double.parse(widget.rating),
        size: 20.0,
        filledIconData: Icons.star,
        halfFilledIconData: Icons.star,
        color: Colors.yellow[800],
        borderColor: CustomColor.secondaryColor,
        spacing: 0.0);
  }
}
