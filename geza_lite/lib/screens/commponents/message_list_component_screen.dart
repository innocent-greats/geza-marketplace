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

class MessagesListComponentScreen extends StatelessWidget {
  final Person expert;
  MessagesListComponentScreen({super.key, required this.expert});
  final CustomerServicesController _customerServicesController =
      Get.put(CustomerServicesController());
  final CustomerServicesController _servicesController =
      Get.put(CustomerServicesController());

  @override
  Widget build(BuildContext context) {
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
              _servicesController.selectedStylist.value = expert;
              _servicesController.getStylistServices(expert.id);
              Get.to(ParlourDetailsScreen(), arguments: expert);
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
                        expert.profileImagePathLocation.toString(),
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
                            expert.firstName,
                            style: TextStyle(
                                fontSize: Dimensions.largeTextSize,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: Dimensions.heightSize * 0.5,
                        ),
                        Flexible(
                          child: Text(expert.specialization![0],
                              style: CustomStyle.textStyle),
                        ),
                        const SizedBox(
                          height: Dimensions.heightSize * 0.5,
                        ),
                        Text('${expert.neighbourhood}, ${expert.city}',
                            style: CustomStyle.textStyle),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
