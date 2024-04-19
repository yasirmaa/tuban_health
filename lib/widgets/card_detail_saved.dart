import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tuban_health/data/models/marker_map.dart';

class CardDeatilSaved extends StatelessWidget {
  const CardDeatilSaved({super.key, required this.myMarker});

  final MarkerMap myMarker;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              myMarker.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              myMarker.description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Alamat: ${myMarker.address}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Posisi: (${myMarker.latitude}, ${myMarker.longitude})',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey, // Ganti dengan widget peta sesuai kebutuhan
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(myMarker.latitude, myMarker.longitude),
                  zoom: 15,
                ),
                markers: <Marker>{
                  Marker(
                    markerId: MarkerId('marker'),
                    position: LatLng(myMarker.latitude, myMarker.longitude),
                    infoWindow: InfoWindow(title: myMarker.title),
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
