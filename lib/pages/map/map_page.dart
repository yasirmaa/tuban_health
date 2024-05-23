import 'package:flutter/material.dart';
import 'package:tuban_health/data/repositories/marker_map_repository.dart';
import 'dart:async';
import 'package:tuban_health/database/data_dummy.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tuban_health/widgets/card_map_type.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  double latitude = -6.897514167472941;
  double longitude = 112.04633979248108;

  Position? devicePosition;
  String address = "";

  String _selectedMenu = "Rumah Sakit";
  var mapType = MapType.normal;

  Set<Marker> myMarkers = {};

  Future<void> fetchMarkers() async {
    final myMarkersData = await MarkerMapRepository().getAll();
    myMarkers = myMarkersData
        .map((e) => Marker(
              markerId: MarkerId(e.id.toString()),
              position: LatLng(e.latitude, e.longitude),
              infoWindow: InfoWindow(title: e.title),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueAzure),
            ))
        .toSet();
  }

  @override
  void initState() {
    super.initState();
    Geolocator.requestPermission();
    fetchMarkers();
  }

  Set<Marker> markers = rumahSakit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildGoogleMaps(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [_menuServices(), Text(_selectedMenu)],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(
                      Icons.layers_outlined,
                      color: Colors.black87,
                    ),
                    onPressed: () {
                      _menuMapType();
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getCurrentPosition().then((value) async {
            setState(() {
              devicePosition = value;
            });
            GoogleMapController controller = await _controller.future;
            final cameraPosition = CameraPosition(
              target: LatLng(value!.latitude, value!.longitude),
              zoom: 17,
            );
            final cameraUpdate = CameraUpdate.newCameraPosition(cameraPosition);
            controller.animateCamera(cameraUpdate);
          });
        },
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: const Icon(
          Icons.gps_fixed_outlined,
          color: Colors.blue,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  Future<Position?> getCurrentPosition() async {
    Position? currentPosition;

    try {
      currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      currentPosition = null;
    }
    return currentPosition;
  }

  Future<void> _menuMapType() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: const BoxConstraints(minHeight: 200, maxHeight: 200),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Map type",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800]),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        mapType = MapType.normal;
                      });
                    },
                    child: CardMapType(
                      mapImagePath: "assets/map-normal.png",
                      nameMap: "Normal",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        mapType = MapType.hybrid;
                      });
                    },
                    child: CardMapType(
                      mapImagePath: "assets/map-hybrid.png",
                      nameMap: "Hybrid",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        mapType = MapType.terrain;
                      });
                    },
                    child: CardMapType(
                      mapImagePath: "assets/map-terrain.png",
                      nameMap: "Terrain",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        mapType = MapType.satellite;
                      });
                    },
                    child: CardMapType(
                      mapImagePath: "assets/map-satellite.png",
                      nameMap: "Satellite",
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _menuServices() {
    return PopupMenuButton(
      icon: const Icon(Icons.local_hospital_outlined),
      shadowColor: Colors.grey[200],
      color: Colors.white,
      onSelected: onSelectedServices,
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'Rumah Sakit',
          child: ListTile(
            leading: Icon(
              Icons.local_hospital,
              color: Colors.red,
            ),
            title: Text('Rumah Sakit'),
          ),
        ),
        const PopupMenuItem(
          value: 'Puskesmas',
          child: ListTile(
            leading: Icon(
              Icons.local_pharmacy,
              color: Colors.green,
            ),
            title: Text('Puskesmas'),
          ),
        ),
        const PopupMenuItem(
          value: 'Apotek',
          child: ListTile(
            leading: Icon(
              Icons.local_pharmacy,
              color: Colors.blue,
            ),
            title: Text('Apotek'),
          ),
        ),
        const PopupMenuItem(
          value: 'Klinik',
          child: ListTile(
            leading: Icon(
              Icons.local_hospital,
              color: Colors.orange,
            ),
            title: Text('Klinik'),
          ),
        ),
        const PopupMenuItem(
          value: 'My Marker',
          child: ListTile(
            leading: Icon(
              Icons.notification_important_outlined,
              color: Colors.blueAccent,
            ),
            title: Text('My Marker'),
          ),
        ),
      ],
    );
  }

  Widget _buildGoogleMaps() {
    return GoogleMap(
      mapType: mapType,
      initialCameraPosition: CameraPosition(
        target: LatLng(latitude, longitude),
        zoom: 14,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: markers,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
    );
  }

  void onSelectedServices(dynamic value) {
    setState(() {
      switch (value) {
        case "Rumah Sakit":
          markers = rumahSakit;
          _selectedMenu = "Rumah Sakit";
          break;
        case "Puskesmas":
          markers = puskesmas;
          _selectedMenu = "Puskesmas";
          break;
        case "Apotek":
          markers = apotek;
          _selectedMenu = "Apotek";
          break;
        case "Klinik":
          markers = klinik;
          _selectedMenu = "Klinik";
          break;
        case "My Marker":
          markers = myMarkers;
          _selectedMenu = "My Marker";
          break;
        default:
      }
    });
  }
}
