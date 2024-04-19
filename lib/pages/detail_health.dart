import 'package:flutter/material.dart';
import 'package:tuban_health/data/models/service.dart';

class DetailHealth extends StatefulWidget {
  final int typeService;

  const DetailHealth({super.key, required this.typeService});

  @override
  State<DetailHealth> createState() => _DetailHealthState();
}

class _DetailHealthState extends State<DetailHealth> {
  final List<String> title = ["Rumah sakit", "Puskesmas", "Apotek", "Klinik"];

  late List<Service> layanan;

  @override
  void initState() {
    super.initState();
    switch (widget.typeService) {
      case 0:
        setState(() {
          layanan = rumahSakit;
        });
        break;
      case 1:
        setState(() {
          layanan = puskesmas;
        });
        break;
      case 2:
        setState(() {
          layanan = apotek;
        });
        break;
      case 3:
        setState(() {
          layanan = klinik;
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title[widget.typeService]),
      ),
      body: ListView.builder(
        itemCount: layanan.length,
        itemBuilder: (context, index) {
          final item = layanan[index];
          return Container(
            width: double.infinity,
            height: 140,
            margin: const EdgeInsets.only(bottom: 20),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              elevation: 1,
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(item.imagePath),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.only(right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            item.address,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14),
                          ),
                          Row(
                            children: [
                              Text(
                                "${item.rating}",
                                style: const TextStyle(fontSize: 12),
                              ),
                              Row(
                                children: stars(item.rating),
                              )
                            ],
                          ),
                          Expanded(
                            child: Text(
                              item.open,
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> stars(double rate) {
    List<Widget> list1 = [];
    for (var i = 0; i < rate; i++) {
      list1.add(const Icon(
        Icons.star,
        color: Colors.orange,
        size: 15,
      ));
    }
    return list1;
  }
}
