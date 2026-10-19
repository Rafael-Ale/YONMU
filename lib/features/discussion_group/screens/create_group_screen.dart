import 'package:flutter/material.dart';
import 'package:yonmu_app/app_colors.dart';

class CreateGroupScreen extends StatelessWidget {
  const CreateGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: kInk),
        title: const Text(
          'Nuevo grupo',
          style: TextStyle(color: kInk, fontWeight: FontWeight.w900),
        ),
      ),
      body: const Center(child: Text('Formulario de crear grupo')),
    );
  }
}