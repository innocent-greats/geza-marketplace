import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/auth/auth_controller.dart';
import 'package:geza_lite/controllers/customer_service_controller.dart';
import 'package:geza_lite/controllers/provider_service_controller.dart';
import 'package:geza_lite/screens/dashboard/appointment_history_screen.dart';
import 'package:geza_lite/screens/dashboard/appointment_screen.dart';
import 'package:geza_lite/screens/drawer/drawer.dart';
import 'package:geza_lite/screens/parlour_details_screen.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/data/category.dart';
import 'package:gezamarketplace_client/gezamarketplace_client.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final CustomerServicesController _servicesController =
      Get.put(CustomerServicesController());
  final ProviderServicesController _providerServicesController =
      Get.put(ProviderServicesController());
  TextEditingController searchController = TextEditingController();
  TextEditingController neighbourhoodSerachController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return popularParlourWidget(context);
  }

  popularParlourWidget(BuildContext context) {
    return SizedBox(
      // height: 260,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: Dimensions.marginSize, bottom: 20),
              child: SizedBox(
                height: 610,
                width: MediaQuery.of(context).size.width,
                child: Obx(() => ListView.builder(
                    itemCount:
                        _servicesController.filteredTradersSearchResults.length,
                    itemBuilder: (context, index) {
                      Person stylist = _servicesController
                          .filteredTradersSearchResults[index];
                      _servicesController.selectedIndexImage.value =
                          stylist.profileImagePathLocation.toString();
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: Dimensions.marginSize,
                            right: Dimensions.marginSize,
                            bottom: Dimensions.heightSize),
                        child: InkWell(
                          onTap: () {
                            _servicesController.selectedStylist.value = stylist;
                            _servicesController.getStylistServices(stylist.id);
                            Get.to(ParlourDetailsScreen(), arguments: stylist);
                          },
                          child: Container(
                            height: 90,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF8F8F8),
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius)),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Obx(() => stylist.id ==
                                          _servicesController
                                              .selectedItemId.value
                                      ? Image.network(
                                          _servicesController
                                              .selectedIndexImage.value,
                                          height: 250,
                                          width: 260,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.network(
                                          stylist.profileImagePathLocation
                                              .toString(),
                                          height: 250,
                                          width: 260,
                                          fit: BoxFit.cover,
                                        )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: Dimensions.widthSize),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${stylist.firstName} ${stylist.lastName}'
                                            .capitalize!,
                                        style: TextStyle(
                                            fontSize: Dimensions.largeTextSize,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: Dimensions.heightSize * 0.5,
                                      ),
                                      Text(
                                          stylist
                                              .specialization![0].capitalize!,
                                          style: CustomStyle.textStyle),
                                      const SizedBox(
                                        height: Dimensions.heightSize * 0.5,
                                      ),
                                      Text(
                                          '${stylist.city!.capitalize!}, ${stylist.neighbourhood!.capitalize!}',
                                          style: CustomStyle.textStyle),
                                      const SizedBox(
                                        height: Dimensions.heightSize * 0.5,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: Dimensions.widthSize),
                                  child: Container(
                                    height: 28,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: CustomColor.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    child: Center(
                                      child: Text(
                                        Strings.book,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
              ),
            ),
          ),
          const SizedBox(height: Dimensions.heightSize),
        ],
      ),
    );
  }

  profileWidget(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) => Padding(
        padding: const EdgeInsets.only(
          top: Dimensions.heightSize * 3,
        ),
        child: Column(
          children: [
            ListTile(
              leading: Image.network(
                controller.person!.profileImagePathLocation.toString(),
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              title: Text(
                controller.person!.firstName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.largeTextSize,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                controller.person!.lastName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.defaultTextSize,
                ),
              ),
            ),
            Text(
              controller.person!.lastName,
              style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.defaultTextSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
