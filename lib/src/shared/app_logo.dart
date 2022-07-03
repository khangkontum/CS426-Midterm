import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Stack(
        fit: StackFit.expand,
        children: const [
          CircleAvatar(
            backgroundImage: AssetImage("assets/image/khh_logo.png"),
            backgroundColor: Colors.transparent,
          )
        ],
      ),
    );
  }
}
