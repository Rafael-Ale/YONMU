import 'package:flutter/material.dart';
import 'package:yonmu_app/features/home/widgets/custom_bottom_bar.dart';
import 'package:yonmu_app/features/home/widgets/placeholder_page.dart';
import 'package:yonmu_app/features/discussion_group/screens/create_group_screen.dart';
import 'package:yonmu_app/features/profile/screens/profile_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;

  // 0 Inicio, 1 Favoritos, 2 Posts, 3 Perfil
  final List<Widget> pages = const [
    PlaceholderPage('Inicio'),
    PlaceholderPage('Favoritos'),
    PlaceholderPage('Posts'),
    ProfileScreen(),
  ];

  void _openCreateGroup() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CreateGroupScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: pageIndex, children: pages),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: pageIndex,
        onTap: (i) => setState(() => pageIndex = i),
        onAddTap: _openCreateGroup,
      ),
    );
  }
}