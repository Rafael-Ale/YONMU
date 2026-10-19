import 'package:flutter/material.dart';
import 'package:yonmu_app/app_colors.dart';
import 'package:yonmu_app/features/session/screens/login_screen.dart';

//Punto de entrada de la app
void main() {
  runApp(const MyApp());
}

// Widget raíz de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YONMU',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kOrange1),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoginScreen(), //Primera pantalla que se muestra
    );
  }
}

