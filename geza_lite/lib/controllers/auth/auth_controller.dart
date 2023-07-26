import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/main_controller.dart';
import 'package:geza_lite/controllers/storage/local_storage.dart';
import 'package:geza_lite/data/initiated_booking.dart';
import 'package:geza_lite/screens/auth/account.dart';
import 'package:geza_lite/screens/auth/sign_in_screen.dart';
import 'package:geza_lite/screens/auth/validation_screen.dart';
import 'package:geza_lite/screens/dashboard/home_screen.dart';
import 'package:geza_lite/screens/dashboard/profile_screen.dart';
import 'package:geza_lite/screens/dashboard_screen.dart';
import 'package:geza_lite/screens/home_tabs_screen.dart';
import 'package:geza_lite/screens/dashboard/sliver_app_bar.dart';
import 'package:geza_lite/widgets/dashboard_widget.dart';

import 'package:gezamarketplace_client/gezamarketplace_client.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class AuthController extends MainController {
  FxFormValidator basicValidator = FxFormValidator();
  var isLoggedIn = false.obs;
  var formErrors = false.obs;
  var tempSignUpEmail = ''.obs;
  var tempSignUpPassword = ''.obs;
  var formErrorMessage = ''.obs;
  var selectedCity = ''.obs;
  var selectedNeighbourhood = ''.obs;
  String? response;
  bool showPassword = false, loading = false;
  var isLoading = false.obs;
  bool confirmPassword = false;
  late List<String> accontTypes = ['customer', 'trader'].obs;
  List<String> traderAccontTypes = [
    'Beauty Specialist',
    'Beauty Products Trader'
  ];
  var selectedAccontType = 'customer'.obs;
  var selectedVendorAccontType = ''.obs;
  List<String> vendorAccontTypes = [
    'hairstyling',
    'cosmetic treatments',
    'beauty products'
  ];
  List<String> beautyParlourTypes = [
    'hairstyling',
    'cosmetic treatments',
    'products store'
  ];
  late String selectedBeautyParlourType = '';
  late EmailAuthController emailAuth = EmailAuthController(client.modules.auth);

  @override
  onInit() async {
    super.onInit();
    // onHandleLogout();
    // accontTypes = ['customer', 'trader'];
    selectedAccontType.value = accontTypes[0];
    selectedVendorAccontType.value = vendorAccontTypes[0];
    selectedBeautyParlourType = beautyParlourTypes[0];
    debugPrint('AuthController onInit()');
    // emailAuth = EmailAuthController(client.modules.auth);
    await LocalStorage.init();
    person = LocalStorage.getAuthenticatedUser();
    sessionManager.isSignedIn
        ? Get.to(const SliverAppBarScreen())
        : onHandleLogout();
    // if (person == null) {
    //   onHandleLogout();
    // } else {
    //   Get.to(const SliverAppBarScreen());
    // }
  }

  void onSelectedAccontType(Object account) {
    debugPrint('onSelectedAccontType $account');
    selectedAccontType.value = account as String;
    update();
    debugPrint('Selected account $selectedAccontType');
  }

  void onSelectedCity(Object query) {
    debugPrint('selectedCity $query');
    selectedCity.value = query as String;
    update();
    // populatedNeighbourhoods.value
    for (Province province in locations) {
      debugPrint('provinces loop data ${province.name}');
      for (CityTown city in province.cities) {
        debugPrint('cities loop data ${city.name}');

        if (city.name == selectedCity.value.toLowerCase()) {
          debugPrint('matched City data ${city.name}');
          debugPrint('matched Areas data ${city.neighbourhoods}');

          populatedNeighbourhoods.value = city.neighbourhoods;
        }
        break;
      }
    }
    debugPrint('Selected selectedCity ${selectedCity.value}');
  }

  void onSelectedArea(Object area) {
    debugPrint('onSelectedArea $area');
    selectedNeighbourhood.value = area as String;
    update();
    debugPrint('Selected selectedNeighbourhood ${selectedNeighbourhood.value}');
  }

  void onSelectedVendorAccontTypes(String category) {
    debugPrint('onSelectedBeautyParlourType $category');
    selectedVendorAccontType.value = category;
    update();
    debugPrint('Selected Specialty $selectedVendorAccontType');
  }

  // Services
  onValidateSignUp(String validationCode) async {
    debugPrint('onValidateSignUp Method $validationCode');

    try {
      var userInfo = await emailAuth.validateAccount(
        tempSignUpEmail.value,
        validationCode,
      );
      debugPrint('onValidateSignUp userInfo $userInfo');

      if (userInfo == null) {
        formErrorMessage.value = 'Incorrect code';
        formErrors.value = true;
        return;
      }

      // We've setup the account, sign in!
      var response = await emailAuth.signIn(
          tempSignUpEmail.value, tempSignUpPassword.value);
      if (response == null) {
        debugPrint('onValidateSignUp response $response');
      } else {
        var user = getUserAccount(response.id as int);
        if (user != null) {
          Get.to(const SliverAppBarScreen());
        }
      }
    } catch (e) {
      debugPrint('onValidateSignUp catch $e');
    }
  }

  // Services
  onLogin(String phone) async {
    debugPrint('onLogin Method $phone');
    try {
      if (phone != '') {
        isLoading.value = true;
        update();
        tempSignUpPassword.value = '${phone}tempSignUpPassword';

        var response = await emailAuth.signIn(
          '${phone}@geza.io',
          tempSignUpPassword.value = '${phone}tempSignUpPassword',
        );
        debugPrint('onLogin response $response');
        update();
        // ignore: unnecessary_null_comparison
        if (response == null) {
        } else {
          var user = getUserAccount(response.id as int);
          if (user != null) {
            Get.to(const SliverAppBarScreen());
          }
        }
        isLoading.value = false;
        update();
      } else {
        isLoading(false);
        formErrors.value = true;
        formErrorMessage.value = 'Form has empty fields, fill all fields';
      }
    } catch (e) {
      isLoading(false);

      formErrors.value = true;
      formErrorMessage.value = e.toString();
      debugPrint('onLogin error $e');
    }
  }

  getUserAccount(int id) async {
    debugPrint('getUserAccount Method $id');
    try {
      if (id != null) {
        isLoading.value = true;
        update();
        response = await client.person.getUserAccount(id);

        update();
        // ignore: unnecessary_null_comparison
        if (response == null) {
          isLoading.value = false;
          formErrors.value = true;
          formErrorMessage.value = 'Login Error, User with phone $id not found';
        } else {
          var resObject = jsonDecode(response as String);
          debugPrint('jsonDecoded response ${resObject['method']}');

          final decClaimSet =
              verifyJwtHS256Signature(resObject['method'] as String, "jwtKey");
          // debugPrint('jsonString: $decClaimSet}\n');

          var claimPerson = decClaimSet['pld']["user"];
          debugPrint(
              'profileImagePathLocation: ${claimPerson['profileImagePathLocation']}\n');
          // debugPrint('parsedJson: $claimPersn\n');
          List<String> spec = List<String>.from(claimPerson['specialization']);

          person = Person(
              createdDate: DateTime.now().toString(),
              id: claimPerson['id'],
              firstName: claimPerson['firstName'],
              lastName: claimPerson['lastName'],
              phone: claimPerson['phone'],
              isCustomer: claimPerson['isCustomer'],
              isTrader: claimPerson['isTrader'],
              profileImagePathLocation: claimPerson['profileImagePathLocation'],
              specialization: spec);
          update();

          String nextUrl =
              Uri.parse(ModalRoute.of(Get.context!)?.settings.name ?? "")
                      .queryParameters['next'] ??
                  "/account";
          debugPrint('onLogin success $nextUrl');
          await LocalStorage.removeLoggedInUser();
          await LocalStorage.setLoggedInUserToken(response as String);
          await LocalStorage.setLoggedInUser(person.toString());
          isLoading.value = false;
          Get.to(const SliverAppBarScreen());
        }
        isLoading.value = false;
        update();
        return person;
      } else {
        isLoading(false);
        formErrors.value = true;
        formErrorMessage.value = 'Form has empty fields, fill all fields';
        return null;
      }
    } catch (e) {
      isLoading(false);
      formErrors.value = true;
      formErrorMessage.value = e.toString();
      debugPrint('onLogin error $e');
      return null;
    }
  }

  Future<void> onHandleSignUp(
    String firstName,
    String lastName,
    String phone,
  ) async {
    try {
      isLoading(true);
      var vendorSearchTerm =
          '$firstName $lastName  $phone ${selectedCity.value} ${selectedNeighbourhood.value} ${selectedAccontType.value.toString()} ${selectedVendorAccontType.value.toString()}';
      var customerSearchTerm =
          '$firstName $lastName  $phone ${selectedCity.value} ${selectedNeighbourhood.value} ${selectedAccontType.value.toString()}';
      var person = Person(
          createdDate: DateTime.now().toString(),
          firstName: firstName,
          lastName: lastName,
          phone: phone,
          neighbourhood: selectedNeighbourhood.value,
          city: selectedCity.value,
          isCustomer: selectedAccontType.value == 'customer' ? true : false,
          isTrader: selectedAccontType.value == 'trader' ? true : false,
          specialization: selectedAccontType.value == 'trader'
              ? [(selectedVendorAccontType.value)]
              : [],
          searchTerm: selectedAccontType.value == 'trader'
              ? vendorSearchTerm
              : customerSearchTerm);

      if (firstName != '') {
        debugPrint('onHandleSignUp person $person');

        response = await client.person.handleSignUp(person);
        isLoading(false);
        debugPrint('onHandleSignUp response $response');
        if (response == null) {
          // basicValidator.addErrors(errors);
          basicValidator.validateForm();
          basicValidator.clearErrors();
        } else {
          tempSignUpEmail.value = '${phone}@geza.io';
          tempSignUpPassword.value = '${phone}tempSignUpPassword';
          var success = await emailAuth.createAccountRequest(
            firstName,
            tempSignUpEmail.value,
            tempSignUpPassword.value,
          );
          debugPrint('emailAuth onHandleSignUp due success $success');

          if (success) {
            debugPrint('emailAuth onHandleSignUp if success $success');
          }
          final decClaimSet =
              verifyJwtHS256Signature(response as String, "jwtKey");

          var claimPerson = decClaimSet['pld'];
          debugPrint('parsedJson: $claimPerson\n');
          List<String> spec = List<String>.from(claimPerson['specialization']);
          person = Person(
              createdDate: DateTime.now().toString(),
              id: claimPerson['id'],
              firstName: claimPerson['firstName'],
              lastName: claimPerson['lastName'],
              phone: claimPerson['phone'],
              isCustomer: claimPerson['isCustomer'],
              isTrader: claimPerson['isTrader'],
              profileImagePathLocation: claimPerson['profileImagePathLocation'],
              specialization: spec);
          update();
          debugPrint('claimPerson: $person\n');

          await LocalStorage.setLoggedInUserToken(response as String);
          // await LocalStorage.setLoggedInUser(person.toString());
          // Get.to(ProfileScreen(), arguments: person);
          Get.to(const ValidationCodeScreen());
        }

        isLoading(false);
        update();
      } else {
        isLoading(false);
        formErrors.value = true;
        formErrorMessage.value = 'Form has empty fields, fill all fields';
      }
    } catch (e) {
      isLoading(false);

      formErrors.value = true;
      formErrorMessage.value = e.toString();
      debugPrint(e.toString());
    }
  }

  // Services
  Future<void> onLock() async {
    if (basicValidator.validateForm()) {
      loading = true;
      update();
      await Future.delayed(const Duration(seconds: 1));
      Get.toNamed('/dashboard');

      loading = false;
      update();
    }
  }

  void onResetPasswordPassword() {
    confirmPassword = !confirmPassword;
    update();
  }

  void onChangeShowPassword() {
    showPassword = !showPassword;
    update();
  }

  // Navigation
  void goToForgotPassword() {
    Get.toNamed('/auth/forgot_password');
  }

  void onHandleLogout() async {
    person = null;
    await LocalStorage.removeLoggedInUser();
    Get.offAll(const AccountSignInScreen());
  }

  void gotoRegister() {
    debugPrint('gotoRegister got clicked');
    Get.toNamed('/person_register');
  }

  void onShowPassword() {
    showPassword = !showPassword;
    update();
  }
}
