import 'package:flutter/material.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/screens/dashboard/home_screen.dart';
import 'package:geza_lite/screens/dashboard/appointment_history_screen.dart';
import 'package:geza_lite/screens/dashboard/request_screen.dart';
import 'package:geza_lite/screens/dashboard/profile_screen.dart';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';

double scaledHeight(BuildContext context, double baseSize) {
  return baseSize * (MediaQuery.of(context).size.height / 800);
}

double scaledWidth(BuildContext context, double baseSize) {
  return baseSize * (MediaQuery.of(context).size.width / 375);
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

int currentIndex = 0;

class _DashboardScreenState extends State<DashboardScreen> {
  DateTime? currentBackPressTime;

  late Color logoColor = Colors.red;
  late int activeIndex;

  var iconData = <IconData>[
    Icons.home,
    Icons.messenger,
    Icons.apps_outlined,
    Icons.person,
  ];

  var badges = <int>[];

  var iconText = <Widget>[
    Text(
      Strings.home,
      style: const TextStyle(color: Colors.black, fontSize: 12),
      textAlign: TextAlign.center,
    ),
    Text(
      Strings.request,
      style: const TextStyle(color: Colors.black, fontSize: 12),
      textAlign: TextAlign.center,
    ),
    Text(
      Strings.appointmentHistory,
      style: const TextStyle(color: Colors.black, fontSize: 12),
      textAlign: TextAlign.center,
    ),
    Text(
      Strings.profile,
      style: const TextStyle(color: Colors.black, fontSize: 12),
      textAlign: TextAlign.center,
    ),
  ];

  var indicatorColors = <Color>[
    CustomColor.primaryColor,
    CustomColor.primaryColor,
    CustomColor.primaryColor,
    CustomColor.primaryColor,
  ];

  @override
  void initState() {
    logoColor = Colors.red;
    activeIndex = 0;
    super.initState();
  }

  changeIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  void incrementIndex() {
    setState(() {
      activeIndex = activeIndex < (iconData.length - 1) ? activeIndex + 1 : 0;
    });
  }

  _onTap(int index) {
    activeIndex = index;

    print('indexsd: $index');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
        child: (currentIndex == 0)
            ?  HomeScreen()
            : (currentIndex == 1)
                ? const RequestScreen()
                : (currentIndex == 2)
                    ? const AppointmentHistoryScreen()
                    :  ProfileScreen(),
      ),
      bottomNavigationBar: Container(
        height: 80.0,
        alignment: Alignment.center,
        child: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icons.home,
              // Icons.messenger,
              // Icons.apps_outlined,
              // Icons.person,
              getBottomBarItemTile(
                  0,
                  Icon(
                    iconData[0],
                    color: Colors.pink,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  'Home'),
              getBottomBarItemTile(
                  1,
                  Icon(
                    iconData[1],
                    color: Colors.pink,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  'Appointments'),
              // getBottomBarItemTile(
              //     2,
              //     Icon(
              //       iconData[2],
              //       color: Colors.pink,
              //       size: 24.0,
              //       semanticLabel: 'Text to announce in accessibility modes',
              //     ),
              //     'Appointment'),
              getBottomBarItemTile(
                  3,
                  Icon(
                    iconData[3],
                    color: Colors.pink,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return false;
    } else {
      return true;
    }
  }

  getBottomBarItemTile(int index, Widget iconData, String title) {
    return InkWell(
      focusColor: Colors.purple,
      onTap: () {
        changeIndex(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconData,
          Text(
            title,
            style: TextStyle(
              color: (currentIndex == index)
                  ? Colors.purple
                  : Colors.grey.withOpacity(0.6),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  goToScreen(int activeIndex) {
    switch (activeIndex) {
      case 0:
        return  HomeScreen();
      case 1:
        return const RequestScreen();
      case 2:
        return const AppointmentHistoryScreen();
      case 3:
        return  ProfileScreen();
    }
  }
}
