import 'package:flutter/material.dart';
import 'package:geza_lite/screens/dashboard/appointment_screen.dart';
import 'package:geza_lite/widgets/back_widget.dart';

import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/data/popular_parlour.dart';
import 'package:geza_lite/widgets/my_rating.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  TextEditingController searchController = TextEditingController();

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
              BackWidget(iconColor: Colors.white),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: CustomColor.accentColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius * 2),
                        topRight: Radius.circular(Dimensions.radius * 2))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: Dimensions.marginSize,
                            right: Dimensions.marginSize,
                            top: Dimensions.heightSize * 3),
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
                            fillColor: CustomColor.accentColor,
                            hintStyle: CustomStyle.textStyle,
                            focusedBorder: CustomStyle.focusBorder,
                            enabledBorder: CustomStyle.focusErrorBorder,
                            focusedErrorBorder: CustomStyle.focusErrorBorder,
                            errorBorder: CustomStyle.focusErrorBorder,
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const SearchResultScreen()));
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: Dimensions.heightSize * 2,
                      ),
                      Text(
                        '${Strings.showSearchResult} (20)',
                        style: TextStyle(
                            fontSize: Dimensions.extraLargeTextSize * 1.2,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      searchResultWidget(context)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  searchResultWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: Dimensions.marginSize, right: Dimensions.marginSize),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: PopularParlourList.list().length,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                PopularParlour popularParlour =
                    PopularParlourList.list()[index];
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: Dimensions.heightSize * 2),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AppointmentScreen()));
                    },
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                height: 150,
                                width: 180,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius),
                                      child: Image.asset(
                                        popularParlour.image,
                                        height: 150,
                                        width: 180,
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
                                                  popularParlour.rating,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: Dimensions
                                                          .smallTextSize,
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                                color:
                                                    CustomColor.secondaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(13)),
                                            child: Center(
                                              child: Text(
                                                popularParlour.status,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: Dimensions
                                                        .smallTextSize,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: Dimensions.widthSize,
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          popularParlour.name,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  Dimensions.largeTextSize,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on,
                                              color: CustomColor.primaryColor,
                                            ),
                                            Text(
                                              '10 km',
                                              style: CustomStyle.textStyle,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: Dimensions.heightSize * 0.5,
                                  ),
                                  Text(
                                    popularParlour.location,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Dimensions.defaultTextSize,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: Dimensions.heightSize * 0.5,
                                  ),
                                  Row(
                                    children: [
                                      MyRating(
                                        rating: popularParlour.rating,
                                      ),
                                      const SizedBox(
                                        width: Dimensions.widthSize * 0.5,
                                      ),
                                      Text(
                                        '(${popularParlour.reviews})',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: Dimensions.defaultTextSize,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          popularParlour.open,
                                          style: CustomStyle.textStyle,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: CustomColor.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Center(
                                            child: Text(
                                              Strings.book,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: Dimensions.heightSize * 2,
                        ),
                        const Divider(
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
