import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/customer_service_controller.dart';
import 'package:geza_lite/controllers/provider_service_controller.dart';
import 'package:geza_lite/screens/commponents/booking_list_component_screen.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/widgets/bg_image_widget.dart';
import 'package:geza_lite/data/expert.dart';
import 'package:gezamarketplace_client/gezamarketplace_client.dart';

class AccountBookingListScreen extends StatelessWidget {
  AccountBookingListScreen({super.key});
  final ProviderServicesController _providerServicesController =
      Get.put(ProviderServicesController());
  @override
  Widget build(BuildContext context) {
    return bodyWidget(context);
  }

  bodyWidget(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Obx(() => ListView.builder(
              itemCount: _providerServicesController.totalBookingOrderChats,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                debugPrint(
                    '_providerServicesController.totalBookingMessage ${_providerServicesController.bookingOrderChats}');
                debugPrint(
                    '_providerServicesController.totalBookingMessage ${_providerServicesController.bookingOrderChats[index]}');
                BookingOrderChat bookingOrderChat =
                    _providerServicesController.bookingOrderChats[index];
                return BookingListComponentScreen(
                    bookingOrderChat: bookingOrderChat);
              })),
        )
      ],
    );
  }
}
