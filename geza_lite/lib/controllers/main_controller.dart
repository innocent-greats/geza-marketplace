import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/data/initiated_booking.dart';
import 'package:geza_lite/firebase_options.dart';
import 'package:image_picker/image_picker.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:gezamarketplace_client/gezamarketplace_client.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class MainController extends GetxController {
  late SessionManager sessionManager;
  var isServerLive = false.obs;
  Client client = Client(
    'http://10.0.2.2:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  // var client = Client('http://10.0.2.2:8080/')

  late final StreamingConnectionHandler connectionHandler;

  String? resultMessage;
  String? errorMessage;
  // final CustomerServicesController servicesController = Get.put(CustomerServicesController());
  List<Province> locations = <Province>[
    Province(
      name: 'bulawayo',
      cities: <CityTown>[
        CityTown(name: 'bulawayo', neighbourhoods: <Neighbourhood>[
          (Neighbourhood(
              name: 'nketa',
              coordinates: Coordinates(
                  latitude: '-20.2009487', longitude: '28.5301850'))),
          (Neighbourhood(
              name: 'nkulumane',
              coordinates: Coordinates(
                  latitude: '-20.1811821', longitude: '28.5301850'))),
          (Neighbourhood(
              name: 'newton',
              coordinates: Coordinates(
                  latitude: '-20.2219338', longitude: '28.5725030'))),
        ]),
      ],
    ),
    Province(
      name: 'harare',
      cities: <CityTown>[
        CityTown(name: 'harare', neighbourhoods: <Neighbourhood>[
          (Neighbourhood(
              name: 'Eastlea',
              coordinates: Coordinates(
                  latitude: '-17.8175606', longitude: '31.0693400'))),
          (Neighbourhood(
              name: 'tynwald south',
              coordinates: Coordinates(
                  latitude: '-17.8063929', longitude: '30.9446058'))),
          (Neighbourhood(
              name: 'borrowdale brook',
              coordinates: Coordinates(
                  latitude: '-17.7163942', longitude: '31.1424001')))
        ])
      ],
    ),
    Province(
      name: 'manicaland',
      cities: <CityTown>[
        CityTown(name: 'mutare', neighbourhoods: <Neighbourhood>[
          (Neighbourhood(
              name: 'chikanga',
              coordinates: Coordinates(
                  latitude: '-18.9706980', longitude: '32.6362231'))),
        ]),
        CityTown(name: 'chipinge', neighbourhoods: <Neighbourhood>[
          (Neighbourhood(
              name: 'ward 1',
              coordinates: Coordinates(
                  latitude: '-20.1857337', longitude: '32.6291585'))),
        ]),
        CityTown(name: 'chimanimani', neighbourhoods: <Neighbourhood>[
          (Neighbourhood(
              name: 'ward 1',
              coordinates: Coordinates(
                  latitude: '-20.1857337', longitude: '32.6291585'))),
        ]),
        CityTown(name: 'rusape', neighbourhoods: <Neighbourhood>[
          (Neighbourhood(
              name: 'vhengere',
              coordinates: Coordinates(
                  latitude: '-18.5473954', longitude: '32.119246'))),
        ])
      ],
    )
  ];

  List populatedCities = [
    {'name': "Harare", 'class': 1},
    {'name': "Bulawayo", 'class': 2},
    {'name': "Chitungwiza", 'class': 3},
    {'name': "Mutare", 'class': 4},
    {'name': "Gweru", 'class': 5},
    {'name': "Epworth", 'class': 6},
    {'name': "Kwekwe", 'class': 7},
    {'name': "Kadoma", 'class': 8},
    {'name': "Masvingo", 'class': 9},
    {'name': "Chinhoyi", 'class': 10},
    {'name': "Marondera", 'class': 11},
    {'name': "Norton", 'class': 12},
    {'name': "Chegutu", 'class': 13},
    {'name': "Bindura", 'class': 14},
    {'name': "Zvishavane", 'class': 15},
    {'name': "Victoria Falls", 'class': 16},
    {'name': "Hwange", 'class': 17},
    {'name': "Redcliff", 'class': 18},
    {'name': "Rusape", 'class': 19},
    {'name': "Chiredzi", 'class': 20},
    {'name': "Beitbridge", 'class': 21},
    {'name': "Kariba", 'class': 22},
    {'name': "Karoi", 'class': 23},
    {'name': "Gokwe", 'class': 24},
    {'name': "Chipinge", 'class': 25},
    {'name': "Shurugwi", 'class': 26},
    {'name': "Gwanda", 'class': 27},
    {'name': "Mashava", 'class': 28},
    {'name': "Murewa", 'class': 29},
    {'name': "Raffingora", 'class': 30},
    {'name': "Plumtree", 'class': 31},
    {'name': "Nkayi", 'class': 32},
    {'name': "Banket", 'class': 33},
    {'name': "Inyati", 'class': 34},
    {'name': "Mvurwi", 'class': 35},
    {'name': "Penhalonga", 'class': 36},
    {'name': "Shamva", 'class': 37},
    {'name': "Mvuma", 'class': 38},
    {'name': "Insiza", 'class': 39},
    {'name': "Murambinda", 'class': 40},
    {'name': "Nyika", 'class': 41},
  ].obs;

  List listToSearch = [
    {'name': 'Amir', 'class': 12},
    {'name': 'Raza', 'class': 11},
    {'name': 'Praksh', 'class': 10},
    {'name': 'Nikhil', 'class': 9},
    {'name': 'Sandeep', 'class': 8},
    {'name': 'Tazeem', 'class': 7},
    {'name': 'Najaf', 'class': 6},
    {'name': 'Izhar', 'class': 5},
  ];

  var selected;
  late List selectedList;
  var populatedNeighbourhoods = <Neighbourhood>[].obs;
  List<String> typeList = ['Hair Care', 'Skin & Nail Care', 'Product'].obs;
  var selectedCard = ''.obs;
  var selectedItemId = 0.obs;
  var selectedIndexImage = ''.obs;
  var selectedImageIndex = 0.obs;
  var searchItem = ''.obs;
  var searchItemCategory = ''.obs;
  var searchCity = ''.obs;
  var searchNeighbourhood = ''.obs;
  var isLoading = false.obs;
  var showSearch = false.obs;
  var searchByLocation = false.obs;
  var requestGrading = false.obs;
  var walletBalance = 0.0.obs;
  var loanDebtBalance = 0.0.obs;
// filteredSearchResults

  var filteredSearchResults = <BeautyStyle>[].obs;
  int get totalFilteredSearchResults => filteredSearchResults.length;
  var initiatedBooking = InitiatedBooking(
    beautyStyleId: 0,
    customerType: '',
    customerId: 0,
    selectedDate: '',
    selectedTime: '',
    vendorId: 0,
    beautyStyleName: '',
    beautyStyleAmount: 0.0,
  );
  var selectedBeautyStyle = BeautyStyle(
      name: '',
      category: '',
      cityName: '',
      neighbourhoodName: '',
      dateAdded: DateTime.now().toString(),
      images: []).obs;
  var beautyStylistsState = <BeautyStylistsState>[].obs;
  int get totalBeautyStylistsState => beautyStylistsState.length;
  var stylists = <Person>[].obs;
  int get totalStylists => stylists.length;
  var beautyStyles = <BeautyStyle>[].obs;
  int get totalBeautyStyles => beautyStyles.length;
  var hairStyles = <BeautyStyle>[].obs;
  int get totalHairStyles => hairStyles.length;
  var skinFacialServices = <BeautyStyle>[].obs;
  int get totalskinFacialServices => skinFacialServices.length;
  var beautyProducts = <BeautyStyle>[].obs;
  int get totalbeautyProducts => beautyProducts.length;

  // TRADERS
  var allTraders = <Person>[].obs;
  int get totalAllTraders => allTraders.length;
  var hairStylists = <Person>[].obs;
  int get totalHairStylists => hairStylists.length;
  var cosmetologists = <Person>[].obs;
  int get totalCosmetologists => cosmetologists.length;
  var productsSellers = <Person>[].obs;
  int get totalProductsSellers => productsSellers.length;
  XFile? Xfile;

  var xProfileImageFiles = <XFile>[].obs;
  List<XFile> xImageFiles = [];
  File? pickedFile;
  List<File>? pickedFiles = [];
  String uploadedImageUrl = '';
  var uploadedProfileImage = ProfileImages(personId: 0, pathLocation: '').obs;
  var uploadedImages = <Images>[];
  bool isImageAdded = false;
  var isProfileImageAdded = false.obs;
  var pickedProfileFile = File('').obs;
  late File file;

  var newBookingOrder = BookingOrder(
          selectedDate: '',
          selectedTime: '',
          customerId: 0,
          customerType: '',
          vendorId: 0,
          beautyStyleId: 0,
          dateCreated: DateTime.now())
      .obs;
  var newBookingOrders = <BookingOrder>[].obs;
  int get totalNewBookingOrders => newBookingOrders.length;
  late Person? person = Person(
    firstName: '',
    lastName: '',
    accountType: '',
    phone: '',
    createdDate: DateTime.now().toString(),
  );

  var bookingOrderChat = BookingOrderChat(
          orderedItem: BeautyStyle(
              name: '',
              category: '',
              cityName: '',
              neighbourhoodName: '',
              dateAdded: DateTime.now().toString(),
              images: []),
          chatDate: DateTime.now(),
          orderDate: DateTime.now(),
          orderId: 0,
          customer: Person(
            firstName: '',
            lastName: '',
            accountType: '',
            phone: '',
            createdDate: DateTime.now().toString(),
          ),
          vendor: Person(
            firstName: '',
            lastName: '',
            accountType: '',
            phone: '',
            createdDate: DateTime.now().toString(),
          ),
          customerId: 0,
          vendorId: 0,
          chatStatus: '',
          messages: <BookingMessage>[].obs)
      .obs;
  var bookingOrderChats = <BookingOrderChat>[].obs;
  int get totalBookingOrderChats => bookingOrderChats.length;

  var chatMessage = ChatMessage(
          bookingChatId: 0,
          senderId: 0,
          sender: Person(
            firstName: '',
            lastName: '',
            phone: '',
            createdDate: DateTime.now().toString(),
          ),
          recieverId: 0,
          reciever: Person(
            firstName: '',
            lastName: '',
            phone: '',
            createdDate: DateTime.now().toString(),
          ),
          message: '',
          dateCreated: DateTime.now())
      .obs;
  var chatMessages = <ChatMessage>[].obs;
  int get totalChatMessage => chatMessages.length;

  var bookingMessage = BookingMessage(
          bookingChatId: 0,
          chatMessage: ChatMessage(
              bookingChatId: 0,
              senderId: 0,
              sender: Person(
                firstName: '',
                lastName: '',
                phone: '',
                createdDate: DateTime.now().toString(),
              ),
              recieverId: 0,
              reciever: Person(
                firstName: '',
                lastName: '',
                phone: '',
                createdDate: DateTime.now().toString(),
              ),
              message: '',
              dateCreated: DateTime.now()))
      .obs;
  var bookingMessages = <BookingMessage>[].obs;
  int get totalBookingMessage => bookingMessages.length;

  var currentChatBookingMessages = <BookingMessage>[].obs;
  int get totalCurrentChatBookingMessages => currentChatBookingMessages.length;

  @override
  void onInit() async {
    super.onInit();
    connectionHandler = StreamingConnectionHandler(
        client: client,
        listener: (connectionState) {
          debugPrint('${connectionState.status}');
        });
    connectionHandler.connect();
    sessionManager = SessionManager(
      caller: client.modules.auth,
    );
    await sessionManager.initialize();
    // servicesController.onInit();
    sessionManager.addListener(changedSessionStatus);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await _callAPiServer();
    await listenForTradersStream();
    await listenForStreamUpdates();
    debugPrint("beautyStyles called ${beautyStyles.length}");
    debugPrint("beautyStyles called $beautyStyles");
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

  _callAPiServer() async {
    try {
      final result = await client.example.hello('Geza is Live');
      resultMessage = result;
      debugPrint("Server Responded:  $result");

      update();
    } on Exception catch (e) {
      errorMessage = '$e';
      debugPrint("Server Exception:  $e");
      update();
    }
  }

  void changedSessionStatus() {
    // setState(() {});
  }

// listenForTradersStream
  Future<void> listenForTradersStream() async {
    // debugPrint("Customer listen For Traders Stream:  $beautyStylists");

    await for (var message in client.beautyStyle.stream) {
      debugPrint("Stream listen for all messages");

      if (message is BeautyStylistsStateMessage) {
        beautyStylistsState.value = message.beautyStylists;
        for (var item in message.beautyStylists) {
          // debugPrint("message.beautyStyle item:  $item");
          allTraders.add(item.stylist);
          if (item.stylist.specialization!.contains('hairstyling')) {
            hairStylists.value = [...hairStylists, item.stylist];
          }
          if (item.stylist.specialization!.contains('cosmetic treatments')) {
            cosmetologists.value = [...cosmetologists, item.stylist];
          }
          if (item.stylist.specialization!.contains('products store')) {
            productsSellers.value = [...productsSellers, item.stylist];
          }
        }
      }

      if (message is BeautyStyleStateMessage) {
        for (var item in message.beautyStyles) {
          beautyStyles.value = [...beautyStyles, item];
          if (item.category == 'hair care') {
            hairStyles.value = [...hairStyles, item];
          }
          if (item.category == 'skin & nail Care') {
            skinFacialServices.value = [...skinFacialServices, item];
          }
          if (item.category == 'product') {
            beautyProducts.value = [...beautyProducts, item];
          }
        }
        debugPrint(
            'BeautyStyleStateMessage total styles ${beautyStyles.length}');
        // debugPrint(
        //     "Stream all services in the marketplace ended:  $beautyStyles.value ");
      }
    }
  }

  Future<void> listenForStreamUpdates() async {
    debugPrint("Customer listen For Beauty Styles Stream Updates");

    await for (var message in client.beautyStyle.stream) {
      if (message is BeautyStyleAppendMessage) {
        // debugPrint("message.beautyStyle:  ${message.beautyStyle}");
        beautyStyles.value = [...beautyStyles, message.beautyStyle];
        if (message.beautyStyle.category == 'hair care') {
          hairStyles.value = [...hairStyles, message.beautyStyle];
        }
        if (message.beautyStyle.category == 'skin & nail Care') {
          skinFacialServices.value = [
            ...skinFacialServices,
            message.beautyStyle
          ];
        }
        if (message.beautyStyle.category == 'product') {
          beautyProducts.value = [...beautyProducts, message.beautyStyle];
        }
      }
    }
  }

  Future<void> listenForBookingMessages() async {
    debugPrint("listen For Booking Messages Method");

    await for (var message in client.booking.stream) {
      debugPrint("Booking Stream Message $message");
      if (message is BookingOrderChatAppendMessage) {
        bookingOrderChats.value = [
          ...bookingOrderChats,
          message.bookingOrderChat
        ];
        debugPrint(
            "Booking Order Chat Append Message ${message.bookingOrderChat.messages}");
      }

      if (message is AppendBookingMessage) {
        debugPrint("Booking Message $message");
        var bookingChatOrder = bookingOrderChats.firstWhereOrNull((orderChat) =>
            orderChat.id == message.bookingMessage.bookingChatId);
        if (bookingChatOrder != null) {
          debugPrint(
              "ADDED MESSAGE FROM STREAM ${message.bookingMessage.chatMessage}");
          bookingChatOrder.messages = [
            ...bookingChatOrder.messages,
            message.bookingMessage
          ];

          bookingOrderChats[bookingOrderChats.indexWhere(
                  (orderChat) => orderChat.id == bookingChatOrder.id)] =
              bookingChatOrder;

          var bookingMesages = currentChatBookingMessages.firstWhereOrNull(
              (chatMessage) =>
                  chatMessage.bookingChatId ==
                  message.bookingMessage.bookingChatId);

          if (bookingMesages != null) {
            debugPrint("----------------------------------------");
            debugPrint(
                "currentChatBookingMessages bookingMesages $bookingMesages");
            debugPrint("----------------------------------------");

            currentChatBookingMessages.value = [
              ...currentChatBookingMessages,
              message.bookingMessage
            ];
            currentChatBookingMessages[currentChatBookingMessages.indexWhere(
                    (orderChat) => orderChat.id == bookingChatOrder.id)] =
                bookingMesages;
          }
        } else {
          BookingOrderChat? bookingChatOrder = await client.booking
              .getBookingOrderChat(message.bookingMessage.bookingChatId);

          bookingChatOrder!.messages.add(message.bookingMessage);

          debugPrint(
              "ADDED MESSAGE AFTER SERVER CALL ${message.bookingMessage.chatMessage}");
          bookingOrderChats.value = [...bookingOrderChats, bookingChatOrder];
        }
      }
    }
  }
}
