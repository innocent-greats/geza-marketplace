import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/customer_service_controller.dart';
import 'package:geza_lite/controllers/provider_service_controller.dart';
import 'package:geza_lite/screens/list_views/booking_list_screen.dart';
import 'package:geza_lite/screens/drawer/drawer.dart';
import 'package:geza_lite/screens/drawer/home_app_bar.dart';
import 'package:geza_lite/screens/drawer/messages_list_screen.dart';
import 'package:geza_lite/screens/list_views/products_list_screen.dart';
import 'package:geza_lite/screens/list_views/stylists_list_screen.dart';
import 'package:geza_lite/screens/drawer/stylists_sliver_list.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';

import 'home_screen.dart';

class SliverAppBarScreen extends StatefulWidget {
  const SliverAppBarScreen({super.key});

  @override
  State<SliverAppBarScreen> createState() => _SliverAppBarScreenState();
}

class _SliverAppBarScreenState extends State<SliverAppBarScreen> {
  final bool _pinned = true;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ProviderServicesController _providerServicesController =
      Get.put(ProviderServicesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: DefaultTabController(
        length: 3,

        // drawer: Drawer(
        //   child: Container(
        //       color: CustomColor.primaryColor, child: DrawerWithProfileImage()),
        // ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              elevation: 0.7,
              automaticallyImplyLeading: false,
              backgroundColor: CustomColor.primaryColor,
              pinned: _pinned,
              expandedHeight: 170.0,
              // title: Text(
              //   Strings.beautyParlourBookingApp,
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: Dimensions.extraLargeTextSize,
              //   ),
              // ),

              flexibleSpace: FlexibleSpaceBar(
                // background: HomeAppBar(),
                title: Container(
                  padding: const EdgeInsets.only(top: 5),
                  height: Dimensions.heightSize * 2.5,
                  child: TabBar(
                    labelPadding: const EdgeInsets.symmetric(vertical: 1),
                    tabs: [
                      Stack(
                        // clipBehavior: Clip.none,
                        children: [
                          Row(
                            children: [
                              const Tab(
                                  child: Text(
                                'Stylists',
                                style: TextStyle(fontSize: 12),
                              )),
                              const SizedBox(
                                width: Dimensions.heightSize * 0.5,
                              ),
                              Positioned(
                                right: -8,
                                top: -8,
                                child: Container(
                                  height: 15.0,
                                  width: 15.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Center(
                                    child: Obx(() => Text(
                                          "${_providerServicesController.allTraders.length}",
                                          style: TextStyle(
                                              color: CustomColor.primaryColor,
                                              fontSize:
                                                  Dimensions.smallTextSize),
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Row(
                            children: [
                              const Tab(
                                  child: Text(
                                'Store',
                                style: TextStyle(fontSize: 12),
                              )),
                              const SizedBox(
                                width: Dimensions.heightSize * 0.5,
                              ),
                              Positioned(
                                right: -5,
                                top: -7,
                                child: Container(
                                  height: 15.0,
                                  width: 15.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Center(
                                    child: Obx(() => Text(
                                          "${_providerServicesController.totalbeautyProducts}",
                                          style: TextStyle(
                                              color: CustomColor.primaryColor,
                                              fontSize:
                                                  Dimensions.smallTextSize),
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Row(
                            children: [
                              const Tab(
                                  child: Text(
                                'Bookings',
                                style: TextStyle(fontSize: 12),
                              )),
                              const SizedBox(
                                width: Dimensions.heightSize * 0.5,
                              ),
                              Positioned(
                                right: -5,
                                top: -7,
                                child: Container(
                                  height: 15.0,
                                  width: 15.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Center(
                                    child: Obx(() => Text(
                                          "${_providerServicesController.totalBookingOrderChats}",
                                          style: TextStyle(
                                              color: CustomColor.primaryColor,
                                              fontSize:
                                                  Dimensions.smallTextSize),
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  children: [
                    StylistListScreen(),
                    ProductsListScreen(),
                    AccountBookingListScreen(),
                  ],
                ),
              ),
            ),
            // SliverList(
            //   delegate: SliverChildListDelegate([]),
            // ),
            // StylistsSliverList()
          ],
        ),
      ),
    );
  }
}
