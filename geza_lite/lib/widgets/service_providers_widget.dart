import 'package:flutter/material.dart';
import 'package:geza_lite/screens/dashboard/appointment_screen.dart';

import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/data/services.dart';

class ServiceProvidersWidget extends StatelessWidget {
  const ServiceProvidersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return detailsWidget(context);
  }

  detailsWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: Dimensions.heightSize, bottom: Dimensions.heightSize),
      child: SingleChildScrollView(
        child: servicesWidget(context),
      ),
    );
  }

  servicesWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: ServicesList.list().length,
          itemBuilder: (context, index) {
            Services services = ServicesList.list()[index];
            return Padding(
              padding: const EdgeInsets.only(
                  left: Dimensions.marginSize,
                  right: Dimensions.marginSize,
                  bottom: Dimensions.heightSize),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AppointmentScreen()));
                },
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
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: Dimensions.widthSize),
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
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: Dimensions.widthSize),
                          child: Container(
                            height: 28,
                            width: 70,
                            decoration: BoxDecoration(
                                color: CustomColor.primaryColor,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Center(
                              child: Text(
                                Strings.book,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
