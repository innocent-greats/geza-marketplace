import 'package:flutter/material.dart';

import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/data/request.dart';
import 'package:geza_lite/widgets/back_widget.dart';
import 'package:geza_lite/widgets/bg_image_widget.dart';

class AppointmentHistoryScreen extends StatefulWidget {
  const AppointmentHistoryScreen({super.key});

  @override
  _AppointmentHistoryScreenState createState() =>
      _AppointmentHistoryScreenState();
}

class _AppointmentHistoryScreenState extends State<AppointmentHistoryScreen> {
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: Stack(
          children: [
            const BgImageWidget(),
            BackWidget(
              iconColor: Colors.white,
            ),
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
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          Strings.notifications,
                          style: TextStyle(
                              fontSize: Dimensions.extraLargeTextSize * 1.2,
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
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
          reverse: false,
          itemBuilder: (context, index) {
            Request request = RequestList.list()[index];
            return Container(
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
                            Text('Amount ${request.amount}',
                                style: CustomStyle.textStyle),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$${request.amount}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Dimensions.largeTextSize,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: Dimensions.heightSize * 0.5,
                            ),
                            Text(request.status, style: CustomStyle.textStyle),
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
            );
          },
        ),
      ),
    );
  }
}
