import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/src/features/vendors/models/vendor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';

class VendorTile extends StatelessWidget {
  const VendorTile({
    Key? key,
    required this.vendor,
    required this.onTap,
  }) : super(key: key);

  final Vendor vendor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0.5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.network(
                      vendor.imageLink,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
