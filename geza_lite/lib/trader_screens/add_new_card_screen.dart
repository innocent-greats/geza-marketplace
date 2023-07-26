import 'package:flutter/material.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/widgets/back_widget.dart';
import 'package:geza_lite/widgets/bg_image_widget.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  _AddNewCardScreenState createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String expDate = 'exp date';
  List<String> typeList = ['Master Card', 'Visa Card', 'Credit Card'];
  late String selectedCard;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedCard = typeList[0].toString();
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
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize,
          right: Dimensions.marginSize,
          top: Dimensions.heightSize * 3),
      child: Column(
        children: [
          Text(
            Strings.addNewCard,
            style: TextStyle(
                fontSize: Dimensions.extraLargeTextSize * 1.5,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          const SizedBox(
            height: Dimensions.heightSize * 3,
          ),
          Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.cardType,
                    style: CustomStyle.textStyle,
                  ),
                  const SizedBox(height: Dimensions.heightSize * 0.5),
                  Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(Dimensions.radius)),
                        border:
                            Border.all(color: Colors.black.withOpacity(0.1))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: Dimensions.marginSize * 0.5,
                          right: Dimensions.marginSize * 0.5),
                      child: DropdownButton(
                        isExpanded: true,
                        underline: Container(),
                        hint: Text(
                          selectedCard,
                          style: CustomStyle.textStyle,
                        ), // Not necessary for Option 1
                        value: selectedCard,
                        onChanged: (newValue) {
                          setState(() {
                            selectedCard = newValue!;
                          });
                        },
                        items: typeList.map((value) {
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
                  const SizedBox(height: Dimensions.heightSize),
                  Text(
                    Strings.cardNumber,
                    style: CustomStyle.textStyle,
                  ),
                  const SizedBox(height: Dimensions.heightSize * 0.5),
                  TextFormField(
                    style: CustomStyle.textStyle,
                    controller: numberController,
                    decoration: InputDecoration(
                      labelText: Strings.demoCardNumber,
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
                    Strings.cardHolderName,
                    style: CustomStyle.textStyle,
                  ),
                  const SizedBox(height: Dimensions.heightSize * 0.5),
                  TextFormField(
                    style: CustomStyle.textStyle,
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: Strings.demoHolderName,
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.expirationDate,
                              style: CustomStyle.textStyle,
                            ),
                            const SizedBox(height: Dimensions.heightSize * 0.5),
                            GestureDetector(
                              onTap: () => _selectDate(context),
                              child: Container(
                                  height: 48.0,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.1)),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5.0))),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        expDate,
                                        style: CustomStyle.textStyle,
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: Dimensions.heightSize),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.cvv,
                              style: CustomStyle.textStyle,
                            ),
                            const SizedBox(height: Dimensions.heightSize * 0.5),
                            TextFormField(
                              style: CustomStyle.textStyle,
                              controller: cvvController,
                              decoration: InputDecoration(
                                labelText: '123',
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                labelStyle: CustomStyle.textStyle,
                                focusedBorder: CustomStyle.focusBorder,
                                enabledBorder: CustomStyle.focusErrorBorder,
                                focusedErrorBorder:
                                    CustomStyle.focusErrorBorder,
                                errorBorder: CustomStyle.focusErrorBorder,
                                filled: true,
                                fillColor: CustomColor.accentColor,
                                hintStyle: CustomStyle.textStyle,
                              ),
                            ),
                            const SizedBox(height: Dimensions.heightSize),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )),
          const SizedBox(height: Dimensions.heightSize),
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
                  Strings.saveCard.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.largeTextSize,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onTap: () {},
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
}
