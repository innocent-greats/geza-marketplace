import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/auth/auth_controller.dart';
import 'package:geza_lite/controllers/customer_service_controller.dart';
import 'package:geza_lite/controllers/provider_service_controller.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/utils/dimensions.dart';

class SearchBox extends StatelessWidget {
  SearchBox({super.key});
  final AuthController _authController = Get.put(AuthController());
  final CustomerServicesController _customerServicesController =
      Get.put(CustomerServicesController());
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: Dimensions.marginSize * 2,
          left: Dimensions.marginSize,
          bottom: 5),
      child: TextFormField(
        onChanged: (value) => {
          // _customerServicesController.filterSearchResults(value),
          _customerServicesController.searchItem.value = value.toString(),
          _customerServicesController.searchStylesBySearchTerm(
              _customerServicesController.searchItem.value.toLowerCase())
        },
        style: CustomStyle.textStyle,
        controller: searchController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'beautify yourself today'.capitalizeFirst,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          labelStyle: CustomStyle.textStyle,
          filled: true,
          fillColor: Colors.purple[50],
          hintStyle: CustomStyle.textStyle,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: Colors.purple.shade50)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: Colors.purple.shade50)),
          focusedErrorBorder: CustomStyle.focusErrorBorder,
          errorBorder: CustomStyle.focusErrorBorder,
        ),
      ),
    );
  }
}
