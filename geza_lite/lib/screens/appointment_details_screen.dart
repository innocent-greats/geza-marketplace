import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/customer_service_controller.dart';
import 'package:geza_lite/screens/parlour_details_screen.dart';

import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/data/barber.dart';
import 'package:geza_lite/screens/barber_details_screen.dart';
import 'package:geza_lite/data/slot.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geza_lite/screens/user_invoice_screen.dart';
import 'package:gezamarketplace_client/gezamarketplace_client.dart';

class AppointmentDetailsScreen extends StatefulWidget {
  const AppointmentDetailsScreen({super.key});

  @override
  _AppointmentDetailsScreenState createState() =>
      _AppointmentDetailsScreenState();
}

enum CustomerType { myself, dependant, friend }

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {
  DateTime selectedDate = DateTime.now();
  String expDate = 'exp date';
  String selectedTime = '';
  List list = [];
  String _character = 'myself';
  int index = 0;
  double? couponAmount = 0.0;
  double? rewardsAmount = 0.0;
  List<String> couponList = ['No Coupon', 'I have a coupon'];
  late String selectedCoupon;
  TextEditingController couponController = TextEditingController();
  CustomerServicesController _servicesController =
      Get.put(CustomerServicesController());
  BeautyStyle beautyStyle = Get.arguments;

  get totalInvoiceAmount =>
      beautyStyle.amount! - (couponAmount! + rewardsAmount!);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedCoupon = couponList[1].toString();
    print('coupon: $selectedCoupon');
    print('Get beautyStyle arguments : $beautyStyle');
    getSlotList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: CustomColor.accentColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius * 2),
                      topRight: Radius.circular(Dimensions.radius * 2))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: Dimensions.heightSize * 3,
                        left: Dimensions.heightSize - 10),
                    child: Expanded(
                      child: GestureDetector(
                        child: const Row(
                          children: [
                            SizedBox(
                              width: Dimensions.widthSize,
                            ),
                            SizedBox(
                                child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios,
                                  color: CustomColor.primaryColor,
                                ),
                                // Text(
                                //   Strings.back,
                                //   style: TextStyle(
                                //       color: Colors.white, fontSize: Dimensions.largeTextSize),
                                // )
                              ],
                            )),
                            SizedBox(
                              width: Dimensions.widthSize,
                            ),
                            // SizedBox(
                            //   width: MediaQuery.of(context).size.width,
                            //   child: Text(
                            //     '${beautyStyle.name.capitalize} Appointment',
                            //     style: TextStyle(
                            //         fontSize: Dimensions.extraLargeTextSize,
                            //         color: Colors.black),
                            //     textAlign: TextAlign.center,
                            //   ),
                            // ),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ParlourDetailsScreen()));
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  chooseCustomerTypeWidget(context),
                  const SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  selectDateWidget(context),
                  const SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  selectTimeSlotWidget(context),
                  const SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  serviceAmountWidget(context),
                  const SizedBox(height: Dimensions.heightSize * 2),
                  nextButtonWidget(context),
                  const SizedBox(height: Dimensions.heightSize * 3),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  chooseCustomerTypeWidget(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(left: Dimensions.marginSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.customerType,
              style: TextStyle(
                  fontSize: Dimensions.extraLargeTextSize,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Dimensions.heightSize * 0.5,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: Dimensions.marginSize, right: Dimensions.marginSize),
              child: SizedBox(
                height: 20.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Radio(
                      value: 'myself',
                      toggleable: true,
                      autofocus: true,
                      groupValue: _character,
                      onChanged: (value) {
                        setState(() {
                          _character = value!;
                          index = 0;
                          print(_character);
                        });
                      },
                    ),
                    Text(
                      'Myself',
                      style: CustomStyle.textStyle,
                    ),
                    const SizedBox(
                      width: Dimensions.widthSize,
                    ),
                    Radio(
                      value: 'dependant',
                      toggleable: true,
                      autofocus: true,
                      groupValue: _character,
                      onChanged: (value) {
                        setState(() {
                          _character = value!;
                          index = 0;
                          print(_character);
                        });
                      },
                    ),
                    Text(
                      'Dependant',
                      style: CustomStyle.textStyle,
                    ),
                    const SizedBox(
                      width: Dimensions.widthSize,
                    ),
                    Radio(
                      value: 'friend',
                      toggleable: true,
                      autofocus: true,
                      groupValue: _character,
                      onChanged: (value) {
                        setState(() {
                          _character = value!;
                          index = 1;
                          print(_character);
                        });
                      },
                    ),
                    Text(
                      'Friend',
                      style: CustomStyle.textStyle,
                    ),
                    const SizedBox(
                      width: Dimensions.widthSize,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  chooseBeautyExpertWidget(BuildContext context) {
    return SizedBox(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: Dimensions.marginSize),
            child: Text(
              Strings.chooseYourBeautyExpert,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: Dimensions.extraLargeTextSize,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: Dimensions.heightSize),
          Padding(
            padding: const EdgeInsets.only(left: Dimensions.marginSize),
            child: SizedBox(
              height: 120,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: BarberList.list().length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Barber barber = BarberList.list()[index];
                  return Padding(
                    padding:
                        const EdgeInsets.only(right: Dimensions.widthSize * 3),
                    child: GestureDetector(
                      child: SizedBox(
                        height: 120,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Image.asset(
                                barber.image,
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: Dimensions.heightSize,
                            ),
                            Text(
                              barber.name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BarberDetailsScreen(
                                  image: barber.image,
                                  name: barber.name,
                                  specialist: barber.specialist,
                                  rating: barber.rating,
                                  reviews: barber.reviews,
                                )));
                      },
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  selectDateWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.selectDate,
            style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.extraLargeTextSize,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: Dimensions.heightSize),
          GestureDetector(
            onTap: () => _selectDate(context),
            child: Container(
                height: 48.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                    borderRadius: const BorderRadius.all(Radius.circular(5.0))),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: Dimensions.marginSize,
                        right: Dimensions.marginSize),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          expDate,
                          style: CustomStyle.textStyle,
                        ),
                        const Icon(Icons.calendar_today)
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020, 1),
        lastDate: DateTime(2030));
    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked!;
        expDate = "${selectedDate.toLocal()}".split(' ')[0];
        print('date: $expDate');
      });
    }
  }

  selectTimeSlotWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.selectTimeSlot,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.extraLargeTextSize,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.green),
                    ),
                    const SizedBox(
                      width: Dimensions.widthSize * 0.5,
                    ),
                    Text(
                      Strings.available,
                      style: TextStyle(
                        fontSize: Dimensions.smallTextSize,
                      ),
                    ),
                    const SizedBox(width: Dimensions.widthSize),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: CustomColor.secondaryColor),
                    ),
                    const SizedBox(
                      width: Dimensions.widthSize * 0.5,
                    ),
                    Text(
                      Strings.booked,
                      style: TextStyle(
                        fontSize: Dimensions.smallTextSize,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: Dimensions.heightSize),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                crossAxisCount: 5,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(SlotList.list().length, (index) {
                  Slot slot = SlotList.list()[index];
                  return TextButton(
                    child: Container(
                      height: 50,
                      // width: 100,
                      decoration: BoxDecoration(
                          color: slot.isAvailable
                              ? list[index]
                                  ? Colors.green
                                  : CustomColor.primaryColor
                              : CustomColor.secondaryColor,
                          border: Border.all(
                              color: Colors.black.withOpacity(0.3), width: 1),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(Dimensions.radius))),
                      child: Center(
                        child: Text(
                          slot.time,
                          style: TextStyle(
                              fontSize: Dimensions.smallTextSize,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    onPressed: () {
                      print('selected slot $slot');

                      if (!slot.isAvailable) {
                        print('already booked');
                        Fluttertoast.showToast(
                            msg: Strings.slotIsNotAvailable,
                            backgroundColor: Colors.red,
                            textColor: Colors.white);
                      } else {
                        setState(() {
                          selectedTime = slot.time;
                          list[index] = !list[index];
                        });
                        print('you can book this slot: $list');
                      }
                    },
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  void getSlotList() {
    int data = SlotList.list().length;
    for (int i = 0; i < data; i++) {
      Slot slot = SlotList.list()[i];
      list.add(slot.isAvailable);

      print('list: $list');
    }
  }

  serviceAmountWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize, right: Dimensions.marginSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Service Invoice',
            style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.extraLargeTextSize,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: Dimensions.heightSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${beautyStyle.name.capitalize}',
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$ ${beautyStyle.amount}',
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
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
              const Text(
                'Redeemable Reward Amount',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$ $rewardsAmount',
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: Dimensions.heightSize),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(height: Dimensions.heightSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.total,
                style: TextStyle(
                    fontSize: Dimensions.extraLargeTextSize,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '\$ ${totalInvoiceAmount} ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Dimensions.extraLargeTextSize,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ],
      ),
    );
  }

  nextButtonWidget(BuildContext context) {
    return Padding(
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
            child: Text(
              'Continue to Book'.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onTap: () {
          _servicesController.onInitiateBooking(_character, selectedDate,
              selectedTime, beautyStyle.id, beautyStyle.stylistId, beautyStyle.name, beautyStyle.amount);
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => UserInvoiceScreen()));
        },
      ),
    );
  }
}
