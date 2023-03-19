import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';

import '../../Data/constants.dart';
import '../../Services/location_services.dart';


class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(33.515343, 36.289590),
    zoom: 14.4746,
  );

  LatLng currentLocation = _initialCameraPosition.target;
  BitmapDescriptor? _locationIcon;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  @override
  void initState() {
    _buildMarkerFromAssets();
    _getMyLocation().then((value) =>  _setMarker(currentLocation));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WhiteColor,
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(onPressed: _showSearchDialog, icon: const Icon(Icons.search))
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            mapType: MapType.normal,
            onMapCreated: (controller) async {
              String style = await DefaultAssetBundle.of(context)
                  .loadString('assets/map_style.json');
              controller.setMapStyle(style);
              _controller.complete(controller);
            },
            onCameraMove: (e) => currentLocation = e.target,
            markers: _markers,
            polylines: _polylines,
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: Image.asset('assets/images/location_icon.png'),
          )
        ],
      ),
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () => _drawPolyline(
      //           const LatLng(38.52900208591146, -98.54919254779816), currentLocation),
      //       child: const Icon(Icons.settings_ethernet_rounded),
      //     ),
      //   ],
      // ),

    );
  }

  // Future<void> _drawPolyline(LatLng from, LatLng to) async {
  //   Polyline polyline = await PolylineService().drawPolyline(from, to);
  //
  //   _polylines.add(polyline);
  //
  //   _setMarker(from);
  //   _setMarker(to);
  //
  //   setState(() {});
  // }

  void _setMarker(LatLng location) {
    Marker newMarker = Marker(
      markerId: MarkerId(location.toString()),
      icon: BitmapDescriptor.defaultMarker,
      // icon: _locationIcon,
      position: location,
      infoWindow: InfoWindow(
          title: "Title",
          snippet: "${currentLocation.latitude}, ${currentLocation.longitude}"),
    );
    _markers.add(newMarker);
    setState(() {});
  }

  Future<void> _buildMarkerFromAssets() async {
    if (_locationIcon == null) {
      _locationIcon = await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(size: Size(48, 48)),
          'assets/images/location_icon.png');
      setState(() {});
    }
  }



  Future<void> _showSearchDialog() async {

    var p = await PlacesAutocomplete.show(
        context: context,
        apiKey: Constants.apiKey,
        mode: Mode.fullscreen,
        language: "ar",
        offset: 0,
        hint: "Type here...",
        radius: 1000,
        types: [],
        strictbounds: false,
        components: [Component(Component.country, "EG")]);
    _getLocationFromPlaceId(p!.placeId!);
  }

  Future<void> _getLocationFromPlaceId(String placeId) async {
    GoogleMapsPlaces _places = GoogleMapsPlaces(
      apiKey: Constants.apiKey,
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );

    PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(placeId);

    _animateCamera(LatLng(detail.result.geometry!.location.lat,
        detail.result.geometry!.location.lng));
  }

  Future<void> _getMyLocation() async {
    LocationData _myLocation = await LocationService().getLocation();
    _animateCamera(LatLng(_myLocation.latitude!, _myLocation.longitude!));
  }

  Future<void> _animateCamera(LatLng _location) async {
    final GoogleMapController controller = await _controller.future;
    CameraPosition _cameraPosition = CameraPosition(
      target: _location,
      zoom: 13.00,
    );
    print(
        "animating camera to (lat: ${_location.latitude}, long: ${_location.longitude}");
    controller.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
  }
}


class Place {
  final String name;
  final String address;

  Place({required this.name, required this.address});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'],
      address: json['formatted_address'],
    );
  }
}
