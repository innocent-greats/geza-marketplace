import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/auth/auth_controller.dart';

import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/widgets/back_widget.dart';
import 'package:geza_lite/screens/auth/sign_up_screen.dart';
import 'package:geza_lite/dialog/forgot_password_dialog.dart';

// import '../dashboard_screen.dart';

class ValidationCodeScreen extends StatefulWidget {
  const ValidationCodeScreen({super.key});

  @override
  _ValidationCodeScreenState createState() => _ValidationCodeScreenState();
}

class _ValidationCodeScreenState extends State<ValidationCodeScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController validationCodeController = TextEditingController();
  final AuthController _authController = Get.put(AuthController());
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
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: Dimensions.heightSize * 3),
                      child: Text(
                        Strings.signIn,
                        style: TextStyle(
                            fontSize: Dimensions.extraLargeTextSize * 1.2,
                            color: Colors.black),
                      ),
                    ),
                    signInWidget(context)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  signInWidget(BuildContext context) {
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
                  const Text(
                    'Validation Code',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    height: Dimensions.heightSize * 0.5,
                  ),
                  TextFormField(
                    style: CustomStyle.textStyle,
                    controller: validationCodeController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      // hintText: Strings.demoEmail,
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
                      prefixIcon: const Icon(
                        Icons.phone_android,
                        color: CustomColor.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: Dimensions.heightSize),
                ],
              ),
            )),
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
                child: Obx(
                  () => _authController.isLoading.value
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
                              'Validate Account'.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.largeTextSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                ),
              ),
            ),
            onTap: () {
              _authController.onValidateSignUp(validationCodeController.text);
            },
          ),
        ),
        const SizedBox(height: Dimensions.heightSize * 2),
      ],
    );
  }
}
