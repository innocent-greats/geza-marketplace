import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/auth/auth_controller.dart';
import 'package:geza_lite/controllers/customer_service_controller.dart';
import 'package:geza_lite/controllers/provider_service_controller.dart';
import 'package:geza_lite/data/category.dart';
import 'package:geza_lite/screens/add_new_card_screen.dart';
import 'package:geza_lite/screens/change_password_screen.dart';
import 'package:geza_lite/screens/dashboard/profile_screen.dart';
import 'package:geza_lite/screens/drawer/categories.dart';
import 'package:geza_lite/screens/drawer/messages_list_screen.dart';
import 'package:geza_lite/screens/drawer/search_box.dart';
import 'package:geza_lite/screens/booking_messaging_screen.dart';
import 'package:geza_lite/trader_screens/dashboard/appointment_history_screen.dart';
import 'package:geza_lite/trader_screens/drawer/coupon_list_screen.dart';
import 'package:geza_lite/trader_screens/drawer/expert_list_screen.dart';
import 'package:geza_lite/trader_screens/drawer/my_card_screen.dart';
import 'package:geza_lite/trader_screens/drawer/offer_list_screen.dart';
import 'package:geza_lite/trader_screens/drawer/service_list_screen.dart';
import 'package:geza_lite/trader_screens/help_support_screen.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/provider_strings.dart';
import 'package:geza_lite/utils/strings.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({super.key});
  final AuthController _authController = Get.put(AuthController());
  final CustomerServicesController _servicesController =
      Get.put(CustomerServicesController());
  final ProviderServicesController _providerServicesController =
      Get.put(ProviderServicesController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            // bottom: Dimensions.heightSize * 2,
            left: Dimensions.marginSize,
            right: Dimensions.marginSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SearchBox(),
                // HomeCategories(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
