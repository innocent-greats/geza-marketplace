import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/auth/auth_controller.dart';
import 'package:geza_lite/controllers/main_controller.dart';
import 'package:geza_lite/controllers/storage/local_storage.dart';
import 'package:geza_lite/data/initiated_booking.dart';
import 'package:geza_lite/screens/booking_messaging_screen.dart';
import 'package:geza_lite/screens/dashboard/sliver_app_bar.dart';
import 'package:gezamarketplace_client/gezamarketplace_client.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CustomerServicesController extends MainController {
  final AuthController _authController = Get.find<AuthController>();
  var filteredBeautyStylistsStateSearchResults = <BeautyStylistsState>[].obs;
  var selectedStylist = Person(
    firstName: '',
    lastName: '',
    phone: '',
    createdDate: DateTime.now().toString(),
  ).obs;
  var stylist = Person(
    firstName: '',
    lastName: '',
    phone: '',
    createdDate: DateTime.now().toString(),
  ).obs;
  var stylistServices = <BeautyStyle>[].obs;
  int get stylistServicesTotal => stylistServices.length;
  int get totalFilteredBeautyStylistsStateSearchResults =>
      filteredBeautyStylistsStateSearchResults.length;

  var filteredTradersSearchResults = <Person>[].obs;
  int get totalFilteredTradersSearchResults =>
      filteredTradersSearchResults.length;
  @override
  void onInit() async {
    super.onInit();
    debugPrint('CustomerServicesController onInit()');
    selectedCard.value = typeList[0].toString();

    // listenForBeautyStylesUpdates();
    filteredSearchResults.value = beautyStyles;
    filteredTradersSearchResults.value = allTraders;
  }

  @override
  void onReady() {
    super.onReady();
    debugPrint("Main Controller onReady been called");
  }

  @override
  void onClose() {
    super.onClose();
    debugPrint("Main Controller onClose been called");
  }

  Future<void> searchStylistByFilteredSearch(beautyStyles) async {
    List<Person> filteredStylists = [];
    debugPrint("-----------------------------------");
    debugPrint(
      "search by  searchStylistByFilteredSearch $beautyStyles",
    );
    debugPrint("---------------------------------------");
    for (BeautyStyle style in beautyStyles) {
      for (var stylists in allTraders) {
        debugPrint("search by  stylist: $stylists");
        if (stylists.id == style.stylistId) {
          debugPrint(
              "Containeed stylist: ${stylists.id} ::: ${style.stylistId} ");
          var exists = filteredStylists.any((el) => el.id == stylists.id);
          if (exists == false) {
            filteredStylists.add(stylists);
          }

          filteredTradersSearchResults.value = filteredStylists;
        }
      }
      // break;
    }
    debugPrint(
      " Filtered Search $filteredStylists",
    );
    debugPrint("filteredStylists length: ${filteredStylists.length}");

    // filteredBeautyStylistsStateSearchResults.value = filteredStylists;
  }

  Future<void> searchStylesBySearchTerm(searchValue) async {
    debugPrint("-----------------------------------");
    debugPrint(
      "search by  searchTerm only $searchValue",
    );
    debugPrint("---------------------------------------");
    if (searchValue != '') {
      bool searchTermIsCity = false;
      bool searchTermIsArea = false;
      print('locations.length ${locations.length}');
      for (Province province in locations) {
        for (CityTown city in province.cities) {
          if (city.name.toLowerCase().contains(searchValue)) {
            searchTermIsCity = true;
          }
          for (Neighbourhood neighbourhood in city.neighbourhoods) {
            if (neighbourhood.name.toLowerCase().contains(searchValue)) {
              searchTermIsArea = true;
            }
          }
        }
      }
      debugPrint("---------------beautyStyles Start------------------------");
      debugPrint("${beautyStyles.length}");
      debugPrint("----------------beautyStyles End-----------------------");
      if (searchTermIsCity == true) {
        print('searchTermIsCity == true');
        var beautyStylesQuery = beautyStyles
            .where((item) => item.cityName.toLowerCase().contains(searchValue))
            .toList();
        print('beautyStylesQuery $beautyStylesQuery');
        if (beautyStylesQuery.isNotEmpty) {
          await searchStylistByFilteredSearch(beautyStylesQuery);
        } else {
          filteredTradersSearchResults.value = [];
        }
      }
      if (searchTermIsArea == true) {
        print('searchTermIsArea == true');

        await searchStylistByFilteredSearch(beautyStyles
            .where((item) =>
                item.neighbourhoodName.toLowerCase().contains(searchValue))
            .toList());
      }
      print('searchTermIs Name');

      await searchStylistByFilteredSearch(beautyStyles
          .where((item) => item.name.toLowerCase().contains(searchValue))
          .toList());
    } else {
      filteredTradersSearchResults.value = allTraders;
    }
  }

  updateSelectedIndexImage(String imagePath, int index) async {
    selectedIndexImage.value = imagePath;
    selectedImageIndex.value = index;
    update();
  }

  pickProfileImageFromLocalStorage(Person user) async {
    debugPrint('uploaded Profile user  $user');
    ImagePicker imagePicker = ImagePicker();
    List<XFile> xFiles = await imagePicker.pickMultiImage();
    if (xFiles.isNotEmpty) {
      xProfileImageFiles.addAll(xFiles);
      update();
      debugPrint('$xFiles');
      pickedProfileFile.value = File(xFiles[0].path.toString());
      debugPrint('pickProfileImageFromLocalStorage: user $user');
      debugPrint('pickedProfileFile $pickedProfileFile');
      debugPrint('pickedProfileFile xFiles Not Null ${xFiles[0].path}');

      isProfileImageAdded.value = true;
      await uploadProfileImage(user);
    }
  }

  uploadProfileImage(user) async {
    if (isProfileImageAdded.value) {
      debugPrint(
          'Profile Images Added in memory are ${xProfileImageFiles.length}');

      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('images');
      try {
        for (var xImage in xProfileImageFiles) {
          String imageFileName =
              DateTime.now().millisecondsSinceEpoch.toString();
          Reference referenceImageToUpload =
              referenceDirImages.child(imageFileName);
          debugPrint('Profile Xfile loaded ${File(xImage.path)}');
          await referenceImageToUpload.putFile(File(xImage.path));
          // success
          var uploadedImageUrl = await referenceImageToUpload.getDownloadURL();
          debugPrint('Profile uploaded Image Url  $uploadedImageUrl');

          // user data
          debugPrint('uploading Profile for user  $user');

          uploadedProfileImage.value = ProfileImages(
              personId: user.id as int, pathLocation: uploadedImageUrl);
          xProfileImageFiles.value = [];
          update();

          debugPrint('uploaded Profile Image  ${uploadedProfileImage.value}');

          user.profileImagePathLocation = uploadedImageUrl;
          var response = await client.person.updatePerson(user);
          debugPrint('client.person.updatePerson  response $response');
          if (response == true) {
            Person? person = await LocalStorage.getUserToken();
            if (person != null) {
              await LocalStorage.removeUserToken();
              _authController.onLogin(person.phone);
            } else {
              _authController.onHandleLogout();
            }
          }
        }
        update();
      } catch (e) {
        debugPrint('Profile catched errors $e');
      }
    }
    update();
  }

  pickImageFromLocalStorage() async {
    ImagePicker imagePicker = ImagePicker();
    List<XFile> xFiles = await imagePicker.pickMultiImage();
    if (xFiles.isNotEmpty) {
      xImageFiles.addAll(xFiles);
      debugPrint('$xFiles');
      pickedFile = File(xFiles[0].path.toString());
      debugPrint('pickedFile $pickedFile');
      debugPrint('xFiles Not Null ${xFiles[0].path}');
      isImageAdded = true;
      update();
    }
    update();
  }

  uploadImageFromLocalStorage() async {
    if (isImageAdded) {
      debugPrint('Images Added in memory are ${xImageFiles.length}');

      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('images');
      try {
        for (var xImage in xImageFiles) {
          String imageFileName =
              DateTime.now().millisecondsSinceEpoch.toString();
          Reference referenceImageToUpload =
              referenceDirImages.child(imageFileName);
          debugPrint('Xfile loaded ${xImage.path}');
          await referenceImageToUpload.putFile(File(xImage.path));
          // success
          var uploadedImageUrl = await referenceImageToUpload.getDownloadURL();
          debugPrint('uploaded Image Url  $uploadedImageUrl');

          uploadedImages
              .add(Images(uploaderId: 0, pathLocation: uploadedImageUrl));
          update();
        }
        update();
      } catch (e) {
        debugPrint('catched errors $e');
      }
    }

    update();
  }

  getStyle(int? id) async {
    var style = beautyStyles.firstWhereOrNull((item) => item.id == id);
    debugPrint(' getStyle in ComId $style');
    Get.toNamed(
      '/styleDetail',
      arguments: style,
    );
  }

  setSelectedStylist(int? id) async {
    selectedStylist.value =
        allTraders.firstWhereOrNull((item) => item.id == id)!;
  }

  void getStylistServices(int? id) async {
    debugPrint("getStylistServices for ID: $id");
    debugPrint("getStylistServices for ID from beautyStyles: $beautyStyles");

    stylistServices.value =
        beautyStyles.where((item) => item.stylistId == id).toList();
    debugPrint(' getStyle in ComId ${stylistServices}');
  }

  onUpdateStyle(BeautyStyle style) async {
    debugPrint("onUpdateStyle method called");
    isLoading(true);
    update();
    try {
      var res = await client.beautyStyle.updateBeautyStyle(style);
      debugPrint("onUpdateStyle res is: $res");

      if (res) {
        Get.toNamed('/myWarehouse');
      }
    } on Exception catch (e) {
      debugPrint('server had an error');
      debugPrint(e.toString());
    }
    isLoading(false);
    update();
  }

  void onSelectServiceCategory(String? value) async {
    debugPrint("onSelectServiceCategory Controller value $value");

    selectedCard.value = value!;
  }

  void onInitiateBooking(
      String _character,
      DateTime selectedDate,
      String selectedTime,
      int? beautyStyleId,
      int? stylistId,
      String beautyStyleName,
      double? beautyStyleAmount) async {
    debugPrint("onInitiateBooking beautyStyleId $beautyStyleId");
    initiatedBooking = InitiatedBooking(
      selectedDate: selectedDate.toString(),
      selectedTime: selectedTime,
      customerId: _authController.person!.id as int,
      customerType: _authController.person!.firstName,
      vendorId: stylistId as int,
      beautyStyleId: beautyStyleId as int,
      beautyStyleName: beautyStyleName,
      beautyStyleAmount: beautyStyleAmount as double,
    );
    debugPrint("Booking ${initiatedBooking.selectedTime}");
  }

  void submitBooking() async {
    debugPrint("submitBooking submitBooking $initiatedBooking");
    final BookingOrderCreateMessage request = BookingOrderCreateMessage(
        dateCreated: DateTime.now(),
        selectedDate: initiatedBooking.selectedDate,
        selectedTime: initiatedBooking.selectedTime,
        customerId: initiatedBooking.customerId,
        customerType: initiatedBooking.customerType,
        vendorId: initiatedBooking.vendorId,
        beautyStyleId: initiatedBooking.beautyStyleId);
    await client.booking.sendStreamMessage(request);
    Get.to(const SliverAppBarScreen());
    isLoading.value = false;
    update();
    debugPrint("Booking ${initiatedBooking.selectedTime}");
  }
}
