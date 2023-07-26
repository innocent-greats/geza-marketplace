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
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          child: Container(
              color: CustomColor.primaryColor, child: DrawerWithProfileImage()),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 150.0,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: Dimensions.marginSize * 0.5,
                            right: Dimensions.marginSize * 0.5,
                            top: Dimensions.heightSize * 1,
                            bottom: Dimensions.heightSize * 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.sort,
                                color: Colors.purple,
                              ),
                              onPressed: () {
                                if (scaffoldKey.currentState!.isDrawerOpen) {
                                  scaffoldKey.currentState!.openEndDrawer();
                                } else {
                                  scaffoldKey.currentState!.openDrawer();
                                }
                              },
                            ),
                            SizedBox(
                              height: 60,
                              width: 40,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) =>
                                              const AppointmentHistoryScreen()));
                                    },
                                    child: Container(
                                        height: 40,
                                        width: 40.0,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        child: const Icon(
                                          Icons.messenger_outline_rounded,
                                          color: CustomColor.primaryColor,
                                        )),
                                  ),
                                  Positioned(
                                    right: -5,
                                    top: -1,
                                    child: Container(
                                      height: 20.0,
                                      width: 20.0,
                                      decoration: BoxDecoration(
                                          color: CustomColor.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Center(
                                        child: Obx(() => Text(
                                              "${_providerServicesController.totalAccountMessages}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      Dimensions.smallTextSize),
                                            )),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: Dimensions.heightSize * 6.5,
                      ),
                      Positioned(
                        // bottom: Dimensions.heightSize * 2,
                        left: Dimensions.marginSize * 3,
                        right: Dimensions.marginSize,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: Dimensions.heightSize * 0.5,
                            ),
                            const SizedBox(
                              height: Dimensions.heightSize * 2.0,
                            ),
                            Text(
                              Strings.beautyParlourBookingApp,
                              style: TextStyle(
                                color: CustomColor.primaryColor,
                                fontSize: Dimensions.extraLargeTextSize,
                              ),
                            ),
                            const SizedBox(
                              height: Dimensions.heightSize * 2,
                            ),
                            const SizedBox(
                              width: Dimensions.heightSize * 0.5,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: Dimensions.heightSize * 6.5,
                      ),
                      Positioned(
                        // bottom: Dimensions.heightSize * 2,
                        left: Dimensions.marginSize,
                        right: Dimensions.marginSize,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: Dimensions.heightSize * 1.5,
                            ),
                            const SizedBox(
                              width: Dimensions.heightSize * 0.5,
                            ),
                            const SizedBox(
                              height: Dimensions.heightSize * 5,
                            ),
                            categoryWidget(context),
                            const SizedBox(
                              height: Dimensions.heightSize * 4.5,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                popularParlourWidget(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  categoryWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: Dimensions.marginSize,
          // left: Dimensions.marginSize * 3,
          right: Dimensions.marginSize * 1),
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width * 3,
        child: ListView.builder(
          itemCount: CategoryList.list().length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Category category = CategoryList.list()[index];
            return Padding(
              padding: const EdgeInsets.only(
                top: Dimensions.marginSize - 15,
                left: Dimensions.marginSize - 20,
                right: Dimensions.marginSize * 0.3,
              ),
              child: SizedBox(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    InkWell(
                      onTap: () {
                        if (_servicesController.searchItemCategory.value ==
                            category.name.toString()) {
                          _servicesController
                              .searchStylesBySearchTerm(''.toLowerCase());
                        } else {
                          _servicesController.searchItemCategory.value =
                              category.name.toString();
                          _servicesController.searchStylesBySearchTerm(
                              _servicesController.searchItemCategory.value
                                  .toLowerCase());
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: category.name == 'Skin & Nail Care' ? 130 : 100,
                        height: 30.0,
                        decoration: BoxDecoration(
                            color: Colors.purple[50],
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          category.name,
                          style: TextStyle(
                            color: CustomColor.primaryColor,
                            fontSize: Dimensions.defaultTextSize,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: -7,
                      top: -15,
                      child: Container(
                        height: 20.0,
                        width: 20.0,
                        decoration: BoxDecoration(
                            color: CustomColor.primaryColor,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                          child: Obx(() => Text(
                                category.name.toLowerCase() ==
                                        'Hair Care'.toLowerCase()
                                    ? "${_servicesController.totalHairStylists}"
                                    : category.name.toLowerCase() ==
                                            'Skin & Nail Care'.toLowerCase()
                                        ? "${_servicesController.totalCosmetologists}"
                                        : "${_servicesController.totalProductsSellers}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimensions.smallTextSize),
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  popularParlourWidget(BuildContext context) {
    return SizedBox(
      // height: 260,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                right: Dimensions.marginSize * 2,
                left: Dimensions.marginSize,
                bottom: 5),
            child: TextFormField(
              onChanged: (value) => {
                // _servicesController.filterSearchResults(value),
                _servicesController.searchItem.value = value.toString(),
                _servicesController.searchStylesBySearchTerm(
                    _servicesController.searchItem.value.toLowerCase())
              },
              style: CustomStyle.textStyle,
              controller: searchController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                // suffixIcon: IconButton(
                //   color: Colors.purple[300],
                //   icon: const Icon(Icons.location_on),
                //   onPressed: () => _servicesController.onShowSearch(),
                // ),
                hintText: 'beautify yourself today'.capitalizeFirst,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                labelStyle: CustomStyle.textStyle,
                filled: true,
                fillColor: Colors.purple[50],
                hintStyle: CustomStyle.textStyle,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.purple.shade50)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.purple.shade50)),
                focusedErrorBorder: CustomStyle.focusErrorBorder,
                errorBorder: CustomStyle.focusErrorBorder,
              ),
            ),
          ),
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
