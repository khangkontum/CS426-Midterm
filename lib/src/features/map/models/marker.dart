import 'package:e_commerce/src/features/vendors/models/vendor.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StoreMaker {
  StoreMaker({required this.vendorInfo});

  static StoreMaker fromVendor(Vendor vendor) {
    StoreMaker marker = StoreMaker(vendorInfo: vendor);
    marker.maker = Marker(
      markerId: MarkerId(vendor.id.toString()),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueMagenta,
      ),
      infoWindow: InfoWindow(
        title: vendor.name,
      ),
      position: LatLng(vendor.lat, vendor.long),
    );
    return marker;
  }

  late BuildContext context;

  late Marker maker;
  final Vendor vendorInfo;
}
