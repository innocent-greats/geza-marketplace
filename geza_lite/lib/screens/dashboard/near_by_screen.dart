import 'package:flutter/material.dart';
import 'package:geza_lite/screens/dashboard/appointment_screen.dart';
import 'package:geza_lite/screens/search_result_screen.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/data/near_by.dart';
import 'package:geza_lite/widgets/nearby.dart';

class NearByScreen extends StatefulWidget {
  const NearByScreen({super.key});

  @override
  _NearByScreenState createState() => _NearByScreenState();
}

class _NearByScreenState extends State<NearByScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius * 2),
                  topRight: Radius.circular(Dimensions.radius * 2))),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const NearbyProfessionalsMap(),
              headerWidget(context),
              nearByWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  headerWidget(BuildContext context) {
    return Positioned(
      top: 5,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 10,
                left: Dimensions.marginSize,
                right: Dimensions.marginSize),
            child: TextFormField(
              style: CustomStyle.textStyle,
              controller: searchController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: Strings.spaFacialMakeup,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                labelStyle: CustomStyle.textStyle,
                filled: true,
                fillColor: const Color.fromARGB(6, 210, 7, 255),
                hintStyle: CustomStyle.textStyle,
                focusedBorder: CustomStyle.focusBorder,
                enabledBorder: CustomStyle.focusErrorBorder,
                focusedErrorBorder: CustomStyle.focusErrorBorder,
                errorBorder: CustomStyle.focusErrorBorder,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search, color: Colors.purple),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SearchResultScreen()));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  nearByWidget(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 5,
      left: 5,
      child: SizedBox(
        height: 220,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: NearByList.list().length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            NearBy nearby = NearByList.list()[index];
            return Padding(
              padding: const EdgeInsets.only(left: Dimensions.marginSize),
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius)),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AppointmentScreen()));
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                        width: 200,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(Dimensions.radius),
                                  topRight: Radius.circular(Dimensions.radius)),
                              child: Image.asset(
                                nearby.image,
                                height: 150,
                                width: 200,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Positioned(
                              bottom: 20.0,
                              left: 10,
                              child: Row(
                                children: [
                                  Container(
                                    height: 25,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: CustomColor.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(13)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        Text(
                                          nearby.rating,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  Dimensions.smallTextSize,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: Dimensions.widthSize * 0.5,
                                  ),
                                  Container(
                                    height: 25,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: CustomColor.secondaryColor,
                                        borderRadius:
                                            BorderRadius.circular(13)),
                                    child: Center(
                                      child: Text(
                                        nearby.status,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: Dimensions.smallTextSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: Dimensions.heightSize),
                      Column(
                        children: [
                          Text(
                            nearby.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: Dimensions.largeTextSize,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: Dimensions.heightSize * 0.5,
                          ),
                          Text(
                            nearby.location,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.defaultTextSize,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
