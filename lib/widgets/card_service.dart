import 'package:flutter/material.dart';

import '../pages/detail_health.dart';

class CardService extends StatelessWidget {
  final String title;
  final String pathImage;
  final int typeService;

  const CardService({super.key, required this.title, required this.pathImage, required this.typeService});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return DetailHealth(typeService: typeService,);
            },
          ),
        );
      },
      child: Container(
        height: 80,
        margin: const EdgeInsets.only(bottom: 12, left: 20, right: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(pathImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20,),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87
              ),
            ),
          ],
        ),
      ),
    );
  }
}
