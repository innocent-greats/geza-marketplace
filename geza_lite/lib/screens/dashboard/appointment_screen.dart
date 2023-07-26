import 'package:flutter/material.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/data/services.dart';
import 'package:geza_lite/screens/appointment_details_screen.dart';
import 'package:geza_lite/widgets/back_widget.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

enum SingingCharacter { child, women, others }

class _AppointmentScreenState extends State<AppointmentScreen> {
  SingingCharacter _character = SingingCharacter.child;
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackWidget(
              iconColor: Colors.white,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius * 2),
                      topRight: Radius.circular(Dimensions.radius * 2))),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: Dimensions.heightSize * 3),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        Strings.appointment,
                        style: TextStyle(
                            fontSize: Dimensions.extraLargeTextSize * 1.2,
                            color: Colors.black),
                        textAlign: TextAlign.center,
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
                  const SizedBox(
                    height: Dimensions.heightSize * 2,
                  ),
                  selectServiceWidget(context),
                  const SizedBox(height: Dimensions.heightSize * 2),
                  nextButtonWidget(context),
                  const SizedBox(height: Dimensions.heightSize * 3),
                ],
              ),
            ),
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
                      value: SingingCharacter.child,
                      toggleable: true,
                      autofocus: true,
                      groupValue: _character,
                      onChanged: (value) {
                        setState(() {
                          _character = value!;
                          index = 0;
                        });
                      },
                    ),
                    Text(
                      Strings.child,
                      style: CustomStyle.textStyle,
                    ),
                    const SizedBox(
                      width: Dimensions.widthSize,
                    ),
                    Radio(
                      value: SingingCharacter.women,
                      toggleable: true,
                      autofocus: true,
                      groupValue: _character,
                      onChanged: (value) {
                        setState(() {
                          _character = value!;
                          index = 1;
                        });
                      },
                    ),
                    Text(
                      Strings.women,
                      style: CustomStyle.textStyle,
                    ),
                    const SizedBox(
                      width: Dimensions.widthSize,
                    ),
                    Radio(
                      value: SingingCharacter.others,
                      toggleable: true,
                      autofocus: true,
                      groupValue: _character,
                      onChanged: (value) {
                        setState(() {
                          _character = value!;
                          index = 2;
                        });
                      },
                    ),
                    Text(
                      Strings.others,
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

  selectServiceWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: Dimensions.marginSize),
          child: Text(
            Strings.selectServices,
            style: TextStyle(
                fontSize: Dimensions.extraLargeTextSize,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: ServicesList.list().length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                Services services = ServicesList.list()[index];
                String selectedService = services.serviceList[0].toString();
                return Padding(
                  padding: const EdgeInsets.only(
                    left: Dimensions.marginSize,
                    right: Dimensions.marginSize,
                    bottom: Dimensions.heightSize * 3,
                  ),
                  child: Container(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF8F8F8),
                        borderRadius: BorderRadius.circular(Dimensions.radius)),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            services.image,
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: Dimensions.widthSize),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  services.name,
                                  style: TextStyle(
                                      fontSize: Dimensions.largeTextSize,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: Dimensions.heightSize * 0.5,
                                ),
                                Text('${services.service} Types',
                                    style: CustomStyle.textStyle),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                                color: CustomColor.secondaryColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(Dimensions.radius)),
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.1))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: Dimensions.marginSize * 0.5,
                                  right: Dimensions.marginSize * 0.5),
                              child: DropdownButton(
                                isExpanded: true,
                                underline: Container(),
                                hint: Text(
                                  selectedService,
                                  style: CustomStyle.textStyle,
                                ), // Not necessary for Option 1
                                value: selectedService,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedService = newValue!;
                                    print('value: $selectedService');
                                  });
                                },
                                items: services.serviceList.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: CustomStyle.textStyle,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
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
              Strings.next.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Dimensions.largeTextSize,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AppointmentDetailsScreen()));
        },
      ),
    );
  }
}
