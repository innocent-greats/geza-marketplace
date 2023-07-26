import 'package:flutter/material.dart';
import 'package:geza_lite/widgets/back_widget.dart';

import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/widgets/my_rating.dart';
import 'package:geza_lite/screens/booking_messaging_screen.dart';
import 'package:geza_lite/class/url_launcher.dart';

class ConfirmRequestScreen extends StatefulWidget {
  final String image, name, specialist, rating, reviews;

  const ConfirmRequestScreen(
      {super.key,
      required this.image,
      required this.name,
      required this.specialist,
      required this.rating,
      required this.reviews});
  @override
  _ConfirmRequestScreenState createState() => _ConfirmRequestScreenState();
}

class _ConfirmRequestScreenState extends State<ConfirmRequestScreen> {
  TextEditingController commentController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  bool isFinish = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: Stack(
        children: [
          BackWidget(
            iconColor: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: CustomColor.accentColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius * 2),
                      topRight: Radius.circular(Dimensions.radius * 2))),
              child: ListView(
                //physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  isFinish
                      ? Text(
                          Strings.beautyExpert,
                          style: TextStyle(
                              fontSize: Dimensions.extraLargeTextSize * 1.2,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          Strings.weHaveCompletedYourService,
                          style: TextStyle(
                              fontSize: Dimensions.extraLargeTextSize * 1.2,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                  const SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  profileWidget(context),
                  const SizedBox(
                    height: Dimensions.heightSize * 2,
                  ),
                  dateTimeWidget(context),
                  const SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  amountWidget(context),
                  const SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  isFinish ? Container() : giveYourRatingWidget(context),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          isFinish ? finishButtonWidget(context) : doneButtonWidget(context),
        ],
      ),
    );
  }

