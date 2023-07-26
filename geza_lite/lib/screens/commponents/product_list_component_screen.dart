import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/customer_service_controller.dart';
import 'package:geza_lite/screens/parlour_details_screen.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/widgets/bg_image_widget.dart';
import 'package:geza_lite/data/expert.dart';
import 'package:gezamarketplace_client/gezamarketplace_client.dart';

class ProductListComponentScreen extends StatelessWidget {
  final BeautyStyle item;
  ProductListComponentScreen({super.key, required this.item});
  final CustomerServicesController _customerServicesController =
      Get.put(CustomerServicesController());
  final CustomerServicesController _servicesController =
      Get.put(CustomerServicesController());

  @override
  Widget build(BuildContext context) {
    debugPrint('item $item');
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
        bottom: Dimensions.heightSize,
      ),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: const Color(0xFFF8F8F8),
            borderRadius: BorderRadius.circular(Dimensions.radius)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              _servicesController.setSelectedStylist(item.stylistId);
              _servicesController.getStylistServices(item.stylistId);
              Get.to(ParlourDetailsScreen(), arguments: item);
            },
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8), // Border width
                  // decoration: const BoxDecoration(
                  //     color: Colors.red, shape: BoxShape.circle),
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(28),
                      child: Image.network(
                        item.images[0].pathLocation.toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: Dimensions.widthSize),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            item.name,
                            style: TextStyle(
                                fontSize: Dimensions.largeTextSize,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: Dimensions.heightSize * 0.5,
                        ),
                        Text('${item.neighbourhoodName}, ${item.cityName}',
                            style: CustomStyle.textStyle),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: Dimensions.widthSize),
                    child: Container(
                      height: 28,
                      width: 70,
                      decoration: BoxDecoration(
                          color: CustomColor.primaryColor,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Center(
                        child: Text(
                          '\$ ${item.amount.toString()}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
