import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/controllers/auth/auth_controller.dart';
import 'package:geza_lite/controllers/customer_service_controller.dart';
import 'package:geza_lite/controllers/provider_service_controller.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/data/message.dart';
import 'package:geza_lite/widgets/back_widget.dart';
import 'package:gezamarketplace_client/gezamarketplace_client.dart';

class BookingMessagingScreen extends StatefulWidget {
  const BookingMessagingScreen({super.key});

  @override
  _BookingMessagingScreenState createState() => _BookingMessagingScreenState();
}

class _BookingMessagingScreenState extends State<BookingMessagingScreen> {
  final ProviderServicesController _providerServicesController =
      Get.put(ProviderServicesController());
  final AuthController _authController = Get.put(AuthController());
  TextEditingController messageController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    _providerServicesController.currentChatBookingMessages.value =
        _providerServicesController.bookingOrderChat.value.messages;
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            profileWidget(context),
            messagingWidget(context),
            typeMessageWidget(
                context, _providerServicesController.bookingOrderChat.value),
            BackWidget(
              iconColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  Widget profileWidget(BuildContext context) {
    return Positioned(
      top: 150.0,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -40,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(38),
                            child: Image.network(
                              _providerServicesController.bookingOrderChat.value
                                  .orderedItem.images[0].pathLocation
                                  .toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          _providerServicesController.bookingOrderChat.value
                              .orderedItem.name.capitalize!,
                          style: TextStyle(
                            color: CustomColor.redDarkColor,
                            fontSize: Dimensions.largeTextSize,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Obx(() => Text(
                              _providerServicesController
                                  .currentChatBookingMessages.length
                                  .toString(),
                              style: TextStyle(
                                color: CustomColor.greyColor,
                                fontSize: Dimensions.smallTextSize,
                              ),
                              textAlign: TextAlign.center,
                            )),
                        const SizedBox(
                          height: Dimensions.heightSize * 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  messagingWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize,
          right: Dimensions.marginSize,
          top: 230.0,
          bottom: 100),
      child: Expanded(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        child: Obx(() => ListView.builder(
            controller: _scrollController,
            itemCount:
                _providerServicesController.currentChatBookingMessages.length,
            itemBuilder: (context, index) {
              ChatMessage message = _providerServicesController
                  .currentChatBookingMessages[index].chatMessage;
              return Padding(
                  padding: const EdgeInsets.only(
                    bottom: Dimensions.heightSize,
                  ),
                  child: message.senderId == _authController.person!.id
                      ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: Dimensions.marginSize,
                                  left: Dimensions.marginSize),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: CustomColor.greenLightColor,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(30.0),
                                        bottomLeft: Radius.circular(30.0),
                                        bottomRight: Radius.circular(30.0))),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: Dimensions.marginSize,
                                        right: Dimensions.marginSize,
                                        top: Dimensions.heightSize,
                                        bottom: Dimensions.heightSize),
                                    child: Text(
                                      message.message,
                                      style: TextStyle(
                                        color: CustomColor.greyColor,
                                        fontSize: Dimensions.defaultTextSize,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: Dimensions.marginSize),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  'seen message',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontSize: Dimensions.extraSmallTextSize,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: ClipRRect(
                                    child: ClipOval(
                                      child: SizedBox.fromSize(
                                        size: const Size.fromRadius(20),
                                        child: Image.network(
                                          message
                                              .sender.profileImagePathLocation
                                              .toString(),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      message.sender.firstName.capitalize
                                          .toString(),
                                      style: TextStyle(
                                        color: CustomColor.redDarkColor,
                                        fontSize: Dimensions.smallTextSize,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                    Text(
                                      message.dateCreated.toString(),
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.3),
                                        fontSize: Dimensions.extraSmallTextSize,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: Dimensions.marginSize,
                                  right: Dimensions.marginSize),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: CustomColor.yellowLightColor,
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(30.0),
                                        bottomLeft: Radius.circular(30.0),
                                        bottomRight: Radius.circular(30.0))),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: Dimensions.marginSize,
                                        right: Dimensions.marginSize,
                                        top: Dimensions.heightSize,
                                        bottom: Dimensions.heightSize),
                                    child: Text(
                                      message.message,
                                      style: TextStyle(
                                        color: CustomColor.greyColor,
                                        fontSize: Dimensions.defaultTextSize,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: Dimensions.marginSize,
                                      right: Dimensions.marginSize),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: Dimensions.widthSize),
                                          child: Obx(() {
                                            debugPrint(
                                                'BookingMessagingScreen bookingOrderChat.value.chatStatus ${_providerServicesController.bookingOrderChat.value.chatStatus}');
                                            return _providerServicesController
                                                            .bookingOrderChat
                                                            .value
                                                            .chatStatus !=
                                                        'accepted' &&
                                                    _providerServicesController
                                                            .currentChatBookingMessages
                                                            .length ==
                                                        1 &&
                                                    _authController
                                                            .person!.isTrader ==
                                                        true
                                                ? Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          _providerServicesController
                                                              .respondToBookingOrderRequest(
                                                                  'accept');
                                                        },
                                                        child: Container(
                                                          height: 48,
                                                          width: 150,
                                                          decoration: BoxDecoration(
                                                              color: CustomColor
                                                                  .primaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0)),
                                                          child: Center(
                                                            child: Text(
                                                              'Accept Booking',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      Dimensions
                                                                          .largeTextSize,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          _providerServicesController
                                                              .respondToBookingOrderRequest(
                                                                  'reject');
                                                        },
                                                        child: Container(
                                                          height: 48,
                                                          width: 150,
                                                          decoration: BoxDecoration(
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  171,
                                                                  124,
                                                                  168),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0)),
                                                          child: Center(
                                                            child: Text(
                                                              'Reject Booking',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      Dimensions
                                                                          .largeTextSize,
                                                                  color: CustomColor
                                                                      .secondaryColor),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : const Column();
                                          }),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Obx(() {
                              return _providerServicesController
                                              .bookingOrderChat
                                              .value
                                              .chatStatus ==
                                          'accepted' &&
                                      message.message.contains('accepted') &&
                                      _authController.person!.isTrader == true
                                  ? Row(
                                      children: [
                                        const SizedBox(
                                          height: 100,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const CircularProgressIndicator(
                                            color: Colors.purple),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Center(
                                          child: Text(
                                            'Waiting client confirmation...',
                                            style: TextStyle(
                                                fontSize:
                                                    Dimensions.largeTextSize,
                                                color: Colors.purple),
                                          ),
                                        ),
                                      ],
                                    )
                                  : const Column();
                            }),
                            Obx(() {
                              return _providerServicesController
                                              .bookingOrderChat
                                              .value
                                              .chatStatus ==
                                          'accepted' &&
                                      message.message.contains('confirmed') &&
                                      _authController.person!.isTrader == true
                                  ? Row(
                                      children: [
                                        const SizedBox(
                                          height: 100,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          height: 68,
                                          width: 300,
                                          // decoration: BoxDecoration(
                                          //     color: CustomColor.primaryColor,
                                          //     borderRadius:
                                          //         BorderRadius.circular(15.0)),
                                          child: Column(
                                            children: [
                                              Center(
                                                child: Text(
                                                  'Order Completed',
                                                  style: TextStyle(
                                                      fontSize: Dimensions
                                                          .extraLargeTextSize,
                                                      color: CustomColor
                                                          .primaryColor),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Center(
                                                child: Text(
                                                  'Call Client ${_providerServicesController.bookingOrderChat.value.customer.phone}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: Dimensions
                                                          .extraLargeTextSize,
                                                      color: CustomColor
                                                          .primaryColor),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  : const Column();
                            }),
                            Obx(() => _authController.person!.isCustomer ==
                                        true &&
                                    message.message.contains('accepted') &&
                                    _providerServicesController.bookingOrderChat
                                            .value.chatStatus !=
                                        'confirmed'
                                ? Column(
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: Dimensions.marginSize,
                                            right: Dimensions.marginSize),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right:
                                                        Dimensions.widthSize),
                                                child: Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        _providerServicesController
                                                            .respondToBookingOrderRequest(
                                                                'confirm');
                                                      },
                                                      child: Container(
                                                        height: 48,
                                                        width: 150,
                                                        decoration: BoxDecoration(
                                                            color: CustomColor
                                                                .primaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0)),
                                                        child: Center(
                                                          child: Text(
                                                            'Confirm Booking',
                                                            style: TextStyle(
                                                                fontSize: Dimensions
                                                                    .largeTextSize,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        _providerServicesController
                                                            .respondToBookingOrderRequest(
                                                                'cancel');
                                                      },
                                                      child: Container(
                                                        height: 48,
                                                        width: 150,
                                                        decoration: BoxDecoration(
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                171,
                                                                124,
                                                                168),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0)),
                                                        child: Center(
                                                          child: Text(
                                                            'Cancel Booking',
                                                            style: TextStyle(
                                                                fontSize: Dimensions
                                                                    .largeTextSize,
                                                                color: CustomColor
                                                                    .secondaryColor),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : _providerServicesController.bookingOrderChat
                                                .value.chatStatus ==
                                            'confirmed' &&
                                        _authController.person!.isTrader == true
                                    ? Container(
                                        height: 48,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: CustomColor.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                        child: Center(
                                          child: Text(
                                            'Order Completed: Call Client ${_providerServicesController.bookingOrderChat.value.customer.phone}',
                                            style: TextStyle(
                                                fontSize:
                                                    Dimensions.largeTextSize,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    : _providerServicesController
                                                    .bookingOrderChat
                                                    .value
                                                    .chatStatus ==
                                                'confirmed' &&
                                            _authController
                                                    .person!.isCustomer ==
                                                true
                                        ? Container(
                                            height: 48,
                                            width: 250,
                                            decoration: BoxDecoration(
                                                color: CustomColor.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0)),
                                            child: Center(
                                              child: Text(
                                                'Order successfully booked',
                                                style: TextStyle(
                                                    fontSize: Dimensions
                                                        .largeTextSize,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )
                                        : const Column()),
                          ],
                        ));
            })),
      ),
    );
  }

  Widget typeMessageWidget(BuildContext context, BookingOrderChat orderChat) {
    return Obx(() {
      return _providerServicesController.bookingOrderChat.value.chatStatus ==
                  'confirmed' &&
              _authController.person!.isTrader == true
          ? Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.marginSize),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.1),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: Dimensions.marginSize),
                        child: Row(
                          children: [
                            Icon(
                              Icons.emoji_emotions_outlined,
                              color: CustomColor.redDarkColor,
                              size: 20,
                            ),
                            Icon(
                              Icons.image,
                              color: CustomColor.redDarkColor,
                              size: 20,
                            ),
                            Form(
                                key: formKey,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: TextFormField(
                                    style: CustomStyle.textStyle,
                                    controller: messageController,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      hintText: Strings.typeMessage,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 10.0),
                                      labelStyle: CustomStyle.textStyle,
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintStyle: CustomStyle.textStyle,
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      IconButton(
                          icon: const Icon(
                            Icons.send,
                            color: CustomColor.primaryColor,
                            size: 18,
                          ),
                          onPressed: () {
                            _scrollController.animateTo(
                                _scrollController.position.maxScrollExtent,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut);
                            ChatMessage newMessage = ChatMessage(
                                bookingChatId: orderChat.id as int,
                                senderId: _authController.person!.id as int,
                                sender: _authController.person!,
                                recieverId: _authController.person!.isTrader!
                                    ? orderChat.customer.id as int
                                    : orderChat.vendor.id as int,
                                reciever: _authController.person!.isTrader!
                                    ? orderChat.customer
                                    : orderChat.vendor,
                                message: messageController.text,
                                dateCreated: DateTime.now());
                            BookingMessage bookingMessage = BookingMessage(
                                bookingChatId: orderChat.id as int,
                                chatMessage: newMessage);
                            _providerServicesController
                                .sendMessage(bookingMessage);
                            messageController.clear();
                          })
                    ],
                  ),
                ),
              ))
          : const Column();
    });
  }
}
