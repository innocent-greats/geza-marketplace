import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/auth/auth_controller.dart';
import 'package:geza_lite/screens/add_new_card_screen.dart';
import 'package:geza_lite/screens/change_password_screen.dart';
import 'package:geza_lite/screens/dashboard/profile_screen.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/utils/strings.dart';

class TraderDrawerMenu extends StatelessWidget {
  TraderDrawerMenu({super.key});
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) => ListView(
        children: [
          ListTile(
            leading: const Icon(
              Icons.account_balance_wallet_rounded,
              color: Colors.white,
            ),
            title: Text(
              Strings.addPaymentMethod,
              style: CustomStyle.listStyle,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddNewCardScreen()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.track_changes_rounded,
              color: Colors.white,
            ),
            title: Text(
              Strings.changePassword,
              style: CustomStyle.listStyle,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChangePasswordScreen()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person_4_rounded,
              color: Colors.white,
            ),
            title: Text(
              'Manage Profile',
              style: CustomStyle.listStyle,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  ProfileScreen()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            title: Text(
              Strings.signOut,
              style: CustomStyle.listStyle,
            ),
            onTap: () {
              _authController.onHandleLogout();
            },
          ),
        ],
      ),
    );
  }
}
