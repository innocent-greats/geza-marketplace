import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/customer_service_controller.dart';
import 'package:geza_lite/controllers/provider_service_controller.dart';
import 'package:geza_lite/screens/dashboard/profile_screen.dart';
import 'package:geza_lite/screens/drawer/categories.dart';
import 'package:geza_lite/screens/drawer/drawer.dart';
import 'package:geza_lite/screens/drawer/home_app_bar.dart';
import 'package:geza_lite/screens/drawer/messages_list_screen.dart';
import 'package:geza_lite/trader_screens/dashboard/appointment_history_screen.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/screens/dashboard/home_screen.dart';
import 'package:geza_lite/screens/dashboard/appointment_screen.dart';
import 'package:geza_lite/screens/dashboard/near_by_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

double scaledHeight(BuildContext context, double baseSize) {
  return baseSize * (MediaQuery.of(context).size.height / 800);
}

double scaledWidth(BuildContext context, double baseSize) {
  return baseSize * (MediaQuery.of(context).size.width / 375);
}

class HomeTabsScreen extends StatelessWidget {
  HomeTabsScreen({super.key});
  final CustomerServicesController _servicesController =
      Get.put(CustomerServicesController());
  final ProviderServicesController _providerServicesController =
      Get.put(ProviderServicesController());
  TextEditingController searchController = TextEditingController();
  TextEditingController neighbourhoodSerachController = TextEditingController();
  int currentIndex = 0;

  DateTime? currentBackPressTime;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      
      length: 3,
      child: Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          child: Container(
              color: CustomColor.primaryColor, child: DrawerWithProfileImage()),
        ),
        appBar: AppBar(
          flexibleSpace: Container(
            
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                HomeAppBar(),
                const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.directions_car)),
                    Tab(icon: Icon(Icons.directions_transit)),
                    Tab(icon: Icon(Icons.directions_bike)),
                  ],
                ),
              ],
            ),
          ),

          // title: const Text('Tabs Demo'),
        ),
        body: TabBarView(
          children: [
            HomeScreen(),
            HomeScreen(),
             MessagesListScreen(),
          ],
        ),
      ),
    );
  }
}
