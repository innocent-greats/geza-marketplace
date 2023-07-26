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
import 'package:geza_lite/screens/parlour_details_screen.dart';
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
import 'package:gezamarketplace_client/gezamarketplace_client.dart';

class StylistsSliverList extends StatelessWidget {
  StylistsSliverList({super.key});
  final AuthController _authController = Get.put(AuthController());
  final CustomerServicesController _servicesController =
      Get.put(CustomerServicesController());
  final ProviderServicesController _providerServicesController =
      Get.put(ProviderServicesController());
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          Person stylist =
              _servicesController.filteredTradersSearchResults[index];
          _servicesController.selectedIndexImage.value =
              stylist.profileImagePathLocation.toString();
          return Container(
              color: index.isOdd ? Colors.white : Colors.black12,
              height: 100.0,
              child: Padding(
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
                        borderRadius: BorderRadius.circular(Dimensions.radius)),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Obx(() => stylist.id ==
                                  _servicesController.selectedItemId.value
                              ? Image.network(
                                  _servicesController.selectedIndexImage.value,
                                  height: 250,
                                  width: 260,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  stylist.profileImagePathLocation.toString(),
                                  height: 250,
                                  width: 260,
                                  fit: BoxFit.cover,
                                )),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: Dimensions.widthSize),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              Text(stylist.specialization![0].capitalize!,
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
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Center(
                              child: Text(
                                Strings.book,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
        },
        childCount: _servicesController.filteredTradersSearchResults.length,
      ),
    );
  }
}
