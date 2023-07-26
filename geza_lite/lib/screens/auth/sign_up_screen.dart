import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/auth/auth_controller.dart';
import 'package:geza_lite/controllers/main_controller.dart';
import 'package:geza_lite/controllers/customer_service_controller.dart';

import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/screens/auth/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AuthController _authController = Get.put(AuthController());
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationNeighbourhoodController =
      TextEditingController();
  TextEditingController neighbourhoodSerachController = TextEditingController();
  TextEditingController locationCityController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final CustomerServicesController _servicesController =
      Get.put(CustomerServicesController());

  bool _toggleVisibility = true;
  bool checkedValue = false;
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
              // BackWidget(iconColor: Colors.white,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: CustomColor.accentColor,
                  // borderRadius: const BorderRadius.only(
                  //     topLeft: Radius.circular(Dimensions.radius * 2),
                  //     topRight: Radius.circular(Dimensions.radius * 2))
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: Dimensions.heightSize * 6),
                      child: Text(
                        Strings.signUp,
                        style: TextStyle(
                            fontSize: Dimensions.extraLargeTextSize * 1.2,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                        padding:
                            const EdgeInsets.only(top: Dimensions.heightSize),
                        child: Obx(
                          () => _authController.formErrors.value
                              ? Text(
                                  _authController.formErrorMessage.value,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.red,
                                      fontStyle: FontStyle.italic),
                                )
                              : const Column(),
                        )),
                    signUpWidget(context)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  signUpWidget(BuildContext context) {
    return Column(
      children: [
        Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: Dimensions.heightSize * 2,
                  left: Dimensions.marginSize,
                  right: Dimensions.marginSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "first name".toUpperCase(),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.5,
                  ),
                  TextFormField(
                    style: CustomStyle.textStyle,
                    controller: firstNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: '',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        labelStyle: CustomStyle.textStyle,
                        filled: true,
                        fillColor: CustomColor.accentColor,
                        hintStyle: CustomStyle.textStyle,
                        focusedBorder: CustomStyle.focusBorder,
                        enabledBorder: CustomStyle.focusErrorBorder,
                        focusedErrorBorder: CustomStyle.focusErrorBorder,
                        errorBorder: CustomStyle.focusErrorBorder,
                        prefixIcon: const Icon(Icons.person)),
                  ),
                  const SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  Text(
                    "last name".toUpperCase(),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.5,
                  ),
                  TextFormField(
                    style: CustomStyle.textStyle,
                    controller: lastNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: '',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        labelStyle: CustomStyle.textStyle,
                        filled: true,
                        fillColor: CustomColor.accentColor,
                        hintStyle: CustomStyle.textStyle,
                        focusedBorder: CustomStyle.focusBorder,
                        enabledBorder: CustomStyle.focusErrorBorder,
                        focusedErrorBorder: CustomStyle.focusErrorBorder,
                        errorBorder: CustomStyle.focusErrorBorder,
                        prefixIcon: const Icon(Icons.person_2)),
                  ),
                  const SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  Text(
                    "Phone Number".toUpperCase(),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.5,
                  ),
                  TextFormField(
                    style: CustomStyle.textStyle,
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: '+263',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        labelStyle: CustomStyle.textStyle,
                        filled: true,
                        fillColor: CustomColor.accentColor,
                        hintStyle: CustomStyle.textStyle,
                        focusedBorder: CustomStyle.focusBorder,
                        enabledBorder: CustomStyle.focusErrorBorder,
                        focusedErrorBorder: CustomStyle.focusErrorBorder,
                        errorBorder: CustomStyle.focusErrorBorder,
                        prefixIcon: const Icon(Icons.phone_android)),
                  ),
                  const SizedBox(height: Dimensions.heightSize),
                  Text(
                    "location by city and area".toUpperCase(),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CustomSearchableDropDown(
                            items: _authController.populatedCities,
                            label: 'Select City e.g Harare',
                            labelStyle: const TextStyle(fontSize: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 173, 170, 174))),
                            dropDownMenuItems:
                                _authController.populatedCities.map((item) {
                              return item['name'];
                            }).toList(),
                            onChanged: (value) {
                              if (value != null) {
                                _authController.selectedCity.value = '';

                                // _authController.selectedCity.value =
                                //     value['name'].toString();
                                _authController
                                    .onSelectedCity(value['name'].toString());
                              } else {
                                _authController.selectedCity.value = '';
                              }
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Obx(() => CustomSearchableDropDown(
                                items: _authController.populatedNeighbourhoods,
                                label: 'Select Area e.g Machipisa',
                                labelStyle: const TextStyle(fontSize: 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3.0),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 173, 170, 174))),
                                dropDownMenuItems: _authController
                                    .populatedNeighbourhoods
                                    .map((item) {
                                  debugPrint(
                                      'matched Area in dropdown data ${item.name}');

                                  return item.name.toString().capitalize;
                                }).toList(),
                                onChanged: (value) {
                                  debugPrint('onChanged dropdown data $value');
                                  value.toString().toLowerCase();
                                  if (value != null) {
                                    _authController
                                        .selectedNeighbourhood.value = '';
                                    _authController
                                        .onSelectedArea(value.name.toString());
                                  } else {
                                    _authController
                                        .selectedNeighbourhood.value = '';
                                  }
                                },
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimensions.heightSize),
                  Text(
                    "Account Type".toUpperCase(),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: Dimensions.heightSize),
                  Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(Dimensions.radius)),
                        border: Border.all(
                            color: const Color.fromARGB(255, 173, 170, 174))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: Dimensions.marginSize * 0.5,
                          right: Dimensions.marginSize * 0.5),
                      child: Obx(() => DropdownButton(
                            isExpanded: true,
                            underline: Container(),
                            hint: Text(
                              _authController.selectedAccontType.value,
                              style: CustomStyle.textStyle,
                            ), // Not necessary for Option 1
                            value: _authController.selectedAccontType.value,
                            onChanged: (newValue) {
                              _authController.onSelectedAccontType(newValue!);
                            },
                            items: _authController.accontTypes.map((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value.capitalize!,
                                  style: CustomStyle.textStyle,
                                ),
                              );
                            }).toList(),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.5,
                  ),
                  Obx(() => _authController.selectedAccontType.value == 'trader'
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: Dimensions.heightSize),
                              child: Text(
                                'Specialization',
                                style: CustomStyle.textStyle,
                              ),
                            ),
                            const SizedBox(height: Dimensions.heightSize * 0.5),
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(Dimensions.radius)),
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.1))),
                              child: Obx(() => _authController
                                          .selectedAccontType.value ==
                                      'trader'
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: Dimensions.marginSize * 0.5,
                                          right: Dimensions.marginSize * 0.5),
                                      child: DropdownButton(
                                        isExpanded: true,
                                        underline: Container(),
                                        hint: Text(
                                          _authController
                                              .selectedVendorAccontType.value,
                                          style: CustomStyle.textStyle,
                                        ), // Not necessary for Option 1
                                        value: _authController
                                            .selectedVendorAccontType.value,
                                        onChanged: (newValue) {
                                          _authController
                                              .onSelectedVendorAccontTypes(
                                                  newValue!);
                                        },
                                        items: _authController
                                            .beautyParlourTypes
                                            .map((value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Text(
                                              value.capitalize!,
                                              style: CustomStyle.textStyle,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    )
                                  : const Column()),
                            ),
                          ],
                        )
                      : const Column()),
                  const SizedBox(height: Dimensions.heightSize),
                ],
              ),
            )),
        CheckboxListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "By clicking sign up you agree to the following ",
                style: CustomStyle.textStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Text(
                      "Terms and Conditions",
                      style: TextStyle(
                          fontSize: Dimensions.defaultTextSize,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.blueColor,
                          decoration: TextDecoration.underline),
                    ),
                    onTap: () {
                      print('go to privacy url');
                      _showTermsConditions();
                    },
                  ),
                  Text(
                    " with out reservation",
                    style: CustomStyle.textStyle,
                  ),
                ],
              )
            ],
          ),
          value: checkedValue,
          onChanged: (newValue) {
            setState(() {
              checkedValue = newValue!;
            });
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        ),
        const SizedBox(height: Dimensions.heightSize * 2),
        Padding(
          padding: const EdgeInsets.only(
              left: Dimensions.marginSize, right: Dimensions.marginSize),
          child: GestureDetector(
              child: Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: CustomColor.primaryColor,
                    borderRadius:
                        BorderRadius.all(Radius.circular(Dimensions.radius))),
                child: Center(
                  child: Obx(() => _authController.isLoading.value
                      ? Row(
                          children: [
                            const SizedBox(width: Dimensions.heightSize * 4),
                            const SizedBox(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3.0,
                              ),
                            ),
                            const SizedBox(width: Dimensions.heightSize * 4),
                            Text(
                              '...loading credentials',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.largeTextSize,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            const SizedBox(width: Dimensions.heightSize * 4),
                            const SizedBox(width: Dimensions.heightSize * 4),
                            Text(
                              Strings.createAccount.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.largeTextSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                ),
              ),
              onTap: () {
                _authController.onHandleSignUp(
                  firstNameController.text,
                  lastNameController.text,
                  phoneController.text,
                );
              }),
        ),
        const SizedBox(height: Dimensions.heightSize * 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Strings.alreadyHaveAnAccount,
              style: CustomStyle.textStyle,
            ),
            GestureDetector(
              child: Text(
                Strings.signIn.toUpperCase(),
                style: const TextStyle(
                    color: CustomColor.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SignInScreen()));
              },
            )
          ],
        )
      ],
    );
  }

  Future<bool> _showTermsConditions() async {
    return (await showDialog(
          context: context,
          builder: (context) => Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: CustomColor.primaryColor,
            child: Stack(
              children: [
                Positioned(
                    top: -35.0,
                    left: -50.0,
                    child: Image.asset('assets/images/splash_logo.png')),
                Positioned(
                    right: -35.0,
                    bottom: -20.0,
                    child: Image.asset('assets/images/splash_logo.png')),
                Padding(
                  padding: const EdgeInsets.only(
                      top: Dimensions.defaultPaddingSize * 2,
                      bottom: Dimensions.defaultPaddingSize * 2),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: AlertDialog(
                        content: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 45,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: Dimensions.heightSize * 2,
                                ),
                                Text(
                                  Strings.ourPolicyTerms,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: Dimensions.largeTextSize,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: Dimensions.heightSize),
                                Text(
                                  'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
                                  style: CustomStyle.textStyle,
                                ),
                                const SizedBox(height: Dimensions.heightSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '•',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: CustomColor.accentColor,
                                          fontSize:
                                              Dimensions.extraLargeTextSize),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'simply random text. It has roots in a piece of classical Latin literature ',
                                        style: CustomStyle.textStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: Dimensions.heightSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '•',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: CustomColor.accentColor,
                                          fontSize:
                                              Dimensions.extraLargeTextSize),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Distracted by the readable content of a page when looking at its layout.',
                                        style: CustomStyle.textStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: Dimensions.heightSize),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '•',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: CustomColor.accentColor,
                                          fontSize:
                                              Dimensions.extraLargeTextSize),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Available, but the majority have suffered alteration',
                                        style: CustomStyle.textStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: Dimensions.heightSize * 2,
                                ),
                                Text(
                                  'When do we contact information ?',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: Dimensions.largeTextSize,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: Dimensions.heightSize),
                                Text(
                                  'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
                                  style: CustomStyle.textStyle,
                                ),
                                const SizedBox(
                                  height: Dimensions.heightSize * 2,
                                ),
                                Text(
                                  'Do we use cookies ?',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: Dimensions.largeTextSize,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: Dimensions.heightSize),
                                Text(
                                  'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
                                  style: CustomStyle.textStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      height: 35.0,
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                          color: CustomColor.secondaryColor,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5.0))),
                                      child: Center(
                                        child: Text(
                                          Strings.decline,
                                          style: TextStyle(
                                              color: CustomColor.primaryColor,
                                              fontSize:
                                                  Dimensions.defaultTextSize,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      height: 35.0,
                                      width: 100.0,
                                      decoration: const BoxDecoration(
                                          color: CustomColor.primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                      child: Center(
                                        child: Text(
                                          Strings.agree,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  Dimensions.defaultTextSize,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                  ),
                ),
              ],
            ),
          ),
        )) ??
        false;
  }
}
