import 'package:flutter/material.dart';

class CardMapType extends StatelessWidget {
  final String mapImagePath;
  final String nameMap;

  CardMapType({
    super.key,
    required this.mapImagePath,
    required this.nameMap,
  });

  final List<String> mapType = ["Normal", "Hybrid", "Terrain", "Satellite"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Image.asset(mapImagePath),
            )),
        const SizedBox(height: 8),
        Text(
          nameMap,
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
