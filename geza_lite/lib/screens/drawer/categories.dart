import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/auth/auth_controller.dart';
import 'package:geza_lite/controllers/customer_service_controller.dart';
import 'package:geza_lite/controllers/provider_service_controller.dart';
import 'package:geza_lite/data/category.dart';
import 'package:geza_lite/screens/add_new_card_screen.dart';
import 'package:geza_lite/screens/change_password_screen.dart';
import 'package:geza_lite/screens/dashboard/profile_screen.dart';
import 'package:geza_lite/screens/drawer/messages_list_screen.dart';
import 'package:geza_lite/screens/booking_messaging_screen.dart';
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

class HomeCategories extends StatelessWidget {
  HomeCategories({super.key});
  final AuthController _authController = Get.put(AuthController());
  final CustomerServicesController _servicesController =
      Get.put(CustomerServicesController());
  final ProviderServicesController _providerServicesController =
      Get.put(ProviderServicesController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: Dimensions.marginSize,
          // left: Dimensions.marginSize,
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
}
