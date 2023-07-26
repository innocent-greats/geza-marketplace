import 'package:flutter/material.dart';
import 'package:geza_lite/data/request.dart';
import 'package:geza_lite/widgets/back_widget.dart';

import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/screens/add_new_card_screen.dart';
import 'package:geza_lite/screens/confirm_request_screen.dart';

class ServiceSummeryScreen extends StatefulWidget {
  const ServiceSummeryScreen({super.key});

  @override
  _ServiceSummeryScreenState createState() => _ServiceSummeryScreenState();
}

enum SingingCharacter { cash, card, mobileBanking }

class _ServiceSummeryScreenState extends State<ServiceSummeryScreen> {
  SingingCharacter _character = SingingCharacter.cash;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
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
    );
  }

  bodyWidget(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: Dimensions.heightSize * 3,
              left: Dimensions.marginSize,
              right: Dimensions.marginSize),
          child: Text(
            Strings.serviceSummery,
            style: TextStyle(
                fontSize: Dimensions.extraLargeTextSize,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        const SizedBox(height: Dimensions.heightSize),
        dateTimeWidget(context),
        const SizedBox(height: Dimensions.heightSize),
        amountWidget(context),
        const SizedBox(height: Dimensions.heightSize),
        paymentWidget(context),
        const SizedBox(height: Dimensions.heightSize * 3),
        Padding(
          padding: const EdgeInsets.only(
              left: Dimensions.marginSize, right: Dimensions.marginSize),
          child: GestureDetector(
            child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: CustomColor.primaryColor,
                  borderRadius: BorderRadius.all(
                      Radius.circular(Dimensions.radius * 0.5))),
              child: Center(
                child: Text(
                  Strings.confirm.toUpperCase(),
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
        ),
        const SizedBox(height: Dimensions.heightSize),
        Padding(
          padding: const EdgeInsets.only(
              left: Dimensions.marginSize, right: Dimensions.marginSize),
          child: GestureDetector(
            child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: CustomColor.secondaryColor,
                  borderRadius: const BorderRadius.all(
                      Radius.circular(Dimensions.radius * 0.5))),
              child: Center(
                child: Text(
                  Strings.cancel.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.largeTextSize,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        const SizedBox(height: Dimensions.heightSize * 3),
      ],
    );
  }

  dateTimeWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.dateTime,
            style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.extraLargeTextSize,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: Dimensions.heightSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Strings.date, style: CustomStyle.textStyle),
              Text('25 May 2023', style: CustomStyle.textStyle),
            ],
          ),
          const SizedBox(height: Dimensions.heightSize * 0.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Strings.time, style: CustomStyle.textStyle),
              Text('08:00 pm', style: CustomStyle.textStyle),
            ],
          ),
        ],
      ),
    );
  }

  amountWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.amount,
            style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.extraLargeTextSize,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: Dimensions.heightSize),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.service,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: Dimensions.heightSize,
                    ),
                    Text(
                      'Style Hair Cut',
                      style: CustomStyle.textStyle,
                    ),
                    const SizedBox(
                      height: Dimensions.heightSize * 0.5,
                    ),
                    Text(
                      'Spa',
                      style: CustomStyle.textStyle,
                    ),
                    const SizedBox(
                      height: Dimensions.heightSize * 0.5,
                    ),
                    Text(
                      'Skin Treatment',
                      style: CustomStyle.textStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.quantity,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: Dimensions.heightSize,
                    ),
                    Text(
                      '01',
                      style: CustomStyle.textStyle,
                    ),
                    const SizedBox(
                      height: Dimensions.heightSize * 0.5,
                    ),
                    Text(
                      '01',
                      style: CustomStyle.textStyle,
                    ),
                    const SizedBox(
                      height: Dimensions.heightSize * 0.5,
                    ),
                    Text(
                      '01',
                      style: CustomStyle.textStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.price,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: Dimensions.heightSize,
                    ),
                    Text(
                      '\$25',
                      style: CustomStyle.textStyle,
                    ),
                    const SizedBox(
                      height: Dimensions.heightSize * 0.5,
                    ),
                    Text(
                      '\$100',
                      style: CustomStyle.textStyle,
                    ),
                    const SizedBox(
                      height: Dimensions.heightSize * 0.5,
                    ),
                    Text(
                      '\$80',
                      style: CustomStyle.textStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: Dimensions.heightSize),
          const SizedBox(height: Dimensions.heightSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.subTotal,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const Text(
                '\$205',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: Dimensions.heightSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.discountByCoupon,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const Text(
                '\$10',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: Dimensions.heightSize),
          const Divider(
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.total,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const Text(
                '\$195 ',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  paymentWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: Dimensions.heightSize * 3,
          left: Dimensions.marginSize,
          right: Dimensions.marginSize),
      child: Column(
        children: [
          Container(
            height: 60.0,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.1)),
                borderRadius:
                    const BorderRadius.all(Radius.circular(Dimensions.radius))),
            child: ListTile(
              title: Text(
                Strings.cash.toUpperCase(),
                style: CustomStyle.textStyle,
              ),
              leading: Radio(
                value: SingingCharacter.cash,
                toggleable: true,
                autofocus: true,
                groupValue: _character,
                onChanged: (value) {
                  setState(() {
                    _character = value!;
                    print('value: $_character');
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            height: Dimensions.heightSize,
          ),
          Container(
            height: 60.0,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.1)),
                borderRadius:
                    const BorderRadius.all(Radius.circular(Dimensions.radius))),
            child: ListTile(
              title: Row(
                children: [
                  Image.asset(
                    'assets/images/visa.png',
                    height: 30.0,
                  ),
                  const SizedBox(
                    width: Dimensions.widthSize,
                  ),
                  Image.asset(
                    'assets/images/credit_card.png',
                    height: 30.0,
                  ),
                ],
              ),
              leading: Radio(
                value: SingingCharacter.card,
                toggleable: true,
                autofocus: true,
                groupValue: _character,
                onChanged: (value) {
                  setState(() {
                    _character = value!;
                    print('value: $_character');
                  });
                },
              ),
            ),
          ),
          _character.toString() == 'SingingCharacter.card'
              ? Column(
                  children: [
                    const SizedBox(
                      height: Dimensions.heightSize,
                    ),
                    SizedBox(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Image.asset(
                                'assets/images/visa.png',
                                height: 100.0,
                                width: 150.0,
                                fit: BoxFit.fitWidth,
                              ),
                              const SizedBox(
                                width: Dimensions.widthSize,
                              ),
                              Image.asset(
                                'assets/images/credit_card.png',
                                height: 100.0,
                                width: 150.0,
                                fit: BoxFit.fitWidth,
                              ),
                              const SizedBox(
                                width: Dimensions.widthSize,
                              ),
                              GestureDetector(
                                child: Container(
                                  height: 100.0,
                                  width: 150.0,
                                  decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(Dimensions.radius))),
                                  child: Center(
                                    child: Text(
                                      '${Strings.addNewCard.toUpperCase()} + ',
                                      style: CustomStyle.textStyle,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const AddNewCardScreen()));
                                },
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                )
              : Container(),
          const SizedBox(
            height: Dimensions.heightSize,
          ),
          Container(
            height: 60.0,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.1)),
                borderRadius:
                    const BorderRadius.all(Radius.circular(Dimensions.radius))),
            child: ListTile(
              title: Text(
                Strings.mobileBanking.toUpperCase(),
                style: CustomStyle.textStyle,
              ),
              leading: Radio(
                value: SingingCharacter.mobileBanking,
                toggleable: true,
                autofocus: true,
                groupValue: _character,
                onChanged: (value) {
                  setState(() {
                    _character = value!;
                    print('value: $_character');
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
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
                    Strings.successfullySendYourRequest,
                    style: TextStyle(
                        fontSize: Dimensions.extraLargeTextSize,
                        color: CustomColor.primaryColor,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    child: Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                              Radius.circular(Dimensions.radius))),
                      child: Center(
                        child: Text(
                          Strings.ok.toUpperCase(),
                          style: TextStyle(
                              fontSize: Dimensions.extraLargeTextSize,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const ConfirmRequestScreen(
                                image: 'assets/images/barber/1.png',
                                name: 'Jesika Sabrina',
                                specialist: 'Spa & Skin Specialist ',
                                rating: '5',
                                reviews: '150',
                              )));
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
