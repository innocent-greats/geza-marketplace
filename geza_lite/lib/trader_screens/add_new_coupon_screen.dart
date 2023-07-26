import 'package:flutter/material.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/utils/provider_strings.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/widgets/back_widget.dart';
import 'package:geza_lite/widgets/bg_image_widget.dart';
import 'dart:io';
import 'package:geza_lite/screens/dashboard_screen.dart';

class AddNewCouponScreen extends StatefulWidget {
  const AddNewCouponScreen({super.key});

  @override
  _AddNewCouponScreenState createState() => _AddNewCouponScreenState();
}

class _AddNewCouponScreenState extends State<AddNewCouponScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController couponNumberController = TextEditingController();
  TextEditingController offerPriceController = TextEditingController();
  TextEditingController minServiceAmountController = TextEditingController();
  bool isImageAdded = false;

  late File _image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: Stack(
          children: [
            const BgImageWidget(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackWidget(
                      iconColor: Colors.white,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                color: CustomColor.accentColor,
                                borderRadius: const BorderRadius.only(
                                    topLeft:
                                        Radius.circular(Dimensions.radius * 2),
                                    topRight: Radius.circular(
                                        Dimensions.radius * 2))),
                            child: bodyWidget(context),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.only(
          left: Dimensions.marginSize,
          right: Dimensions.marginSize,
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(height: Dimensions.heightSize * 2),
            Text(
              ProvicerStrings.addNewCoupon,
              style: TextStyle(
                  fontSize: Dimensions.extraLargeTextSize * 1.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Dimensions.heightSize * 3,
            ),
            Form(
                key: formKey,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Text(
                        ProvicerStrings.couponNumber,
                        style: CustomStyle.textStyle,
                      ),
                      const SizedBox(height: Dimensions.heightSize * 0.5),
                      TextFormField(
                        style: CustomStyle.textStyle,
                        controller: couponNumberController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: ProvicerStrings.demoCouponNumber,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          labelStyle: CustomStyle.textStyle,
                          focusedBorder: CustomStyle.focusBorder,
                          enabledBorder: CustomStyle.focusErrorBorder,
                          focusedErrorBorder: CustomStyle.focusErrorBorder,
                          errorBorder: CustomStyle.focusErrorBorder,
                          filled: true,
                          fillColor: CustomColor.accentColor,
                          hintStyle: CustomStyle.textStyle,
                        ),
                      ),
                      const SizedBox(height: Dimensions.heightSize),
                      Text(
                        ProvicerStrings.offerPrice,
                        style: CustomStyle.textStyle,
                      ),
                      const SizedBox(height: Dimensions.heightSize * 0.5),
                      TextFormField(
                        style: CustomStyle.textStyle,
                        controller: offerPriceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: ProvicerStrings.price,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          labelStyle: CustomStyle.textStyle,
                          focusedBorder: CustomStyle.focusBorder,
                          enabledBorder: CustomStyle.focusErrorBorder,
                          focusedErrorBorder: CustomStyle.focusErrorBorder,
                          errorBorder: CustomStyle.focusErrorBorder,
                          filled: true,
                          fillColor: CustomColor.accentColor,
                          hintStyle: CustomStyle.textStyle,
                        ),
                      ),
                      const SizedBox(height: Dimensions.heightSize),
                      Text(
                        ProvicerStrings.minServiceAmount,
                        style: CustomStyle.textStyle,
                      ),
                      const SizedBox(height: Dimensions.heightSize * 0.5),
                      TextFormField(
                        style: CustomStyle.textStyle,
                        controller: minServiceAmountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: ProvicerStrings.price,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          labelStyle: CustomStyle.textStyle,
                          focusedBorder: CustomStyle.focusBorder,
                          enabledBorder: CustomStyle.focusErrorBorder,
                          focusedErrorBorder: CustomStyle.focusErrorBorder,
                          errorBorder: CustomStyle.focusErrorBorder,
                          filled: true,
                          fillColor: CustomColor.accentColor,
                          hintStyle: CustomStyle.textStyle,
                        ),
                      ),
                      const SizedBox(height: Dimensions.heightSize),
                      Text(
                        ProvicerStrings.uploadImage,
                        style: CustomStyle.textStyle,
                      ),
                      const SizedBox(height: Dimensions.heightSize * 0.5),
                      addImageWidget(context),
                      const SizedBox(height: Dimensions.heightSize * 2),
                      GestureDetector(
                        child: Container(
                          height: 50.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              color: CustomColor.primaryColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(Dimensions.radius * 0.5))),
                          child: Center(
                            child: Text(
                              ProvicerStrings.addCoupon.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.largeTextSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        onTap: () {
                          _showPaymentSuccessDialog();
                        },
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  addImageWidget(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(children: <Widget>[
        Container(
          height: 150,
          width: 150,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: CustomColor.secondaryColor,
            borderRadius: BorderRadius.circular(75.0),
          ),
          child: isImageAdded == false
              ? const Icon(
                  Icons.wallpaper,
                  size: 70,
                )
              : Image.file(
                  _image,
                  fit: BoxFit.cover,
                ),
        ),
        Positioned(
          right: 0,
          bottom: 20,
          child: Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
                color: CustomColor.primaryColor,
                borderRadius: BorderRadius.circular(20.0)),
            child: IconButton(
              onPressed: () {
                _openImageSourceOptions(context);
              },
              padding: const EdgeInsets.only(left: 5, right: 5),
              iconSize: 24,
              icon: const Icon(
                Icons.camera_enhance,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Future<void> _openImageSourceOptions(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.camera_alt,
                    size: 40.0,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.photo,
                    size: 40.0,
                    color: Colors.green,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  Future<bool> _showPaymentSuccessDialog() async {
    return (await showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => AlertDialog(
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/tik.png'),
                  Text(
                    ProvicerStrings.successfullyAdded,
                    style: TextStyle(
                        fontSize: Dimensions.extraLargeTextSize,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
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
                          ProvicerStrings.ok.toUpperCase(),
                          style: TextStyle(
                              fontSize: Dimensions.extraLargeTextSize,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const DashboardScreen()));
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
