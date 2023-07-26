import 'package:flutter/material.dart';

import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/widgets/my_rating.dart';
import 'package:geza_lite/data/review.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({super.key});

  @override
  _ReviewWidgetState createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize,
          right: Dimensions.marginSize,
          top: Dimensions.heightSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: ReviewList.list().length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  Review review = ReviewList.list()[index];
                  return Column(
                    children: [
                      const SizedBox(
                        height: Dimensions.heightSize,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ClipRRect(
                              child: Image.asset(
                                review.image,
                                height: 60,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: Dimensions.heightSize,
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  review.name,
                                  style: CustomStyle.defaultStyle,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${review.time} day ago',
                                      style: CustomStyle.textStyle,
                                    ),
                                    const SizedBox(
                                      width: Dimensions.widthSize,
                                    ),
                                    MyRating(
                                      rating: review.rating,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: Dimensions.heightSize,
                                ),
                                Text(
                                  review.comment,
                                  style: CustomStyle.textStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: Dimensions.heightSize,
                      ),
                      Divider(
                        color: Colors.black.withOpacity(0.1),
                      )
                    ],
                  );
                }),
          ),
          Row(
            children: [
              Text(
                '4.5',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Dimensions.extraLargeTextSize * 2),
              ),
              const SizedBox(
                width: Dimensions.heightSize,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overall Rating',
                    style: CustomStyle.defaultStyle,
                  ),
                  Row(
                    children: [
                      const MyRating(
                        rating: '5',
                      ),
                      const SizedBox(
                        width: Dimensions.heightSize,
                      ),
                      Text(
                        'Excellent',
                        style: CustomStyle.textStyle,
                      ),
                      Text(
                        '(25)',
                        style: CustomStyle.textStyle,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: Dimensions.heightSize,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Text(
                      'Environment',
                      style: CustomStyle.textStyle,
                    ),
                    Text(
                      '(5)',
                      style: CustomStyle.textStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 7,
                  decoration: const BoxDecoration(
                      color: CustomColor.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(2.5))),
                ),
              )
            ],
          ),
          const SizedBox(
            height: Dimensions.heightSize,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Text(
                      'Services',
                      style: CustomStyle.textStyle,
                    ),
                    Text(
                      '(5)',
                      style: CustomStyle.textStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 7,
                  decoration: const BoxDecoration(
                      color: CustomColor.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(2.5))),
                ),
              )
            ],
          ),
          const SizedBox(
            height: Dimensions.heightSize,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Text(
                      'Price',
                      style: CustomStyle.textStyle,
                    ),
                    Text(
                      '(5)',
                      style: CustomStyle.textStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 7,
                  decoration: const BoxDecoration(
                      color: CustomColor.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(2.5))),
                ),
              )
            ],
          ),
          const SizedBox(
            height: Dimensions.heightSize * 4,
          ),
        ],
      ),
    );
  }
}
