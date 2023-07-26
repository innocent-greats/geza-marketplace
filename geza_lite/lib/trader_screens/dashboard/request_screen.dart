import 'package:flutter/material.dart';

import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/widgets/bg_image_widget.dart';
import 'package:geza_lite/data/request.dart';
import 'package:geza_lite/screens/service_summery_screen.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: Stack(
          children: [
            const BgImageWidget(),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: CustomColor.accentColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius * 2),
                        topRight: Radius.circular(Dimensions.radius * 2))),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: Dimensions.heightSize * 3),
                      child: Text(
                        Strings.userRequest,
                        style: TextStyle(
                            fontSize: Dimensions.extraLargeTextSize * 1.2,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.heightSize * 2,
                    ),
                    bodyWidget(context)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: RequestList.list().length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            Request request = RequestList.list()[index];
            return GestureDetector(
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            request.image,
                            width: 60,
                            height: 60,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(
                          width: Dimensions.widthSize,
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                request.name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Dimensions.largeTextSize,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: Dimensions.heightSize * 0.5,
                              ),
                              Text('${request.date}, ${request.time}',
                                  style: CustomStyle.textStyle),
                              Text('Order Amount ${request.amount}',
                                  style: CustomStyle.textStyle),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: Dimensions.widthSize,
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Container(
                                height: 25,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: CustomColor.primaryColor,
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius * 2)),
                                child: Center(
                                  child: Text(
                                    Strings.accept,
                                    style: TextStyle(
                                        fontSize: Dimensions.smallTextSize,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: Dimensions.widthSize * 0.5,
                              ),
                              Container(
                                height: 25,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: CustomColor.secondaryColor,
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius * 2)),
                                child: Center(
                                  child: Text(
                                    Strings.cancel,
                                    style: TextStyle(
                                        fontSize: Dimensions.smallTextSize,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: Dimensions.heightSize,
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: Dimensions.heightSize,
                    ),
                  ],
                ),
              ),
              onTap: () {
                _requestDetailsDialog(request);
              },
            );
          },
        ),
      ),
    );
  }

  Future<bool> _requestDetailsDialog(Request request) async {
    return (await showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => AlertDialog(
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    request.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.extraLargeTextSize,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: Dimensions.heightSize * 1.5,
                  ),
                  dateTimeWidget(context, request),
                  const SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  amountWidget(context, request),
                  const SizedBox(
                    height: Dimensions.heightSize * 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Container(
                          height: 25,
                          width: 60,
                          decoration: BoxDecoration(
                              color: CustomColor.primaryColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius * 2)),
                          child: Center(
                            child: Text(
                              Strings.accept,
                              style: TextStyle(
                                  fontSize: Dimensions.smallTextSize,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const ServiceSummeryScreen()));
                        },
                      ),
                      const SizedBox(width: Dimensions.widthSize),
                      GestureDetector(
                        child: Container(
                          height: 25,
                          width: 60,
                          decoration: BoxDecoration(
                              color: CustomColor.secondaryColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius * 2)),
                          child: Center(
                            child: Text(
                              Strings.cancel,
                              style: TextStyle(
                                  fontSize: Dimensions.smallTextSize,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )) ??
        false;
  }

  dateTimeWidget(BuildContext context, Request request) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.dateTime,
          style: TextStyle(
              color: Colors.black,
              fontSize: Dimensions.extraLargeTextSize,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: Dimensions.heightSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Strings.date, style: CustomStyle.textStyle),
            Text(request.date, style: CustomStyle.textStyle),
          ],
        ),
        const SizedBox(height: Dimensions.heightSize * 0.5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Strings.time, style: CustomStyle.textStyle),
            Text(request.time, style: CustomStyle.textStyle),
          ],
        ),
      ],
    );
  }

  amountWidget(BuildContext context, Request request) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.amount,
          style: TextStyle(
              color: Colors.black,
              fontSize: Dimensions.extraLargeTextSize,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: Dimensions.heightSize),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.service,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  Text(
                    'Style Hair Cut',
                    style: CustomStyle.textStyle,
                  ),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.5,
                  ),
                  Text(
                    'Spa',
                    style: CustomStyle.textStyle,
                  ),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.5,
                  ),
                  Text(
                    'Skin Treatment',
                    style: CustomStyle.textStyle,
                  ),
                ],
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         Strings.quantity,
            //         style: const TextStyle(
            //             fontSize: 12,
            //             color: Colors.black,
            //             fontWeight: FontWeight.bold),
            //       ),
            //       const SizedBox(
            //         height: Dimensions.heightSize,
            //       ),
            //       Text(
            //         '01',
            //         style: CustomStyle.textStyle,
            //       ),
            //       const SizedBox(
            //         height: Dimensions.heightSize * 0.5,
            //       ),
            //       Text(
            //         '01',
            //         style: CustomStyle.textStyle,
            //       ),
            //       const SizedBox(
            //         height: Dimensions.heightSize * 0.5,
            //       ),
            //       Text(
            //         '01',
            //         style: CustomStyle.textStyle,
            //       ),
            //     ],
            //   ),
            // ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.price,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  Text(
                    '\$25',
                    style: CustomStyle.textStyle,
                  ),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.5,
                  ),
                  Text(
                    '\$100',
                    style: CustomStyle.textStyle,
                  ),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.5,
                  ),
                  Text(
                    '\$80',
                    style: CustomStyle.textStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: Dimensions.heightSize),
        const SizedBox(height: Dimensions.heightSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.subTotal,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const Text(
              '\$205',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: Dimensions.heightSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.discountByCoupon,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const Text(
              '\$10',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: Dimensions.heightSize),
        const Divider(
          color: Colors.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.total,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const Text(
              '\$195 ',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
