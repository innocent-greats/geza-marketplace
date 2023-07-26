import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/customer_service_controller.dart';
import 'package:geza_lite/screens/appointment_details_screen.dart';

import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/widgets/back_widget.dart';
import 'package:geza_lite/widgets/about_widget.dart';
import 'package:geza_lite/widgets/dashboard_widget.dart';
import 'package:geza_lite/widgets/service_widget.dart';
import 'package:geza_lite/widgets/gallery_widget.dart';
import 'package:gezamarketplace_client/gezamarketplace_client.dart';
// import 'package:geza_lite/widgets/review_widget.dart';

class ParlourDetailsScreen extends StatelessWidget {
  // final String name, image, location, rating;
  ParlourDetailsScreen({super.key, superkey});
  final CustomerServicesController _servicesController =
      Get.put(CustomerServicesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            headerWidget(context),
            detailsWidget(context),
          ],
        ),
      ),
    );
  }

  headerWidget(BuildContext context) {
    debugPrint(
        'ParlourDetailsScreen:: stylist ${_servicesController.selectedStylist}');
    debugPrint(
        'ParlourDetailsScreen:: beautyStyles length ${_servicesController.stylistServices.length}');
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Stack(
        children: [
          _servicesController.selectedStylist.value.profileImagePathLocation ==
                  null
              ? ClipRRect(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.35,
                    color: Colors.purple[700],
                    child: const ClipRRect(
                        child: Icon(Icons.person_2,
                            color: Colors.white, size: 50.0)),
                  ),
                )
              : Container(
                  color: Colors.purple[700],
                  child: ClipRRect(
                    child: Center(
                      child: ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(60),
                          child: Image.network(
                            _servicesController
                                .selectedStylist.value.profileImagePathLocation
                                .toString(),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          const HomeDashboardWidget(),
          Positioned(
            bottom: Dimensions.heightSize ,
            left: Dimensions.marginSize,
            right: Dimensions.marginSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${_servicesController.selectedStylist.value.firstName.capitalize} ${_servicesController.selectedStylist.value.lastName.capitalize}',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.extraLargeTextSize),
                ),
                                Text(
                  _servicesController.selectedStylist.value.specialization![0].capitalize!,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      fontSize: Dimensions.largeTextSize),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              height: 5,
              color: CustomColor.primaryColor,
              child: Center(
                child: Text(
                  'Contact Details',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.defaultTextSize,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  detailsWidget(BuildContext context) {
    int totalPages = 4;
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.65,
          color: Colors.white,
          child: PageView.builder(
              itemCount: totalPages,
              itemBuilder: (context, index) {
                return Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.0,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 40,
                                  color: index == 0
                                      ? CustomColor.primaryColor
                                      : Colors.black,
                                  child: Center(
                                    child: Text(
                                      'Services',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Dimensions.defaultTextSize,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () => pageViewWidget(1),
                                  child: Container(
                                    height: 40,
                                    color: index == 1
                                        ? CustomColor.primaryColor
                                        : Colors.black,
                                    child: Center(
                                      child: Text(
                                        'Styles',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                Dimensions.defaultTextSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 40,
                                  color: index == 2
                                      ? CustomColor.primaryColor
                                      : Colors.black,
                                  child: Center(
                                    child: Text(
                                      'Contact Details',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Dimensions.defaultTextSize,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: pageViewWidget(index),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  pageViewWidget(int i) {
    switch (i) {
      case 0:
        return ServiceWidget();
      case 1:
        return GalleryWidget(
          beautyStyles: _servicesController.stylistServices,
        );
      case 2:
        return const AboutWidget();
      // case 3:
      //   return const ReviewWidget();
      default:
        return ServiceWidget();
    }
  }
}
