import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/customer_service_controller.dart';
import 'package:geza_lite/screens/appointment_details_screen.dart';
import 'package:geza_lite/screens/dashboard/appointment_screen.dart';

import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/data/services.dart';
import 'package:gezamarketplace_client/gezamarketplace_client.dart';

class ServiceWidget extends StatelessWidget {
  ServiceWidget({super.key});
  final CustomerServicesController _servicesController =
      Get.put(CustomerServicesController());
  @override
  Widget build(BuildContext context) {
    return detailsWidget(context);
  }

  detailsWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.65,
          color: Colors.white,
          child: PageView.builder(
              itemCount: _servicesController.stylistServicesTotal,
              itemBuilder: (context, index) {
                return Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 3,
                                color: index == 0
                                    ? CustomColor.primaryColor
                                    : Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: servicesWidget(context),
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

  servicesWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: _servicesController.stylistServicesTotal,
          itemBuilder: (context, index) {
            BeautyStyle services = _servicesController.stylistServices[index];
            return Padding(
              padding: const EdgeInsets.only(
                  left: Dimensions.marginSize,
                  right: Dimensions.marginSize,
                  bottom: Dimensions.heightSize),
              child: InkWell(
                onTap: () {
                  services.category == 'product'
                      ? Get.to(const AppointmentDetailsScreen(),
                          arguments: services)
                      : Get.to(const AppointmentDetailsScreen(),
                          arguments: services);
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
                        child: Image.network(
                          services.images[0].pathLocation.toString(),
                          height: 90,
                          width: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: Dimensions.widthSize),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                services.name,
                                style: TextStyle(
                                    fontSize: Dimensions.largeTextSize,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: Dimensions.heightSize * 0.5,
                              ),
                              Text('${services.category}',
                                  style: CustomStyle.textStyle),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: Dimensions.widthSize),
                          child: Container(
                            height: 28,
                            width: 150,
                            decoration: BoxDecoration(
                                color: CustomColor.primaryColor,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Center(
                              child: services.category == 'product'
                                  ? const Text(
                                      'Order',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  : Text(
                                      Strings.book,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
