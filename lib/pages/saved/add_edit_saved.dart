import 'package:flutter/material.dart';
import 'package:tuban_health/data/models/marker_map.dart';
import 'package:tuban_health/data/repositories/marker_map_repository.dart';

class AddEditSaved extends StatefulWidget {
  const AddEditSaved({super.key, this.markerMap});

  final MarkerMap? markerMap;

  @override
  State<AddEditSaved> createState() => _AddEditSavedState();
}

class _AddEditSavedState extends State<AddEditSaved> {
  late int _id;
  var _isUpdate = false;
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final addressController = TextEditingController();
  final descriptionController = TextEditingController();
  var latitudeController = TextEditingController();
  final longitudeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _id = widget.markerMap?.id ?? 0;
    _isUpdate = widget.markerMap != null;
    titleController.text = widget.markerMap?.title ?? '';
    addressController.text = widget.markerMap?.address ?? '';
    descriptionController.text = widget.markerMap?.description ?? '';
    latitudeController.text = widget.markerMap?.latitude.toString() ?? '';
    longitudeController.text = widget.markerMap?.longitude.toString() ?? '';
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    addressController.dispose();
    latitudeController.dispose();
    longitudeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isUpdate ? "Edit" : "Add"),
        actions: [
          _isUpdate ? _deleteButton():const SizedBox(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    const Text("Title", style: TextStyle(fontSize: 16)),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Input title",
                      ),
                      autofocus: false,
                      controller: titleController,
                      validator: (value) {
                        if (value == null || value == '') {
                          return 'Title required';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    const Text("Description", style: TextStyle(fontSize: 16)),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Input description",
                      ),
                      autofocus: false,
                      controller: descriptionController,
                      validator: (value) {
                        if (value == null || value == '') {
                          return 'Description required';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    const Text("Address", style: TextStyle(fontSize: 16)),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Input address",
                      ),
                      autofocus: false,
                      controller: addressController,
                      validator: (value) {
                        if (value == null || value == '') {
                          return 'Address required';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    const Text("Latitude", style: TextStyle(fontSize: 16)),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Input Latitude",
                      ),
                      autofocus: false,
                      controller: latitudeController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (value) {
                        if (value == null || value == '') {
                          return 'Latitude required';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    const Text("Longitude", style: TextStyle(fontSize: 16)),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Longitude required",
                      ),
                      autofocus: false,
                      controller: longitudeController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: (value) {
                        if (value == null || value == '') {
                          return 'Masukkan Longitude';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildButtonSave(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonSave() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          final isValid = _formKey.currentState!.validate();
          if (isValid) {
            if (_isUpdate) {
              await _updateMarkerMap();
            } else {
              await _addMarkerMap();
            }
            Navigator.pop(context);
          }
        },
        child: const Text("Save"),
      ),
    );
  }

  Widget _deleteButton() {
    return IconButton(
        onPressed: () async {
          if (_isUpdate) {
            await MarkerMapRepository().delete(_id);
            Navigator.pop(context);
          }
        },
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ));
  }

  Future<void> _addMarkerMap() async {
    final markerMap = MarkerMap(
      title: titleController.text ?? '',
      description: descriptionController.text ?? '',
      address: addressController.text ?? '',
      latitude: double.tryParse(latitudeController.text) ?? 0.0,
      longitude: double.tryParse(longitudeController.text) ?? 0.0,
    );
    await MarkerMapRepository().insert(markerMap);
  }

  Future<void> _updateMarkerMap() async {
    final markerMap = MarkerMap(
      id: widget.markerMap?.id,
      title: titleController.text ?? '',
      description: descriptionController.text ?? '',
      address: addressController.text ?? '',
      latitude: double.tryParse(latitudeController.text) ?? 0.0,
      longitude: double.tryParse(longitudeController.text) ?? 0.0,
    );
    await MarkerMapRepository().update(markerMap);
  }
}
