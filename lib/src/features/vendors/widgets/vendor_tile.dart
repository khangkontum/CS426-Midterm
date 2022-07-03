import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce/src/features/vendors/models/vendor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorTile extends StatelessWidget {
  const VendorTile({Key? key, required this.vendor}) : super(key: key);

  final Vendor vendor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 80,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.asset(
                    'image/${vendor.imageLink}',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: AutoSizeText(
                vendor.name,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            const SizedBox(height: 8),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: AutoSizeText(
                vendor.address.toString(),
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            const SizedBox(height: 8),
            // Text('\$${vendor.price}',
            //     style: TextStyle(fontSize: 32, fontFamily: 'avenir')),
          ],
        ),
      ),
    );
  }
}
