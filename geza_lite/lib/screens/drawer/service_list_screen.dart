import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/auth/auth_controller.dart';
import 'package:geza_lite/controllers/customer_service_controller.dart';
import 'package:geza_lite/controllers/provider_service_controller.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/provider_strings.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/widgets/back_widget.dart';
import 'package:geza_lite/screens/add_new_service_screen.dart';
import 'package:geza_lite/widgets/bg_image_widget.dart';
import 'package:geza_lite/widgets/dashboard_widget.dart';
// import 'package:geza_lite/data/beautyStyles.dart';
import 'package:gezamarketplace_client/gezamarketplace_client.dart';

class ServiceListScreen extends StatefulWidget {
  const ServiceListScreen({super.key});

  @override
  _ServiceListScreenState createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends State<ServiceListScreen> {
  final ProviderServicesController _servicesController =
      Get.put(ProviderServicesController());
  final AuthController _authController = Get.put(AuthController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: Stack(
          children: [
            const BgImageWidget(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeDashboardWidget(),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 2,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius * 2),
                              topRight:
                                  Radius.circular(Dimensions.radius * 2))),
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: Dimensions.heightSize * 3),
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: _authController
                                            .person!.specialization![0] ==
                                        'hairstyling'
                                    ? Text(
                                        'Hair Styles',
                                        style: TextStyle(
                                            fontSize:
                                                Dimensions.extraLargeTextSize *
                                                    1.2,
                                            color: Colors.black),
                                        textAlign: TextAlign.center,
                                      )
                                    : _authController
                                                .person!.specialization![0] ==
                                            'cosmetic treatments'
                                        ? Text(
                                            'Cosmetic Treatments',
                                            style: TextStyle(
                                                fontSize: Dimensions
                                                        .extraLargeTextSize *
                                                    1.2,
                                                color: Colors.black),
                                            textAlign: TextAlign.center,
                                          )
                                        : Text(
                                            'Beauty Products',
                                            style: TextStyle(
                                                fontSize: Dimensions
                                                        .extraLargeTextSize *
                                                    1.2,
                                                color: Colors.black),
                                            textAlign: TextAlign.center,
                                          )),
                          ),
                          const SizedBox(
                            height: Dimensions.heightSize,
                          ),
                          bodyWidget(context)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: Container(
            height: 50.0,
            width: 100,
            decoration: const BoxDecoration(
                color: CustomColor.primaryColor,
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimensions.radius * 0.5))),
            child: Center(
              child: Text(
                'Add New +',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimensions.largeTextSize,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddNewServiceScreen()));
          },
        ),
        const SizedBox(
          height: Dimensions.heightSize * 2,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Obx(() => ListView.builder(
              itemCount: _servicesController.accountServices.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                BeautyStyle beautyStyles =
                    _servicesController.accountServices[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    left: Dimensions.marginSize,
                    right: Dimensions.marginSize,
                    bottom: Dimensions.heightSize,
                  ),
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
                          child: beautyStyles.images.isNotEmpty
                              ? Image.network(beautyStyles
                                  .images[0].pathLocation
                                  .toString())
                              : Image.asset(
                                  beautyStyles.name,
                                  height: 90,
                                  width: 90,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: Dimensions.widthSize),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  beautyStyles.name,
                                  style: TextStyle(
                                      fontSize: Dimensions.largeTextSize,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: Dimensions.heightSize * 0.5,
                                ),
                                Text('Added ${beautyStyles.dateAdded}',
                                    style: CustomStyle.textStyle),
                                Text('Price ${beautyStyles.amount}',
                                    style: CustomStyle.textStyle),
                              ],
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Icon(Icons.more_vert),
                        )
                      ],
                    ),
                  ),
                );
              })),
        ),
      ],
    );
  }
}
