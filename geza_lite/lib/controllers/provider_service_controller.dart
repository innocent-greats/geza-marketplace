import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:geza_lite/controllers/auth/auth_controller.dart';
import 'package:geza_lite/controllers/main_controller.dart';
import 'package:geza_lite/screens/drawer/service_list_screen.dart';
import 'package:gezamarketplace_client/gezamarketplace_client.dart';
import 'package:image_picker/image_picker.dart';

final storageRef = FirebaseStorage.instance.ref();

class ProviderServicesController extends MainController {
  final AuthController _authController = Get.find<AuthController>();
  FilePickerResult? filePickerResult;
  late Uint8List fileBytes;
  var accountServices = <BeautyStyle>[].obs;
  int get totalAccountServices => accountServices.length;
  var accountMessages = <BeautyStyle>[].obs;
  int get totalAccountMessages => accountMessages.length;
  var marketPlaceBeautyStyles = <BeautyStyle>[].obs;
  int get totalMarketPlaceBeautyStyles => marketPlaceBeautyStyles.length;

  @override
  void onInit() async {
    super.onInit();
    debugPrint('ProviderServicesController onInit()');
    await listenForBookingMessages();
    selectedCard.value = typeList[0].toString();
    await getAllBusinessAccountBeautyStyles();
  }

  @override
  void onReady() {
    super.onReady();
    debugPrint("onReady been called");
  }

  @override
  void onClose() {
    super.onClose();
    debugPrint("onClose been called");
  }

