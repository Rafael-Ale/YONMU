import 'package:flutter/material.dart';
import 'package:yonmu_app/app_colors.dart';

class PlaceholderPage extends StatelessWidget {
  final String title;
  const PlaceholderPage(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          title,
          style: const TextStyle(color: kInk, fontWeight: FontWeight.w900),
        ),
      ),
      body: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: kOrange1,
            fontSize: 32,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}