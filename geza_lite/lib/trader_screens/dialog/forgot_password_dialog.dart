import 'package:flutter/material.dart';

import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/utils/custom_style.dart';

final TextEditingController emailController = TextEditingController();

class MyDialog {
  static forgotPassword(BuildContext context) async {
    return (await showDialog(
          barrierDismissible: true,
          context: context,
          barrierColor: Colors.black.withOpacity(0.6),
          builder: (context) => AlertDialog(
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Strings.forgotPassword,
                    style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.email,
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(
                        height: Dimensions.heightSize * 0.5,
                      ),
                      TextFormField(
                        style: CustomStyle.textStyle,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: Strings.demoEmail,
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
                          prefixIcon: const Icon(Icons.mail),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    child: Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: CustomColor.primaryColor,
                          borderRadius: BorderRadius.all(
                              Radius.circular(Dimensions.radius))),
                      child: Center(
                        child: Text(
                          Strings.sendCode.toUpperCase(),
                          style: TextStyle(
                              fontSize: Dimensions.extraLargeTextSize,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          ),
        )) ??
        false;
  }
}
