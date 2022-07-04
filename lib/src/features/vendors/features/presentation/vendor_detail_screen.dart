import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class VendorDetailScreen extends StatelessWidget {
  const VendorDetailScreen({
    Key? key,
    required this.vendorId,
  }) : super(key: key);

  final String vendorId;

  @override
  Widget build(BuildContext context) {
    print('tmp');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(), padding: const EdgeInsets.all(2)),
            child: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
            onPressed: () => context.router.pop(),
          ),
        ),
        body: DetailBody(
          vendorId: vendorId,
        ));
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({Key? key, required this.vendorId}) : super(key: key);
  final String vendorId;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
