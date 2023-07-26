import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/screens/dashboard/sliver_app_bar.dart';
import 'package:geza_lite/screens/dashboard_screen.dart';
import 'package:geza_lite/utils/dimensions.dart';

class HomeDashboardWidget extends StatefulWidget {
  const  HomeDashboardWidget({super.key});

  @override
  _HomeDashboardWidgetState createState() => _HomeDashboardWidgetState();
}

class _HomeDashboardWidgetState extends State<HomeDashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize,
          top: Dimensions.heightSize * 5,
          bottom: Dimensions.heightSize * 3),
      child: GestureDetector(
        child: const SizedBox(
            width: 120,
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.purple,
                ),
                // Text(
                //   Strings.back,
                //   style: TextStyle(
                //       color: Colors.white, fontSize: Dimensions.largeTextSize),
                // )
              ],
            )),
        onTap: () {
          Get.offAll(const SliverAppBarScreen());
        },
      ),
    );
  }
}
