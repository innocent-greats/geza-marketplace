import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/auth/auth_controller.dart';
import 'package:gezamarketplace_client/gezamarketplace_client.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const String _loggedInUserKey = "user";
  static const String _languageKey = "lang_code";

  static SharedPreferences? _preferencesInstance;

  static SharedPreferences get preferences {
    if (_preferencesInstance == null) {
      throw ("Call LocalStorage.init() to initialize local storage");
    }
    return _preferencesInstance!;
  }

  static Future<void> init() async {
    _preferencesInstance = await SharedPreferences.getInstance();
    await initData();
  }

  static Future<void> initData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Get.put(AuthController()).isLoggedIn.value =
        preferences.getBool(_loggedInUserKey) ?? false;
  }

  static Future<bool> setAuthenticatedUser(Person user) {
    return preferences.setString("authUser", user.toString());
  }

  static Person? getAuthenticatedUser() {
    var storedData = preferences.getString("authUser");
    if (storedData != null) {
      var user = jsonDecode(preferences.getString("authUser") as String);
      List<String> spec = List<String>.from(user['specialization']);

      var person = Person(
        createdDate: user['createdDate'],
        id: user['id'],
        firstName: user['firstName'],
        lastName: user['lastName'],
        phone: user['phone'],
        profileImagePathLocation: user['profileImagePathLocation'],
        isTrader: user['isTrader'],
        isCustomer: user['isCustomer'],
        specialization: spec,
      );
      debugPrint('onLogin token $person');
      return person;
    } else {
      removeLoggedInUser();
    }
    return null;
  }

  static Future<bool> setLoggedInUserToken(String token) async {
    return preferences.setString("authToken", token);
  }

  static Future<Person?> getUserToken() async {
    debugPrint('getUserToken token ${preferences.getString("authToken")}');
    var storedData = preferences.getString("authToken");
    debugPrint('storedData token $storedData');

    if (storedData != null) {
      final decClaimSet = verifyJwtHS256Signature(storedData, "jwtKey");

      var claimPerson = decClaimSet['pld'];
      debugPrint('parsedJson: $claimPerson\n');
      List<String> spec = List<String>.from(claimPerson['specialization']);
      var person = Person(
          createdDate: claimPerson['createdDate'],
          id: claimPerson['id'],
          firstName: claimPerson['firstName'],
          lastName: claimPerson['lastName'],
          phone: claimPerson['phone'],
          isCustomer: claimPerson['isCustomer'],
          isTrader: claimPerson['isTrader'],
          profileImagePathLocation: claimPerson['profileImagePathLocation'],
          specialization: spec);
      return person;
    } else {
      return null;
    }
  }

  static Future<bool> setLoggedInUser(String loggedInUser) async {
    preferences.setString("authUser", loggedInUser.toString());
    return preferences.setBool(_loggedInUserKey, true);
  }

  static Future<bool> removeLoggedInUser() async {
    await preferences.remove("authUser");
    await preferences.remove("authToken");
    await preferences.remove(_loggedInUserKey);
    var cleared = await preferences.clear();
    debugPrint('App Storage Cleared $cleared');

    return cleared;
  }

  static Future<bool> removeUserToken() async {
    return preferences.remove("authToken");
  }

  static String? getLanguage() {
    return preferences.getString(_languageKey);
  }

  Future<void> resetStorage() async {
    await preferences.clear();
  }

  // void storeAccountCommodities(List<Commodity> commodities) {
  //   preferences.setString('commodities', commodities.toString());
  // }

  // void readAccountCommodities(Commodity commodity) {
  //   preferences.getString('commodity');
  // }

  // void writeSelectedOrder(ServiceOrder order) async {
  //   var oderID = order.commodityId;
  //   debugPrint('storeSelectedOrder $oderID');

  //   preferences.setString('selectedOrder', order.toString());
  // }

  static readSelectedOrder() {
    debugPrint('readSelectedOrder from Storage');

    final order = jsonDecode(preferences.getString('selectedOrder') as String);
    if (order != null) {
      var oderID = order.id;
      debugPrint('readSelectedOrder $oderID');
      return order;
    } else {
      return null;
    }
  }

  static Future<void> removeSelectedOrder(String selectedOrder) async {
    final order = jsonDecode(preferences.getString('selectedOrder') as String);
    if (order != null) {
      var oderID = order.commodityId;
      debugPrint('readSelectedOrder $oderID');
      await preferences.remove(selectedOrder);
      debugPrint('removed Selected Order');
    }
  }
}
