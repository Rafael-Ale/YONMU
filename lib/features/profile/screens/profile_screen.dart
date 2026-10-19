import 'package:flutter/material.dart';
import 'package:yonmu_app/app_colors.dart';

class ProfileScreen extends StatelessWidget{

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Color(0xFFFFE6D6),
                child: Icon(
                  Icons.person,
                  color: Colors.deepOrange,
                  size: 60.0
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '@username',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold,
                  color: kInk,
                  )
              ),
              const SizedBox(height: 4,),
              Text(
                'correo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14, 
                  fontStyle: FontStyle.italic,
                  color:kInkSoft,
                )
              ),
              const SizedBox(height: 24),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: kOrange1,
                  side: const BorderSide(color:kOrange1, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical:12),
                  ),
                  onPressed: (){
                    //TODO: Abrir galeria / cámara
                  },
                  icon: const Icon(Icons.camera_alt_outlined),
                  label: const Text('Editar foto de perfil'),
                
               ),
              ],
            ),
          ),
        ),
    );
  }
}