import 'package:flutter/material.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/widgets/bg_image_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                          Strings.demoName,
                          style: TextStyle(
                              fontSize: Dimensions.extraLargeTextSize,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.heightSize,
                    ),
                    profileWidget(context),
                    const SizedBox(
                      height: Dimensions.heightSize * 2,
                    ),
                    aboutDetailsWidget(context)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  profileWidget(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Image.asset(
            'assets/images/user.png',
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: Dimensions.heightSize,
        ),
        Text(
          'CEO, Beauty Girls Parlour ',
          style: CustomStyle.textStyle,
        ),
        const SizedBox(
          height: Dimensions.heightSize * 0.5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const MyRating(rating: '5',),
            const SizedBox(
              width: Dimensions.widthSize * 0.5,
            ),
            Text(
              '5',
              style: CustomStyle.textStyle,
            ),
            const SizedBox(
              width: Dimensions.widthSize * 0.5,
            ),
            Text(
              '(130)',
              style: CustomStyle.textStyle,
            ),
          ],
        ),
      ],
    );
  }

  aboutDetailsWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.about,
              style: TextStyle(
                  fontSize: Dimensions.extraLargeTextSize,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: Dimensions.heightSize * 0.5),
            Text(
              Strings.subTitle1,
              style: CustomStyle.textStyle,
            ),
            const SizedBox(height: Dimensions.heightSize),
            Text(
              Strings.openingHours,
              style: TextStyle(
                  fontSize: Dimensions.extraLargeTextSize,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: Dimensions.heightSize * 0.5),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Mon - Wed',
                        style: CustomStyle.textStyle,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '8:00 am - 12:00 pm',
                        style: CustomStyle.textStyle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Dimensions.heightSize * 0.5),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Fri - Sat',
                        style: CustomStyle.textStyle,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '10:00 am - 11:00 pm',
                        style: CustomStyle.textStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: Dimensions.heightSize),
            Text(
              Strings.address,
              style: TextStyle(
                  fontSize: Dimensions.extraLargeTextSize,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: Dimensions.heightSize * 0.5),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.location_on,
                          color: CustomColor.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: Dimensions.widthSize,
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          '58 Street- al dulha london - USA',
                          style: CustomStyle.textStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.directions,
                        color: CustomColor.primaryColor,
                      ),
                      const SizedBox(
                        width: Dimensions.widthSize,
                      ),
                      Text(
                        '5 KM',
                        style: CustomStyle.textStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