  profileWidget(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Image.asset(
            widget.image,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: Dimensions.heightSize,
        ),
        Text(
          widget.name,
          style: TextStyle(
              fontSize: Dimensions.extraLargeTextSize,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: Dimensions.heightSize * 0.5,
        ),
        Text(
          widget.specialist,
          style: CustomStyle.textStyle,
        ),
        const SizedBox(
          height: Dimensions.heightSize * 0.5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyRating(
              rating: widget.rating,
            ),
            const SizedBox(
              width: Dimensions.widthSize * 0.5,
            ),
            Text(
              widget.rating,
              style: CustomStyle.textStyle,
            ),
            const SizedBox(
              width: Dimensions.widthSize * 0.5,
            ),
            Text(
              '(${widget.reviews})',
              style: CustomStyle.textStyle,
            ),
          ],
        ),
        const SizedBox(height: Dimensions.heightSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Container(
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                    color: CustomColor.primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: const Icon(
                  Icons.call,
                  color: Colors.white,
                  size: 15,
                ),
              ),
              onTap: () {
                UrlLauncher.url(Strings.callingNumber);
              },
            ),
            const SizedBox(width: Dimensions.widthSize),
            GestureDetector(
              child: Container(
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                    color: CustomColor.primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: const Icon(
                  Icons.messenger,
                  color: Colors.white,
                  size: 15,
                ),
              ),
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const BookingMessagingScreen()));
              },
            ),
          ],
        ),
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
          /*Container(
            height: 50.0,
            //width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: CustomColor.accentColor,
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius)),
                border: Border.all(color: Colors.black.withOpacity(0.1))
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: Dimensions.marginSize * 0.5, right: Dimensions
                  .marginSize * 0.5),
              child: DropdownButton(
                isExpanded: true,
                underline: Container(),
                hint: Text(
                  selectedCoupon,
                  style: CustomStyle.textStyle,
                ), // Not necessary for Option 1
                value: selectedCoupon,
                onChanged: (newValue) {
                  setState(() {
                    selectedCoupon = newValue;
                    print('value: '+selectedCoupon.toString());
                  });
                },
                items: couponList.map((value) {
                  return DropdownMenuItem(
                    child: new Text(
                      value,
                      style: CustomStyle.textStyle,
                    ),
                    value: value,
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: Dimensions.heightSize),
          selectedCoupon == 'I have a coupon' ? TextFormField(
            style: CustomStyle.textStyle,
            controller: couponController,
            keyboardType: TextInputType.text,
            validator: (String value){
              if(value.isEmpty){
                return Strings.pleaseFillOutTheField;
              }else{
                return null;
              }
            },
            decoration: InputDecoration(
              hintText: 'OFFER10',
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              labelStyle: CustomStyle.textStyle,
              filled: true,
              fillColor: CustomColor.accentColor,
              hintStyle: CustomStyle.textStyle,
              focusedBorder: CustomStyle.focusBorder,
              enabledBorder: CustomStyle.focusErrorBorder,
              focusedErrorBorder: CustomStyle.focusErrorBorder,
              errorBorder: CustomStyle.focusErrorBorder,
            ),
          )
              : Container(),*/
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

  giveYourRatingWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.giveYourRating,
            style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.extraLargeTextSize,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: Dimensions.heightSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Strings.behaviour, style: CustomStyle.textStyle),
                  const SizedBox(height: Dimensions.heightSize * 0.5),
                  const MyRating(
                    rating: '5',
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Strings.behaviour, style: CustomStyle.textStyle),
                  const SizedBox(height: Dimensions.heightSize * 0.5),
                  const MyRating(
                    rating: '5',
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: Dimensions.heightSize * 0.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Strings.price, style: CustomStyle.textStyle),
                  const SizedBox(height: Dimensions.heightSize * 0.5),
                  const MyRating(
                    rating: '5',
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Strings.skill, style: CustomStyle.textStyle),
                  const SizedBox(height: Dimensions.heightSize * 0.5),
                  const MyRating(
                    rating: '5',
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: Dimensions.heightSize),
          Text(
            Strings.yourComment,
            style: TextStyle(
                color: Colors.black, fontSize: Dimensions.extraLargeTextSize),
          ),
          const SizedBox(
            height: Dimensions.heightSize * 0.5,
          ),
          TextFormField(
            style: CustomStyle.textStyle,
            controller: commentController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: Strings.demoComment,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
              labelStyle: CustomStyle.textStyle,
              filled: true,
              fillColor: CustomColor.accentColor,
              hintStyle: CustomStyle.textStyle,
              focusedBorder: CustomStyle.focusBorder,
              enabledBorder: CustomStyle.focusErrorBorder,
              focusedErrorBorder: CustomStyle.focusErrorBorder,
              errorBorder: CustomStyle.focusErrorBorder,
            ),
          ),
          const SizedBox(height: Dimensions.heightSize),
          Text(
            '${Strings.addTip} ${widget.name}',
            style: TextStyle(
                color: Colors.black, fontSize: Dimensions.extraLargeTextSize),
          ),
          const SizedBox(
            height: Dimensions.heightSize * 0.5,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: Dimensions.buttonHeight,
                width: 100,
                child: TextFormField(
                  style: CustomStyle.textStyle,
                  controller: amountController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: Strings.amount,
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
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  child: Container(
                    height: Dimensions.buttonHeight,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.black.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(Dimensions.radius)),
                    child: Center(
                      child: Text(
                        '\$5',
                        style: TextStyle(
                            fontSize: Dimensions.largeTextSize * 2,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      amountController.text = '5';
                    });
                  },
                ),
              ),
              const SizedBox(
                width: Dimensions.widthSize,
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  child: Container(
                    height: Dimensions.buttonHeight,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.black.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(Dimensions.radius)),
                    child: Center(
                      child: Text(
                        '\$10',
                        style: TextStyle(
                            fontSize: Dimensions.largeTextSize * 2,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      amountController.text = '10';
                    });
                  },
                ),
              ),
              const SizedBox(
                width: Dimensions.widthSize,
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  child: Container(
                    height: Dimensions.buttonHeight,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.black.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(Dimensions.radius)),
                    child: Center(
                      child: Text(
                        '\$15',
                        style: TextStyle(
                            fontSize: Dimensions.largeTextSize * 2,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      amountController.text = '15';
                    });
                  },
                ),
              ),
              const SizedBox(
                width: Dimensions.widthSize,
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  child: Container(
                    height: Dimensions.buttonHeight,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.black.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(Dimensions.radius)),
                    child: Center(
                      child: Text(
                        '\$20',
                        style: TextStyle(
                            fontSize: Dimensions.largeTextSize * 2,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      amountController.text = '20';
                    });
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  finishButtonWidget(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
        child: Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: CustomColor.primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius * 2),
                  topRight: Radius.circular(Dimensions.radius * 2))),
          child: Center(
            child: Text(
              Strings.finish.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onTap: () {
          setState(() {
            isFinish = false;
          });
          //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
          //AppointmentDetailsScreen()));
        },
      ),
    );
  }

  doneButtonWidget(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
        child: Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: CustomColor.primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius * 2),
                  topRight: Radius.circular(Dimensions.radius * 2))),
          child: Center(
            child: Text(
              Strings.done.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onTap: () {
          setState(() {
            isFinish = true;
          });
          //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
          //AppointmentDetailsScreen()));
        },
      ),
    );
  }
}
