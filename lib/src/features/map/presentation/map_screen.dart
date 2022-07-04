import 'package:e_commerce/src/features/map/controllers/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(10.774995938287304, 106.70264429089451),
    zoom: 16,
  );

  final MapController mapController = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (mapController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return Stack(children: [
          GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            markers: mapController.makerList.map((e) => e.maker).toSet(),
          ),
          Positioned(
            top: 60,
            left: 0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10)),
              child: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
              onPressed: () => context.router.pop(),
            ),
          ),
        ]);
      }
    }));
  }
}
