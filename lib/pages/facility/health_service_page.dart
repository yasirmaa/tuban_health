import 'package:flutter/material.dart';
import 'package:tuban_health/widgets/card_service.dart';

class HealthServicePage extends StatefulWidget {
  const HealthServicePage({super.key});

  @override
  State<HealthServicePage> createState() => _HealthServicePageState();
}

class _HealthServicePageState extends State<HealthServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Fasilitas Kesehatan Tuban",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.greenAccent,
      ),
      body: const Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CardService(
            title: "Rumah Sakit",
            pathImage: "assets/bg-hospital.png",
            typeService: 0,
          ),
          CardService(
            title: "Puskesmas",
            pathImage: "assets/bg-puskesmas.png",
            typeService: 1,
          ),
          CardService(
            title: "Apotek",
            pathImage: "assets/bg-apotek.png",
            typeService: 2,
          ),
          CardService(
            title: "Klinik",
            pathImage: "assets/bg-klinik.png",
            typeService: 3,
          ),
        ],
      ),
    );
  }
}
