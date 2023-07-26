import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/customer_service_controller.dart';
import 'package:geza_lite/controllers/provider_service_controller.dart';
import 'package:geza_lite/screens/drawer/search_box.dart';
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

class _SliverAppBarScreenState extends State<SliverAppBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ProviderServicesController _providerServicesController =
      Get.put(ProviderServicesController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: Container(
            color: CustomColor.primaryColor, child: DrawerWithProfileImage()),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: CustomColor.primaryColor,
            expandedHeight: 150.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(top: 50, left: 30),
                child: Center(
                  child: SearchBox(),
                ),
              ),

              title: const Center(child: Text('Geza Marketplace')),
              titlePadding: const EdgeInsets.only(top: 30, left: 20),
              // background: Image.network(
              //   'https://example.com/your_image.jpg', // Replace this with your own image URL
              //   fit: BoxFit.cover,
              // ),
            ),
            bottom: TabBar(
              controller: _tabController,
              tabs: <Widget>[
                Stack(
                  // clipBehavior: Clip.none,
                  children: [
                    Row(
                      children: [
                        Tab(
                            child: Text(
                          'Stylists',
                          style: TextStyle(fontSize: Dimensions.largeTextSize),
                        )),
                        const SizedBox(
                          width: Dimensions.heightSize * 0.5,
                        ),
                        Positioned(
                          right: -8,
                          top: -8,
                          child: Container(
                            height: 20.0,
                            width: 20.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Center(
                              child: Obx(() => Text(
                                    "${_providerServicesController.allTraders.length}",
                                    style: TextStyle(
                                        color: CustomColor.primaryColor,
                                        fontSize: Dimensions.smallTextSize),
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
                        Tab(
                            child: Text(
                          'Store',
                          style: TextStyle(fontSize: Dimensions.largeTextSize),
                        )),
                        const SizedBox(
                          width: Dimensions.heightSize * 0.5,
                        ),
                        Positioned(
                          right: -5,
                          top: -7,
                          child: Container(
                            height: 20.0,
                            width: 20.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Center(
                              child: Obx(() => Text(
                                    "${_providerServicesController.totalbeautyProducts}",
                                    style: TextStyle(
                                        color: CustomColor.primaryColor,
                                        fontSize: Dimensions.smallTextSize),
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
                        Tab(
                            child: Text(
                          'Bookings',
                          style: TextStyle(fontSize: Dimensions.largeTextSize),
                        )),
                        const SizedBox(
                          width: Dimensions.heightSize * 0.5,
                        ),
                        Positioned(
                          right: -5,
                          top: -7,
                          child: Container(
                            height: 20.0,
                            width: 20.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Center(
                              child: Obx(() => Text(
                                    "${_providerServicesController.totalBookingOrderChats}",
                                    style: TextStyle(
                                        color: CustomColor.primaryColor,
                                        fontSize: Dimensions.smallTextSize),
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
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  StylistListScreen(),
                  ProductsListScreen(),
                  AccountBookingListScreen(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
