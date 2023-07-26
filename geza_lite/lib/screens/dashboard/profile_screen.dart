import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/auth/auth_controller.dart';
import 'package:geza_lite/controllers/provider_service_controller.dart';
import 'package:geza_lite/controllers/customer_service_controller.dart';
import 'package:geza_lite/screens/dashboard/appointment_history_screen.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:gezamarketplace_client/gezamarketplace_client.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final CustomerServicesController _servicesController =
      Get.put(CustomerServicesController());
  final ProviderServicesController _providerCustomerServicesController =
      Get.put(ProviderServicesController());

  final AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    late final user = args ?? _authController.person;
    debugPrint('ProfileScreen Get.arguments: $user\n');
    debugPrint('ProfileScreen Get.arguments: ${user.id}\n');
    // debugPrint('ProfileScreen user: ${_authController.person!.id}\n');

    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: Stack(
          children: [
            // const BgImageWidget(),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: CustomColor.accentColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius * 2),
                        topRight: Radius.circular(Dimensions.radius * 2))),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: Dimensions.heightSize * 3),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          user.firstName,
                          style: TextStyle(
                              fontSize: Dimensions.extraLargeTextSize,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.heightSize,
                    ),
                    addImageWidget(
                        context, _providerCustomerServicesController, user),
                    const SizedBox(
                      height: Dimensions.heightSize * 2,
                    ),
                    aboutDetailsWidget(context)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  profileWidget(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120,
          width: 100,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AppointmentHistoryScreen()));
                },
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.asset(
                        'assets/images/user.png',
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AppointmentHistoryScreen()));
                },
                child: Positioned(
                  child: Container(
                    height: 20.0,
                    width: 20.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Center(
                      child: Icon(
                        Icons.edit_square,
                        color: CustomColor.primaryColor,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: Dimensions.heightSize,
        ),
        Text(
          'CEO, Beauty Girls Parlour ',
          style: CustomStyle.textStyle,
        ),
        const SizedBox(
          height: Dimensions.heightSize * 0.5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const MyRating(rating: '5',),
            const SizedBox(
              width: Dimensions.widthSize * 0.5,
            ),
            Text(
              '5',
              style: CustomStyle.textStyle,
            ),
            const SizedBox(
              width: Dimensions.widthSize * 0.5,
            ),
            Text(
              '(130)',
              style: CustomStyle.textStyle,
            ),
          ],
        ),
      ],
    );
  }

  aboutDetailsWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.about,
              style: TextStyle(
                  fontSize: Dimensions.extraLargeTextSize,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: Dimensions.heightSize * 0.5),
            Text(
              Strings.subTitle1,
              style: CustomStyle.textStyle,
            ),
            const SizedBox(height: Dimensions.heightSize),
            Text(
              Strings.openingHours,
              style: TextStyle(
                  fontSize: Dimensions.extraLargeTextSize,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: Dimensions.heightSize * 0.5),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Mon - Wed',
                        style: CustomStyle.textStyle,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '8:00 am - 12:00 pm',
                        style: CustomStyle.textStyle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Dimensions.heightSize * 0.5),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Fri - Sat',
                        style: CustomStyle.textStyle,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '10:00 am - 11:00 pm',
                        style: CustomStyle.textStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: Dimensions.heightSize),
            Text(
              Strings.address,
              style: TextStyle(
                  fontSize: Dimensions.extraLargeTextSize,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: Dimensions.heightSize * 0.5),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.location_on,
                          color: CustomColor.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: Dimensions.widthSize,
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          '58 Street- Fairbridge Mutare',
                          style: CustomStyle.textStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.directions,
                        color: CustomColor.primaryColor,
                      ),
                      const SizedBox(
                        width: Dimensions.widthSize,
                      ),
                      Text(
                        '5 KM',
                        style: CustomStyle.textStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  addImageWidget(BuildContext context, controller, user) {
    debugPrint('ProfileScreen user .arguments: $user\n');

    return Align(
      alignment: Alignment.center,
      child: Stack(children: <Widget>[
        Container(
            height: 150,
            width: 150,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: CustomColor.secondaryColor,
              borderRadius: BorderRadius.circular(75.0),
            ),
            child: user.profileImagePathLocation != null
                ? Image.network(
                    user.profileImagePathLocation.toString(),
                    fit: BoxFit.cover,
                  )
                : Obx(
                    () => _servicesController.isProfileImageAdded.value ==
                                false ||
                            user.profileImagePathLocation == null
                        ? const Icon(
                            Icons.wallpaper,
                            size: 70,
                          )
                        : _servicesController.isProfileImageAdded.value == true
                            ? Image.file(
                                _servicesController.pickedProfileFile.value,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                user.profileImagePathLocation.toString(),
                                fit: BoxFit.cover,
                              ),
                  )),
        Positioned(
          right: 0,
          bottom: 20,
          child: Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
                color: CustomColor.primaryColor,
                borderRadius: BorderRadius.circular(20.0)),
            child: IconButton(
              onPressed: () {
                _servicesController.pickProfileImageFromLocalStorage(user);
              },
              padding: const EdgeInsets.only(left: 5, right: 5),
              iconSize: 24,
              icon: const Icon(
                Icons.camera_enhance,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
