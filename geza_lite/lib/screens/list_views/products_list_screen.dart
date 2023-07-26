import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/customer_service_controller.dart';
import 'package:geza_lite/screens/commponents/product_list_component_screen.dart';
import 'package:geza_lite/screens/commponents/booking_list_component_screen.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/widgets/bg_image_widget.dart';
import 'package:geza_lite/data/expert.dart';
import 'package:gezamarketplace_client/gezamarketplace_client.dart';

class ProductsListScreen extends StatelessWidget {
  ProductsListScreen({super.key});
  final CustomerServicesController _customerServicesController =
      Get.put(CustomerServicesController());
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
          child: ListView.builder(
              itemCount: _customerServicesController.beautyProducts.length,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                BeautyStyle item =
                    _customerServicesController.beautyProducts[index];
                

                //String selectedService = expert.serviceList[0].toString();
                return ProductListComponentScreen( item: item);
              }),
        )
      ],
    );
  }
}
