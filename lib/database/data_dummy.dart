import 'package:google_maps_flutter/google_maps_flutter.dart';

Set<Marker> rumahSakit = {
  Marker(
    markerId: const MarkerId("RSUD Dr. R. KOESMA Tuban"),
    position: const LatLng(-6.897497530453589, 112.04708341096581),
    infoWindow: const InfoWindow(title: "RSUD Dr. R. KOESMA Tuban"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  ),
  Marker(
    markerId: const MarkerId("RS NU Tuban"),
    position: const LatLng(-6.88176912070368, 112.02971118008007),
    infoWindow: const InfoWindow(title: "RS NU Tuban"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  ),
  Marker(
    markerId: const MarkerId("Rumah Sakit Medika Mulia"),
    position: const LatLng(-6.903037692667206, 112.05793306493061),
    infoWindow: const InfoWindow(title: "Rumah Sakit Medika Mulia"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  ),
  Marker(
    markerId: const MarkerId("RS Muhammadiyah Tuban"),
    position: const LatLng(-6.895908721372581, 112.05310358453077),
    infoWindow: const InfoWindow(title: "RS Muhammadiyah Tuban"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  ),
  Marker(
    markerId: const MarkerId("RSUD R. ALI MANSHUR JATIROGO"),
    position: const LatLng(-6.887795777072204, 111.66298906678001),
    infoWindow: const InfoWindow(title: "RSUD R. ALI MANSHUR JATIROGO"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  ),
};

Set<Marker> puskesmas = {
  Marker(
    markerId: const MarkerId("Puskesmas Soko"),
    position: const LatLng(-6.893205837990595, 112.04174720780853),
    infoWindow: const InfoWindow(title: "Puskesmas Soko"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  ),
  Marker(
    markerId: const MarkerId("Puskesmas Wire"),
    position: const LatLng(-6.910012418222177, 112.08314195422871),
    infoWindow: const InfoWindow(title: "Puskesmas Wire"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  ),
  Marker(
    markerId: const MarkerId("Puskesmas Kebonsari"),
    position: const LatLng(-6.900253831377921, 112.07571492848575),
    infoWindow: const InfoWindow(title: "Puskesmas Kebonsari"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  ),
};

Set<Marker> apotek = {
  Marker(
    markerId: const MarkerId("Apotek Abata"),
    position: const LatLng(-6.903888115919217, 112.0704848429016),
    infoWindow: const InfoWindow(title: "Apotek Abata"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  ),
  Marker(
    markerId: const MarkerId("Apotek Pahlawan Sehat"),
    position: const LatLng(-6.908902775854673, 112.07759136681797),
    infoWindow: const InfoWindow(title: "Apotek Pahlawan Sehat"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  ),
  Marker(
    markerId: const MarkerId("Apotek Ashari Farma"),
    position: const LatLng(-6.911252462341717, 112.06299561307203),
    infoWindow: const InfoWindow(title: "Apotek Ashari Farma"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  ),
  Marker(
    markerId: const MarkerId("Apotek Watu Gajah Farma"),
    position: const LatLng(-6.922501285185013, 112.06269632366048),
    infoWindow: const InfoWindow(title: "Apotek Watu Gajah Farma"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  ),
  Marker(
    markerId: const MarkerId("Apotek Tanjung Raya Farma"),
    position: const LatLng(-6.913297963466765, 112.08958168800041),
    infoWindow: const InfoWindow(title: "Apotek Tanjung Raya Farma"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  ),
  Marker(
    markerId: const MarkerId("Apotek Jaya Farma"),
    position: const LatLng(-6.933749545743875, 112.05867897036829),
    infoWindow: const InfoWindow(title: "Apotek Jaya Farma"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  ),
  Marker(
    markerId: const MarkerId("Apotek Merakurak Farma"),
    position: const LatLng(-6.87975545310943, 111.98471846405623),
    infoWindow: const InfoWindow(title: "Apotek Merakurak Farma"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  ),
  Marker(
    markerId: const MarkerId("Apotek Gelis Sehat"),
    position: const LatLng(-6.875460204269196, 111.98760271803715),
    infoWindow: const InfoWindow(title: "Apotek Gelis Sehat"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  ),
  Marker(
    markerId: const MarkerId("Apotek Doa Sehat"),
    position: const LatLng(-6.896629268740314, 112.05857595953226),
    infoWindow: const InfoWindow(title: "Apotek Doa Sehat"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  ),
};

Set<Marker> klinik = {
  Marker(
    markerId: const MarkerId("Klinik Ar Rochma"),
    position: const LatLng(-6.907837825159417, 112.05570103457761),
    infoWindow: const InfoWindow(title: "Klinik Ar Rochma"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
  ),
  Marker(
    markerId: const MarkerId("Klinik Permata Bunda"),
    position: const LatLng(-6.906139154277389, 112.05687177952221),
    infoWindow: const InfoWindow(title: "Klinik Permata Bunda"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
  ),
  Marker(
    markerId: const MarkerId("Klinik Kuret Tuban"),
    position: const LatLng(-6.901400724318701, 112.05876298289425),
    infoWindow: const InfoWindow(title: "Klinik Kuret Tuban"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
  ),
  Marker(
    markerId: const MarkerId("Klinik Estetika Avenia Skin"),
    position: const LatLng(-6.892102535253342, 112.04367838456959),
    infoWindow: const InfoWindow(title: "Klinik Estetika Avenia Skin"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
  ),
};
