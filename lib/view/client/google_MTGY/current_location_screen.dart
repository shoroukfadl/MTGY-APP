import 'dart:async';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';

import '../../../model/googlemaps/polyline_response.dart';
import '../../../services/widgets/constant.dart';


class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({Key? key}) : super(key: key);

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

const kGoogleApiKey = 'AIzaSyBXcprF-NgcGpuisGASWAyyI4YYiqL4CTk';
 final homeScaffoldKey = GlobalKey<ScaffoldState>();

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {

  late GoogleMapController googleMapController;
  final Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markersList = {};
  final Mode _mode =  Mode.overlay;

  String totalDistance = "";
  String totalTime = "";
  LatLng? seleted_place ;
  LatLng? curruntlocation ;

  PolylineResponse polylineResponse = PolylineResponse();
  Set<Polyline> polylinePoints = {};

  static const CameraPosition initialCameraPosition =
  CameraPosition(target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);
  Set<Marker> markers = {};
  Set<Marker> dismarkers = {};
  final searchcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffoldKey,
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: initialCameraPosition,
            markers: markers,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            polylines: polylinePoints,
            onMapCreated: (GoogleMapController controller)async {
            Position position = await _determinePosition();
            controller
                .animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 14)));

            // markers.clear();
            markers.add(Marker(markerId: const MarkerId('currentLocation'),icon: BitmapDescriptor.defaultMarker,
            position: LatLng(position.latitude, position.longitude)));
            curruntlocation = LatLng(position.latitude, position.longitude);
            setState(() {});
            googleMapController = controller;
            _controller.complete(controller);
            },
          ),

          Padding(
            padding: const EdgeInsets.only(top: 70.0,left: 20),
            child: Container(
              margin: const EdgeInsets.only(top: 10,left: 20),
              padding: const EdgeInsets.all(20),
              color: YellowColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Total Distance: $totalDistance",style:  GoogleFonts.acme(
                  color:WhiteColor)),
                  Text("Total Time: $totalTime",style:  GoogleFonts.acme(
                      color:WhiteColor)),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              drawPolyline();
            },
            backgroundColor: YellowColor,
            child: const Icon(Icons.directions),
          ),
          SizedBox(height: 10,),
          FloatingActionButton(
            onPressed: () {
              _handlePressButton();
            },
            backgroundColor: YellowColor,
            child: const Icon(Icons.search,),
          ),
          SizedBox(height: 30,),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
 // user current location
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }

  // user search
  Future<void> _handlePressButton() async {
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        onError: onError,
        mode: _mode,
        language: 'en',
        strictbounds: false,
        types: [""],
        decoration: InputDecoration(
            hintText: 'Search',
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.white))),
        components: [Component(Component.country,"eg")]);


    displayPrediction(p!,homeScaffoldKey.currentState);
  }

  void onError(PlacesAutocompleteResponse response){

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Message',
        message: response.errorMessage!,
        contentType: ContentType.failure,
      ),
    ));

    // homeScaffoldKey.currentState!.shshowSnackBar(SnackBar(content: Text(response.errorMessage!)));
  }

  Future<void> displayPrediction(Prediction p, ScaffoldState? currentState) async {

    GoogleMapsPlaces places = GoogleMapsPlaces(
        apiKey: kGoogleApiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders()
    );

    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);

    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;

   // markersList.clear();
    markers.add(
        Marker(markerId: const MarkerId("searh result"),icon: BitmapDescriptor.defaultMarker,
            position: LatLng(lat, lng),infoWindow: InfoWindow(title: detail.result.name)));
    seleted_place = LatLng(lat, lng);
    setState(() {});

    googleMapController.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));
    print("${lat} , ${lng}");
    print("${seleted_place!.latitude} , ${seleted_place!.longitude}");
    print("${curruntlocation!.latitude} , ${curruntlocation!.longitude}");

  }

  // polyline route
  void drawPolyline() async {
    var response = await http.post(
        Uri.parse("https://maps.googleapis.com/maps/api/directions/json?key=$kGoogleApiKey&units=metric&origin=${curruntlocation!.latitude},${curruntlocation!.longitude}&destination=${seleted_place!.latitude},${seleted_place!.longitude}&mode=driving"));
        print(response.body);

          polylineResponse = PolylineResponse.fromJson(jsonDecode(response.body));

          totalDistance = polylineResponse.routes![0].legs![0].distance!.text!;
          totalTime = polylineResponse.routes![0].legs![0].duration!.text!;

    for (int i = 0; i < polylineResponse.routes![0].legs![0].steps!.length; i++) {
      polylinePoints.add(
          Polyline(polylineId:
          PolylineId(polylineResponse.routes![0].legs![0].steps![i].polyline!.points!),
          points: [
         LatLng(
            polylineResponse.routes![0].legs![0].steps![i].startLocation!.lat!, polylineResponse.routes![0].legs![0].steps![i].startLocation!.lng!),
        LatLng(polylineResponse.routes![0].legs![0].steps![i].endLocation!.lat!, polylineResponse.routes![0].legs![0].steps![i].endLocation!.lng!),
      ],width: 5,color: BlueColor
      ));
    }

    setState(() {});
  }
}

