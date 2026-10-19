import 'package:flutter/material.dart';
import 'package:yonmu_app/app_colors.dart';
import 'package:yonmu_app/features/home/screens/home_screen.dart';
import 'package:yonmu_app/features/session/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _hidePass = true;

    void _login() {
    // TODO: aquí irá la verificación con la base de datos
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MyHomePage()),
    );
  }

  void _register(){
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (_) => const RegisterScreen())
    );
  }


  InputDecoration _inputStyle(String label, IconData icon, {Widget? suffix}) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: kOrange1),
      suffixIcon: suffix,
      filled: true,
      fillColor: kCream,
      floatingLabelStyle: const TextStyle(color: kOrange1),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: kLine, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: kOrange1, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView( //Para evitar que me salga el error de overflow cuando abro el teclado
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundColor: Color(0xFFFFE6D6),
                child: Icon(Icons.person, color: kOrange1, size: 60),
              ),
              const SizedBox(height: 16),
              const Text(
                'Bienvenido de vuelta',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: kInk,
                ),
              ),
              const SizedBox(height: 28),

              // Correo o usuario
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: _inputStyle(
                  'Correo o nombre de usuario',
                  Icons.person_outline,
                ),
              ),
              const SizedBox(height: 16),

              // Contraseña con ojito
              TextFormField(
                obscureText: _hidePass,
                textInputAction: TextInputAction.done,
                decoration: _inputStyle(
                  'Contraseña',
                  Icons.lock_outline,
                  suffix: IconButton(
                    icon: Icon(
                      _hidePass
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: kOrange1,
                    ),
                    onPressed: () => setState(() => _hidePass = !_hidePass),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: kOrange1,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                onPressed: _login,
                child: const Text('Iniciar sesión'),
              ),
              const SizedBox(height: 12),

              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: kOrange1,
                  side: const BorderSide(color: kOrange1, width: 1.5),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _register,
                child: const Text('Crear cuenta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}