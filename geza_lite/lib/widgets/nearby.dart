import 'package:flutter/material.dart';
import 'package:geza_lite/models/beauty_professional_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearbyProfessionalsMap extends StatefulWidget {
  const NearbyProfessionalsMap({Key? key}) : super(key: key);

  @override
  _NearbyProfessionalsMapState createState() => _NearbyProfessionalsMapState();
}

class _NearbyProfessionalsMapState extends State<NearbyProfessionalsMap> {
  double? height;
  double? width;
  bool mapView = true;
  GoogleMapController? _controller;
  PageController? _pageController;
  // List _markers = [];
  int? prevPage;
  // ignore: prefer_typing_uninitialized_variables
  static var map;
  BitmapDescriptor? locatoinIcon;
  final List<Marker> _markers = <Marker>[];
  @override
  void initState() {
    super.initState();

    getIcon();
    map = googleMap();
    for (var element in nearbyBeautyProfessionalList) {
      _markers.add(
        Marker(
          markerId: MarkerId(element.gezabeautyappName!),
          draggable: false,
          infoWindow: InfoWindow(
              title: element.gezabeautyappName, snippet: element.address),
          position: element.locationCoords!,
        ),
      );
    }
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  getIcon() async {
    var icon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(20, 20)),
      'assets/icons/current_location_marker.png',
    );
    setState(() {
      locatoinIcon = icon;
    });
  }

  _onScroll() {
    if (_pageController!.page!.toInt() != prevPage) {
      prevPage = _pageController!.page!.toInt();
      moveCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(extendBodyBehindAppBar: mapView, body: salonMap());
  }

  salonMap() {
    return Stack(
      children: [
        googleMap(),
      ],
    );
  }

  googleMap() {
    var newMap = GoogleMap(
      markers: Set.from(_markers),
      initialCameraPosition: const CameraPosition(
        target: LatLng(40.729515, -73.985927),
        zoom: 13,
      ),
      onMapCreated: mapCreated,
    );
    setState(() {
      map = newMap;
    });
    return map;
  }

  mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
    _markers.add(
      Marker(
        markerId: const MarkerId('location'),
        draggable: false,
        infoWindow: const InfoWindow(title: 'Your location'),
        position: const LatLng(40.729515, -73.985927),
        icon: locatoinIcon!,
      ),
    );
  }

  moveCamera() {
    _controller!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: nearbyBeautyProfessionalList[_pageController!.page!.toInt()]
              .locationCoords!,
          zoom: 14.0,
          bearing: 45.0,
          tilt: 45.0,
        ),
      ),
    );
  }
}