  respondToBookingOrderRequest(String response) async {
    try {
      BookingOrder? bookingOrder =
          await client.booking.getBookingOrder(bookingOrderChat.value.orderId);
      if (response == 'accept') {
        bookingOrder?.orderStatus = 'accepted';
        await client.booking.updateBookingOrder(bookingOrder!);
        var order = SaleOrder(
            bookingOrderId: bookingOrder.id as int,
            orderType: 'sale-order',
            orderedItem: bookingOrderChat.value.orderedItem,
            orderBookedTime: bookingOrder.selectedTime,
            orderBookedDate: bookingOrder.selectedDate,
            customer: bookingOrderChat.value.customer,
            orderingFor: bookingOrder.customerType,
            vendor: bookingOrderChat.value.vendor,
            customerId: bookingOrderChat.value.customerId,
            vendorId: bookingOrderChat.value.vendorId);
        await client.sales.createOrder(order);

        ChatMessage newChat = ChatMessage(
            bookingChatId: bookingOrderChat.value.id as int,
            senderId: bookingOrder.vendorId,
            sender: bookingOrderChat.value.vendor,
            reciever: bookingOrderChat.value.customer,
            recieverId: bookingOrder.customerId,
            message:
                'Booking for ${bookingOrder.selectedDate} , ${bookingOrder.selectedTime} accepted.',
            dateCreated: DateTime.now());

        BookingMessage newBookingMessage = BookingMessage(
            bookingChatId: bookingOrderChat.value.id as int,
            chatMessage: newChat);
        await client.booking.sendStreamMessage(newBookingMessage);
        currentChatBookingMessages.add(newBookingMessage);
        bookingMessages.add(newBookingMessage);
        bookingOrderChat.value.chatStatus = 'accepted';
        bookingOrderChat.refresh();
      }
      if (response == 'reject') {
        bookingOrder?.orderStatus = 'rejected';
        await client.booking.updateBookingOrder(bookingOrder!);
        ChatMessage newChat = ChatMessage(
            bookingChatId: bookingOrderChat.value.id as int,
            senderId: bookingOrder.vendorId,
            sender: bookingOrderChat.value.vendor,
            reciever: bookingOrderChat.value.customer,
            recieverId: bookingOrder.customerId,
            message:
                'Booking for ${bookingOrder.selectedDate} , ${bookingOrder.selectedTime} rejected.',
            dateCreated: DateTime.now());

        BookingMessage newBookingMessage = BookingMessage(
            bookingChatId: bookingOrderChat.value.id as int,
            chatMessage: newChat);
        await client.booking.sendStreamMessage(newBookingMessage);
        currentChatBookingMessages.add(newBookingMessage);
        bookingMessages.add(newBookingMessage);
        bookingOrderChat.value.chatStatus = 'rejected';
        bookingOrderChat.refresh();
      }
      // await clie
      if (response == 'confirm') {
        bookingOrder?.orderStatus = 'confirm';
        SaleOrder? saleOrder =
            await client.sales.getSaleOrder(bookingOrder?.id as int);
        saleOrder!.orderStatus = 'confirmed';
        await client.sales.updateSaleOrder(saleOrder);
        ChatMessage newChat = ChatMessage(
            bookingChatId: bookingOrderChat.value.id as int,
            senderId: bookingOrder!.customerId,
            sender: bookingOrderChat.value.customer,
            reciever: bookingOrderChat.value.vendor,
            recieverId: bookingOrder.vendorId,
            message:
                'Order for ${bookingOrder.selectedDate} , ${bookingOrder.selectedTime} confirmed.',
            dateCreated: DateTime.now());

        BookingMessage newBookingMessage = BookingMessage(
            bookingChatId: bookingOrderChat.value.id as int,
            chatMessage: newChat);
        await client.booking.sendStreamMessage(newBookingMessage);
        debugPrint(
            'bookingOrderChat.value.chatStatus ${bookingOrderChat.value.chatStatus}');
        currentChatBookingMessages.add(newBookingMessage);
        bookingMessages.add(newBookingMessage);
        bookingOrderChat.value.chatStatus = 'confirmed';
        bookingOrderChat.refresh();
      }
      if (response == 'cancel') {
        bookingOrder?.orderStatus = 'cancel';
        SaleOrder? saleOrder =
            await client.sales.getSaleOrder(bookingOrder?.id as int);
        saleOrder!.orderStatus = 'cancel';
        ChatMessage newChat = ChatMessage(
            bookingChatId: bookingOrderChat.value.id as int,
            senderId: bookingOrder!.customerId,
            sender: bookingOrderChat.value.customer,
            reciever: bookingOrderChat.value.vendor,
            recieverId: bookingOrder.vendorId,
            message:
                'Booking for ${bookingOrder.selectedDate} , ${bookingOrder.selectedTime} cancelled.',
            dateCreated: DateTime.now());

        BookingMessage newBookingMessage = BookingMessage(
            bookingChatId: bookingOrderChat.value.id as int,
            chatMessage: newChat);
        await client.booking.sendStreamMessage(newBookingMessage);
        currentChatBookingMessages.add(newBookingMessage);
        bookingMessages.add(newBookingMessage);
        bookingOrderChat.value.chatStatus = 'cancelled';
        bookingOrderChat.refresh();
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<void> getAllBusinessAccountBeautyStyles() async {
    debugPrint('getUserBusinessAccount admin id ${_authController.person!.id}');
    try {
      var biz = await client.beautyStyle
          .getAccountBeautyStyles(_authController.person!.id as int);
      accountServices.value = biz;
      debugPrint('accountServices $accountServices');
    } catch (e) {
      debugPrint('getAllBusinessAccountBeautyStyles catch $e');
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

  getImageorVideoFromGallery() async {
    filePickerResult = await FilePicker.platform.pickFiles(
      withData: true,
    );
    if (filePickerResult != null) {
      debugPrint('filePickerResult $filePickerResult');
      debugPrint(
          'isEmpty ${(filePickerResult!.files.single.bytes ?? []).isEmpty}');
      file = File.fromUri(Uri.parse(filePickerResult!.files.single.path!));
      debugPrint('getImageorVideoFromGallery file $file');
      fileBytes = file.readAsBytesSync();
      debugPrint('getImageorVideoFromGallery fileBytes $fileBytes');
      update();
      pickedFile = File(file.path.toString());
      debugPrint('getImageorVideoFromGallery pickedFile $pickedFile');

      isImageAdded = true;
      update();
// filePickerResult!.files.single.extension == 'mp4'
    } else {
      // perform some action etc
    }
  }

  void onSelectServiceCategory(String? value) async {
    debugPrint("onSelectServiceCategory Controller value $value");

    selectedCard.value = value!;
  }

  onUpdateStyle(BeautyStyle style) async {
    debugPrint("onUpdateStyle method called");
    isLoading(true);
    update();
    try {
      // delete(person, person);
      var res = await client.beautyStyle.updateBeautyStyle(style);
      debugPrint("onUpdateStyle res is: $res");

      if (res) {
        Get.toNamed('/myWarehouse');
      }
    } on Exception catch (e) {
      debugPrint('server had an error');
      debugPrint(e.toString());
    }
    // Get.to(SignUpScreen());
    isLoading(false);
    update();
  }

  Future<void> onCreateStyle(String category, String name, double price,
      String neighbourhood, String city) async {
    try {
      isLoading(true);
      var request = BeautyStyle(
        dateAdded: DateTime.now().toString(),
        stylistId: _authController.person!.id,
        name: name,
        category: selectedCard.value,
        neighbourhoodName: _authController.selectedNeighbourhood.value,
        cityName: _authController.selectedCity.value,
        description: '',
        amount: price,
        images: [],
      );
      debugPrint('on Create Service Provider Account $request');
      var response = await client.beautyStyle.createBeautyStyle(request);
      debugPrint('onCreateStyle response $response');

      isLoading(false);
      if (response == null) {
      } else {
        var data = jsonDecode(response);
        debugPrint('onCreateStyle data $data');
        var beautyStyle = BeautyStyle(
            dateAdded: data["dateAdded"],
            name: data["name"],
            category: data["category"],
            cityName: data["cityName"],
            images: [],
            neighbourhoodName: data["neighbourhoodName"]);
        beautyStyles.add(beautyStyle);
        // var path = filePickerResult!.files[0].name.toString();
        // debugPrint('uploadDescription $path');
        Get.to(const ServiceListScreen());
      }

      isLoading(false);
      update();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<List<BookingMessage>> getBookingMessages(int bookingChatId) async {
    List<BookingMessage> bookingMesages = bookingMessages
        .where((chatMessage) => chatMessage.bookingChatId == bookingChatId)
        .toList();
    currentChatBookingMessages.value = bookingMesages;
    debugPrint('on Publish NewStyle request $bookingMesages');
    return bookingMesages;
  }

  void getOrderChats(int? id) async {
    debugPrint("getOrderChats for ID: $id");
    bookingOrderChat.value = bookingOrderChats
        .firstWhereOrNull((bookingOrderChat) => bookingOrderChat.id == id)!;
    debugPrint(' getOrderChats in ComId $bookingOrderChat');
  }

  Future<void> sendMessage(BookingMessage message) async {
    currentChatBookingMessages.add(message);
    bookingMessages.add(message);
    await client.booking.sendStreamMessage(message);
  }

  Future<void> onPublishNewStyle(
    String category,
    String name,
    double price,
  ) async {
    try {
      isLoading(true);
      await uploadImageFromLocalStorage();
      debugPrint(
          'IMAGE RESOURCE SERVICE:::::::::: uploaded Images From LocalStorage ${uploadedImages}');
      debugPrint(
          'IMAGE RESOURCE SERVICE:::::::::: uploaded Images From LocalStorage ${uploadedImages.length}');
      final BeautyStyleCreateMessage request = BeautyStyleCreateMessage(
        stylistId: _authController.person!.id,
        name: name.toLowerCase(),
        category: category.toLowerCase(),
        neighbourhoodName:
            _authController.selectedNeighbourhood.value.toLowerCase(),
        cityName: _authController.selectedCity.toLowerCase(),
        description: '',
        amount: price,
        images: uploadedImages.isNotEmpty ? uploadedImages : [],
      );
      debugPrint('on Publish NewStyle request $request');

      await client.beautyStyle.sendStreamMessage(request);
      await getAllBusinessAccountBeautyStyles();
      xImageFiles = [];
      isLoading.value = false;
      update();
      Get.to(const ServiceListScreen());
      isLoading(false);
      update();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
