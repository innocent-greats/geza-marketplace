import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:geza_lite/controllers/auth/auth_controller.dart';
import 'package:geza_lite/controllers/provider_service_controller.dart';
import 'package:geza_lite/utils/provider_strings.dart';
import 'package:geza_lite/widgets/dashboard_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/custom_style.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/widgets/back_widget.dart';
import 'dart:io';
import 'package:geza_lite/screens/dashboard_screen.dart';

class AddNewServiceScreen extends StatefulWidget {
  const AddNewServiceScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddNewServiceScreenState createState() => _AddNewServiceScreenState();
}

class _AddNewServiceScreenState extends State<AddNewServiceScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthController _authController = Get.put(AuthController());

  TextEditingController serviceNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController neighbourhoodController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  // TextEditingController styleCategoryController = TextEditingController();
  final ProviderServicesController _servicesController =
      Get.put(ProviderServicesController());
  DateTime selectedDate = DateTime.now();
  String expDate = 'exp date';
  // List<String> typeList = ['Hair Style', 'Spa', 'Message'];
  late String selectedCard;

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: Stack(
          children: [
            // const BgImageWidget(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // BackWidget(iconColor: Colors.white,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: CustomColor.accentColor,
                      ),
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const HomeDashboardWidget(),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                color: CustomColor.accentColor,
                                borderRadius: const BorderRadius.only(
                                    topLeft:
                                        Radius.circular(Dimensions.radius * 2),
                                    topRight: Radius.circular(
                                        Dimensions.radius * 2))),
                            child: bodyWidget(context),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return GetBuilder<ProviderServicesController>(
        init: ProviderServicesController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.only(
              left: Dimensions.marginSize,
              right: Dimensions.marginSize,
              // top: Dimensions.heightSize * 3
            ),
            child: Column(
              children: [
                Text(
                  'Add New Item',
                  style: TextStyle(
                      fontSize: Dimensions.extraLargeTextSize * 1.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: Dimensions.heightSize * 3,
                ),
                Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Service Categories',
                          style: CustomStyle.textStyle,
                        ),
                        const SizedBox(height: Dimensions.heightSize * 0.5),
                        Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(Dimensions.radius)),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.1))),
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: Dimensions.marginSize * 0.5,
                                  right: Dimensions.marginSize * 0.5),
                              child: Obx(
                                () => DropdownButton(
                                  isExpanded: true,
                                  underline: Container(),
                                  hint: Text(
                                    _servicesController.selectedCard.value,
                                    style: CustomStyle.textStyle,
                                  ), // Not necessary for Option 1
                                  value: _servicesController
                                              .selectedCard.value !=
                                          ''
                                      ? _servicesController.selectedCard.value
                                      : _servicesController.typeList[0],
                                  onChanged: (String? newValue) => controller
                                      .onSelectServiceCategory(newValue),
                                  items:
                                      _servicesController.typeList.map((value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: CustomStyle.textStyle,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )),
                        ),
                        const SizedBox(height: Dimensions.heightSize),
                        Text(
                          'Style Name',
                          style: CustomStyle.textStyle,
                        ),
                        const SizedBox(height: Dimensions.heightSize * 0.5),
                        TextFormField(
                          style: CustomStyle.textStyle,
                          controller: serviceNameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText:
                                'e.g Egyptian Locks, braids, blonde weave',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            labelStyle: CustomStyle.textStyle,
                            focusedBorder: CustomStyle.focusBorder,
                            enabledBorder: CustomStyle.focusErrorBorder,
                            focusedErrorBorder: CustomStyle.focusErrorBorder,
                            errorBorder: CustomStyle.focusErrorBorder,
                            filled: true,
                            fillColor: CustomColor.accentColor,
                            hintStyle: CustomStyle.textStyle,
                          ),
                        ),
                        const SizedBox(height: Dimensions.heightSize),
                        Text(
                          'Price',
                          style: CustomStyle.textStyle,
                        ),
                        const SizedBox(height: Dimensions.heightSize * 0.5),
                        TextFormField(
                          style: CustomStyle.textStyle,
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'e.g 5.00',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            labelStyle: CustomStyle.textStyle,
                            focusedBorder: CustomStyle.focusBorder,
                            enabledBorder: CustomStyle.focusErrorBorder,
                            focusedErrorBorder: CustomStyle.focusErrorBorder,
                            errorBorder: CustomStyle.focusErrorBorder,
                            filled: true,
                            fillColor: CustomColor.accentColor,
                            hintStyle: CustomStyle.textStyle,
                          ),
                        ),

                        const SizedBox(height: Dimensions.heightSize),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: CustomSearchableDropDown(
                                  items: _authController.populatedCities,
                                  label: 'Select City e.g Harare',
                                  labelStyle: const TextStyle(fontSize: 12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.0),
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 173, 170, 174))),
                                  dropDownMenuItems: _authController
                                      .populatedCities
                                      .map((item) {
                                    return item['name'];
                                  }).toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      _authController.selectedCity.value = '';

                                      // _authController.selectedCity.value =
                                      //     value['name'].toString();
                                      _authController.onSelectedCity(
                                          value['name'].toString());
                                    } else {
                                      _authController.selectedCity.value = '';
                                    }
                                  },
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Obx(() => CustomSearchableDropDown(
                                      items: _authController
                                          .populatedNeighbourhoods,
                                      label: 'Select Area e.g Machipisa',
                                      labelStyle: const TextStyle(fontSize: 12),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 173, 170, 174))),
                                      dropDownMenuItems: _authController
                                          .populatedNeighbourhoods
                                          .map((item) {
                                        debugPrint(
                                            'matched Area in dropdown data ${item.name}');

                                        return item.name.toString().capitalize;
                                      }).toList(),
                                      onChanged: (value) {
                                        debugPrint(
                                            'onChanged dropdown data $value');
                                        value.toString().toLowerCase();
                                        if (value != null) {
                                          _authController
                                              .selectedNeighbourhood.value = '';
                                          _authController.onSelectedArea(
                                              value.name.toString());
                                        } else {
                                          _authController
                                              .selectedNeighbourhood.value = '';
                                        }
                                      },
                                    )),
                              ),
                            ),
                          ],
                        ),
                        // const SizedBox(height: Dimensions.heightSize),
                        const SizedBox(height: Dimensions.heightSize),
                        Text(
                          ProvicerStrings.uploadImage,
                          style: CustomStyle.textStyle,
                        ),
                        const SizedBox(height: Dimensions.heightSize * 0.5),
                        addImageWidget(context, controller)
                      ],
                    )),
                const SizedBox(height: Dimensions.heightSize * 2),
                GestureDetector(
                  child: Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: CustomColor.primaryColor,
                        borderRadius: BorderRadius.all(
                            Radius.circular(Dimensions.radius * 0.5))),
                    child: Center(
                      child: Obx(() => _servicesController.isLoading.value
                          ? Row(
                              children: [
                                const SizedBox(
                                    width: Dimensions.heightSize * 6),
                                const SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3.0,
                                  ),
                                ),
                                const SizedBox(
                                    width: Dimensions.heightSize * 2),
                                Text(
                                  '... uploading images',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.largeTextSize,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          : Text(
                              ProvicerStrings.saveService.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.largeTextSize,
                                  fontWeight: FontWeight.bold),
                            )),
                    ),
                  ),
                  onTap: () {
                    // _showPaymentSuccessDialog();
                    controller.onPublishNewStyle(
                      controller.selectedCard.value,
                      serviceNameController.text,
                      double.parse(priceController.text),
                    );
                  },
                ),
              ],
            ),
          );
        });
  }

  addImageWidget(BuildContext context, controller) {
    return Align(
      alignment: Alignment.center,
      child: Stack(children: <Widget>[
        Container(
          height: 150,
          width: 150,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: CustomColor.secondaryColor,
            borderRadius: BorderRadius.circular(75.0),
          ),
          child: controller.isImageAdded == false
              ? const Icon(
                  Icons.wallpaper,
                  size: 70,
                )
              : Image.file(
                  controller.pickedFile!,
                  fit: BoxFit.cover,
                ),
        ),
        Positioned(
          right: 0,
          bottom: 20,
          child: Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
                color: CustomColor.primaryColor,
                borderRadius: BorderRadius.circular(20.0)),
            child: IconButton(
              onPressed: () {
                _servicesController.pickImageFromLocalStorage();
              },
              padding: const EdgeInsets.only(left: 5, right: 5),
              iconSize: 24,
              icon: const Icon(
                Icons.camera_enhance,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Future<void> _openImageSourceOptions(BuildContext context, controller) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.camera_alt,
                    size: 40.0,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.photo,
                    size: 40.0,
                    color: Colors.green,
                  ),
                  onTap: () {
                    _servicesController.getImageorVideoFromGallery();
                  },
                ),
              ],
            ),
          );
        });
  }

  Future<bool> _showPaymentSuccessDialog() async {
    return (await showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => AlertDialog(
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/tik.png'),
                  Text(
                    ProvicerStrings.successfullyAddYourService,
                    style: TextStyle(
                        fontSize: Dimensions.extraLargeTextSize,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    child: Container(
                      height: 60.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: CustomColor.primaryColor,
                          borderRadius: BorderRadius.all(
                              Radius.circular(Dimensions.radius))),
                      child: Center(
                        child: Text(
                          ProvicerStrings.ok.toUpperCase(),
                          style: TextStyle(
                              fontSize: Dimensions.extraLargeTextSize,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const DashboardScreen()));
                    },
                  )
                ],
              ),
            ),
          ),
        )) ??
        false;
  }
}

class ImageBlock extends StatefulWidget {
  final File file;
  const ImageBlock({Key? key, required this.file}) : super(key: key);
  @override
  State<ImageBlock> createState() => _ImageBlockState();
}

class _ImageBlockState extends State<ImageBlock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.file(widget.file)));
  }
}

class VideoBlock extends StatefulWidget {
  final File file;
  const VideoBlock({Key? key, required this.file}) : super(key: key);
  @override
  State<VideoBlock> createState() => _VideoBlockState();
}

class _VideoBlockState extends State<VideoBlock> {
  VideoPlayerController? videoPlayerController;
  @override
  void initState() {
    videoPlayerController =
        VideoPlayerController.file(File(widget.file.path.toString()))
          ..initialize().then((_) {
            videoPlayerController!.play();
            setState(() {});
          });
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: videoPlayerController!.value.aspectRatio,
          child: VideoPlayer(videoPlayerController!),
        ),
      ),
    );
  }
}
