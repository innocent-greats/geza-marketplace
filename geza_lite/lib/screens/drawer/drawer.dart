import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/auth/auth_controller.dart';
import 'package:geza_lite/screens/change_password_screen.dart';
import 'package:geza_lite/screens/dashboard/profile_account_screen.dart';
import 'package:geza_lite/screens/dashboard/profile_screen.dart';
import 'package:geza_lite/screens/drawer/service_list_screen.dart';
import 'package:geza_lite/trader_screens/drawer/coupon_list_screen.dart';
import 'package:geza_lite/trader_screens/drawer/expert_list_screen.dart';
import 'package:geza_lite/trader_screens/drawer/offer_list_screen.dart';
import 'package:geza_lite/trader_screens/help_support_screen.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/utils/provider_strings.dart';

class DrawerWithProfileImage extends StatelessWidget {
  DrawerWithProfileImage({super.key});
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) => Drawer(
              child: Container(
                color: CustomColor.primaryColor,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        DrawerHeader(
                          decoration: const BoxDecoration(
                            color: CustomColor.primaryColor,
                          ),
                          child: controller.person!.profileImagePathLocation ==
                                  null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(200),
                                  child: Container(
                                    width: 150,
                                    height: 150,
                                    color: Colors.purple[700],
                                    child: const ClipRRect(
                                        child: Icon(Icons.person_2,
                                            color: Colors.white, size: 50.0)),
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 60.0,
                                  backgroundImage: NetworkImage(controller
                                      .person!.profileImagePathLocation
                                      .toString()),
                                ),
                        ),
                        Text(
                          '${controller.person!.firstName} ${controller.person!.lastName}'
                              .capitalize!,
                          style: CustomStyle.listStyle,
                        ),
                        Text(
                          controller.person!.phone,
                          style: CustomStyle.listStyle,
                        ),
                        controller.person!.isTrader == true
                            ? Text(
                                controller
                                    .person!.specialization![0].capitalize!,
                                style: CustomStyle.listStyle,
                              )
                            : Text(
                                ''.capitalize!,
                                style: CustomStyle.listStyle,
                              ),
                      ],
                    ),
                    // TraderDrawerMenu(),
                    ListTile(
                      leading: const Icon(
                        Icons.account_balance_wallet_rounded,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Bookings',
                        style: CustomStyle.listStyle,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ExpertListScreen()));
                      },
                    ),
                    if (controller.person!.isTrader == true) ...[
                      ListTile(
                        leading: const Icon(
                          Icons.add_business_outlined,
                          color: Colors.white,
                        ),
                        title: Text(
                          ProvicerStrings.addService,
                          style: CustomStyle.listStyle,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ServiceListScreen()));
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.person_add_alt_1_rounded,
                          color: Colors.white,
                        ),
                        title: Text(
                          ProvicerStrings.addExpert,
                          style: CustomStyle.listStyle,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ExpertListScreen()));
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.add_box_outlined,
                          color: Colors.white,
                        ),
                        title: Text(
                          ProvicerStrings.addCoupon,
                          style: CustomStyle.listStyle,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CouponListScreen()));
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.post_add_outlined,
                          color: Colors.white,
                        ),
                        title: Text(
                          ProvicerStrings.addServiceOffer,
                          style: CustomStyle.listStyle,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const OfferListScreen()));
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.track_changes_rounded,
                          color: Colors.white,
                        ),
                        title: Text(
                          ProvicerStrings.changePassword,
                          style: CustomStyle.listStyle,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const ChangePasswordScreen()));
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Create Profile',
                          style: CustomStyle.listStyle,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProfileAccountScreen()));
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.settings_applications,
                          color: Colors.white,
                        ),
                        title: Text(
                          ProvicerStrings.helpSupport,
                          style: CustomStyle.listStyle,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HelpSupportScreen()));
                        },
                      ),
                    ],
                    ListTile(
                      leading: const Icon(
                        Icons.person_4_rounded,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Manage Profile',
                        style: CustomStyle.listStyle,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      ),
                      title: Text(
                        ProvicerStrings.signOut,
                        style: CustomStyle.listStyle,
                      ),
                      onTap: () {
                        _authController.onHandleLogout();
                      },
                    ),
                  ],
                ),
              ),
            ));
  }
}
