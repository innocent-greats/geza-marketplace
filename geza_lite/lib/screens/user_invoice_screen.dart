import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/auth/auth_controller.dart';
import 'package:geza_lite/controllers/customer_service_controller.dart';
import 'package:geza_lite/widgets/back_widget.dart';

import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/screens/service_summery_screen.dart';

class UserInvoiceScreen extends StatefulWidget {
  UserInvoiceScreen({super.key});

  @override
  _UserInvoiceScreenState createState() => _UserInvoiceScreenState();
}

class _UserInvoiceScreenState extends State<UserInvoiceScreen> {
  final CustomerServicesController _servicesController =
      Get.put(CustomerServicesController());
  final AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackWidget(
                iconColor: Colors.white,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: CustomColor.accentColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius * 2),
                        topRight: Radius.circular(Dimensions.radius * 2))),
                child: bodyWidget(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: Dimensions.heightSize * 3,
              left: Dimensions.marginSize,
              right: Dimensions.marginSize),
          child: Text(
            'Booking Order',
            style: TextStyle(
                fontSize: Dimensions.extraLargeTextSize,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        const SizedBox(height: Dimensions.heightSize),
        // Image.asset(
        //   'assets/images/qrcode.png',
        //   height: 200.0,
        // ),
        invoiceDetailsWidget(context),
        const SizedBox(height: Dimensions.heightSize * 3),
        Padding(
          padding: const EdgeInsets.only(
              left: Dimensions.marginSize, right: Dimensions.marginSize),
          child: GestureDetector(
            child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                      Radius.circular(Dimensions.radius * 0.5))),
              child: Center(
                child: Text(
                  'Confirm'.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.largeTextSize,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onTap: () {
              _servicesController.submitBooking();
            },
          ),
        ),
      ],
    );
  }

  invoiceDetailsWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Customer',
                      style: CustomStyle.textStyle,
                    ),
                    Text(
                      _authController.person!.firstName.toString(),
                      style: TextStyle(
                          fontSize: Dimensions.defaultTextSize,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Phone',
                      style: CustomStyle.textStyle,
                    ),
                    Text(
                      _authController.person!.phone.toString(),
                      style: TextStyle(
                          fontSize: Dimensions.defaultTextSize,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: Dimensions.heightSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Stylist',
                      style: CustomStyle.textStyle,
                    ),
                    Text(
                      '${_servicesController.selectedStylist.value.firstName}, ${_servicesController.selectedStylist.value.lastName} ',
                      style: TextStyle(
                          fontSize: Dimensions.defaultTextSize,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Expertise',
                      style: CustomStyle.textStyle,
                    ),
                    Text(
                      '${_servicesController.selectedStylist.value.specialization![0].capitalize}',
                      style: TextStyle(
                          fontSize: Dimensions.defaultTextSize,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: Dimensions.heightSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Booking Date',
                      style: CustomStyle.textStyle,
                    ),
                    Text(
                      _servicesController.initiatedBooking.selectedDate,
                      style: TextStyle(
                          fontSize: Dimensions.defaultTextSize,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Time',
                      style: CustomStyle.textStyle,
                    ),
                    Text(
                      _servicesController.initiatedBooking.selectedTime,
                      style: TextStyle(
                          fontSize: Dimensions.defaultTextSize,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: Dimensions.heightSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Style Booked',
                      style: CustomStyle.textStyle,
                    ),
                    Text(
                      _servicesController.initiatedBooking.beautyStyleName,
                      style: TextStyle(
                          fontSize: Dimensions.defaultTextSize,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Amount',
                      style: CustomStyle.textStyle,
                    ),
                    Text(
                      '\$ ${_servicesController.initiatedBooking.beautyStyleAmount}'
                          .toString(),
                      style: TextStyle(
                          fontSize: Dimensions.defaultTextSize,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
