import 'package:flutter/material.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/provider_strings.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/widgets/back_widget.dart';
import 'package:geza_lite/widgets/bg_image_widget.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  _HelpSupportScreenState createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackWidget(
                      iconColor: Colors.white,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius * 2),
                              topRight:
                                  Radius.circular(Dimensions.radius * 2))),
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: Dimensions.heightSize * 3),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                ProvicerStrings.helpSupport,
                                style: TextStyle(
                                    fontSize:
                                        Dimensions.extraLargeTextSize * 1.2,
                                    color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: Dimensions.heightSize,
                          ),
                          settingsWidget(context),
                          const SizedBox(
                            height: Dimensions.heightSize * 3,
                          ),
                          faqWidget(context)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  settingsWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: Column(
        children: [
          Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Color(0xFFF8F8F8),
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimensions.radius))),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: Dimensions.marginSize, right: Dimensions.marginSize),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ProvicerStrings.myAccount,
                    style: TextStyle(
                        fontSize: Dimensions.defaultTextSize,
                        color: Colors.black),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 20.0,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: Dimensions.heightSize * 0.5,
          ),
          Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Color(0xFFF8F8F8),
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimensions.radius))),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: Dimensions.marginSize, right: Dimensions.marginSize),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ProvicerStrings.address,
                    style: TextStyle(
                        fontSize: Dimensions.defaultTextSize,
                        color: Colors.black),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 20.0,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: Dimensions.heightSize * 0.5,
          ),
          Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Color(0xFFF8F8F8),
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimensions.radius))),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: Dimensions.marginSize, right: Dimensions.marginSize),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ProvicerStrings.paymentMethod,
                    style: TextStyle(
                        fontSize: Dimensions.defaultTextSize,
                        color: Colors.black),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 20.0,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: Dimensions.heightSize * 0.5,
          ),
          Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Color(0xFFF8F8F8),
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimensions.radius))),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: Dimensions.marginSize, right: Dimensions.marginSize),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ProvicerStrings.vouchers,
                    style: TextStyle(
                        fontSize: Dimensions.defaultTextSize,
                        color: Colors.black),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 20.0,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: Dimensions.heightSize * 0.5,
          ),
          Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Color(0xFFF8F8F8),
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimensions.radius))),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: Dimensions.marginSize, right: Dimensions.marginSize),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ProvicerStrings.supportRequest,
                    style: TextStyle(
                        fontSize: Dimensions.defaultTextSize,
                        color: Colors.black),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 20.0,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: Dimensions.heightSize * 0.5,
          ),
        ],
      ),
    );
  }

  faqWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FAQ',
            style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.defaultTextSize,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 1,
                    child: ExpansionTile(
                      backgroundColor: Colors.white,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '0${(index + 1).toString()}. ',
                            style: CustomStyle.textStyle,
                          ),
                          Text(
                            'Rorem Ipsum is nosimplyrandom text',
                            style: CustomStyle.textStyle,
                          ),
                        ],
                      ),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: Dimensions.marginSize,
                              right: Dimensions.marginSize,
                              bottom: Dimensions.heightSize),
                          child: ListTile(
                            title: Text(
                              'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. ',
                              style: CustomStyle.textStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
