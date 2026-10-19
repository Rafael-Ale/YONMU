import 'package:flutter/material.dart';
import 'package:yonmu_app/app_colors.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex; // Numero de pestaña activa
  final ValueChanged<int> onTap; // Función que se ejecuta al tocar un icono
  final VoidCallback onAddTap; // Funcion que se ejecuta al tocar el icono +

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.onAddTap,
  });

//Geeks for Geeks lo maneja solamente como Container, pero se esta utilizando 
//Algo que me da un valor, y que mantiene una pantalla, por eso lo converti en widget

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(top: BorderSide(color: kLine)),
        boxShadow: [
          BoxShadow(
            color: kOrange3.withAlpha(25),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea( //Respetar el área de gestos del telefono, evita que la barra quede debajo de la franja de gestos
        top: false,
        child: SizedBox( //Alto fijo de 64 
          height: 64,
          child: Stack( //Apila widgets uno arriba de otro, y con clip none, evito que recorte lo que se sale de los límites, osea permite que + no se recorte
            clipBehavior: Clip.none,
            children: [
              Row(
                children: [
                  _NavItem(
                    icon: Icons.home_outlined,
                    activeIcon: Icons.home,
                    label: 'Inicio',
                    selected: currentIndex == 0,
                    onTap: () => onTap(0),
                  ),
                  _NavItem(
                    icon: Icons.favorite_border,
                    activeIcon: Icons.favorite,
                    label: 'Favoritos',
                    selected: currentIndex == 1,
                    onTap: () => onTap(1),
                  ),
                  const Expanded(child: SizedBox()), // hueco para el +
                  _NavItem(
                    icon: Icons.chat_bubble_outline,
                    activeIcon: Icons.chat_bubble,
                    label: 'Posts',
                    selected: currentIndex == 2,
                    onTap: () => onTap(2),
                  ),
                  _NavItem(
                    icon: Icons.person_outline,
                    activeIcon: Icons.person,
                    label: 'Perfil',
                    selected: currentIndex == 3,
                    onTap: () => onTap(3),
                  ),
                ],
              ),
              Positioned(
                top: -22,
                left: 0,
                right: 0,
                child: Center(child: _AddButton(onTap: onAddTap)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Botón + 
class _AddButton extends StatelessWidget {
  final VoidCallback onTap;
  const _AddButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: kButtonGradient,
          border: Border.all(color: Colors.white, width: 4),
          boxShadow: [
            BoxShadow(
              color: kOrange3.withAlpha(100),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}

//Solo lo usa bottomBar,así que no se hará una clase en models
class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.selected,
    required this.onTap,
  });


// Dibuja cada icono en su texto, si esta seleccionada es naranja, si no, gris.
  @override
  Widget build(BuildContext context) {
    final color = selected ? kOrange1 : kInkSoft;
    return Expanded(
      child: InkWell( //Lo que hace que se iluine el icono segun yo xd
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(selected ? activeIcon : icon, color: color, size: 26),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}