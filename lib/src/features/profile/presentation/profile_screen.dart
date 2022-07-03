import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Picture(),
        SizedBox(height: 20),
        Field(
            fieldIcon: Icon(Icons.person_outline_sharp),
            fieldTittle: 'My Account'),
        Field(
            fieldIcon: Icon(Icons.phone_outlined), fieldTittle: 'Phone Number'),
        Field(fieldIcon: Icon(Icons.home_outlined), fieldTittle: 'Address'),
        Field(fieldIcon: Icon(Icons.flag_outlined), fieldTittle: 'Country'),
      ],
    );
  }
}

class Field extends StatelessWidget {
  const Field({
    Key? key,
    required this.fieldTittle,
    required this.fieldIcon,
  }) : super(key: key);

  final Icon fieldIcon;
  final String fieldTittle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: OutlinedButton(
          onPressed: () {},
          child: Row(
            children: [
              fieldIcon,
              const SizedBox(width: 20),
              AutoSizeText(
                fieldTittle,
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: Colors.black,
                    ),
              )
            ],
          )),
    );
  }
}

class Picture extends StatelessWidget {
  const Picture({
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
            backgroundImage: AssetImage("image/khh_logo.png"),
            backgroundColor: Colors.transparent,
          )
        ],
      ),
    );
  }
}
