import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/customer_service_controller.dart';
import 'package:geza_lite/controllers/provider_service_controller.dart';
import 'package:geza_lite/screens/booking_messaging_screen.dart';

import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:gezamarketplace_client/gezamarketplace_client.dart';

class BookingListComponentScreen extends StatelessWidget {
  final BookingOrderChat bookingOrderChat;
  BookingListComponentScreen({super.key, required this.bookingOrderChat});
  final ProviderServicesController _providerServicesController =
      Get.put(ProviderServicesController());

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
              _providerServicesController.currentChatBookingMessages.value =
                  bookingOrderChat.messages;
              _providerServicesController.bookingOrderChat.value =
                  bookingOrderChat;

              // _providerServicesController.getOrderChats(bookingOrderChat.id);
              debugPrint(
                  '_providerServicesController.currentChatBookingMessages length:: ${_providerServicesController.currentChatBookingMessages.length}');
              _providerServicesController
                  .getBookingMessages(bookingOrderChat.id as int);

              Get.to(
                const BookingMessagingScreen(),
              );
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
                        bookingOrderChat.customer.profileImagePathLocation
                            .toString(),
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
                            bookingOrderChat.customer.firstName.capitalize
                                .toString(),
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
                          child: Text(
                              bookingOrderChat.orderedItem.name.capitalize
                                  .toString(),
                              style: CustomStyle.textStyle),
                        ),
                        const SizedBox(
                          height: Dimensions.heightSize * 0.5,
                        ),
                        Text(
                            '${bookingOrderChat.customer.neighbourhood!.capitalize}, ${bookingOrderChat.customer.city!.capitalize}',
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
                          '\$ ${bookingOrderChat.orderedItem.amount.toString()}',
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
