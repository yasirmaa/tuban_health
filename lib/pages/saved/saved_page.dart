import 'package:flutter/material.dart';
import 'package:tuban_health/data/models/marker_map.dart';
import 'package:tuban_health/data/repositories/marker_map_repository.dart';
import 'package:tuban_health/pages/saved/add_edit_saved.dart';
import 'package:tuban_health/theme/styles.dart';
import 'package:tuban_health/widgets/card_detail_saved.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  late List<MarkerMap> _myMarkers;
  var _isLoading = false;

  Future<void> _refreshMarkers() async {
    setState(() {
      _isLoading = true;
    });
    _myMarkers = await MarkerMapRepository().getAll();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Daftar Anda",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AddEditSaved()));
                              _refreshMarkers();
                            },
                            child: const Text(
                              "+ Tambah baru",
                              style: TextStyle(fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      // ignore: prefer_const_constructors
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Divider(
                          height: 1,
                          color: Colors.black,
                        ),
                      ),
                      _myMarkers.isEmpty
                          ? Center(
                              child: Container(
                                margin: const EdgeInsets.only(top: 100),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Styles.secondaryColor),
                                child: const Text(
                                  "Belum ada daftar yang disimpan",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            )
                          : const SizedBox(
                              height: 20,
                            ),
                      ListView.builder(
                        itemCount: _myMarkers.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final myMarker = _myMarkers[index];
                          return GestureDetector(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddEditSaved(
                                      markerMap: myMarker,
                                    ),
                                  ),
                                );
                                _refreshMarkers();
                              },
                              child: CardDeatilSaved(myMarker: myMarker));
                        },
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
