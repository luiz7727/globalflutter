import 'package:flutter/material.dart';
import 'package:globalflutter/pages/dashboard_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  int indice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: indice,
      children: const [
        DashboardPage()
      ],
    );
  }

  Widget getBottomNavigationBar() {
    final items = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Histórico'),
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Análises'),
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Imagens'),
    ];

    return BottomNavigationBar(
      currentIndex: indice,
      items: items,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          indice = index;
        });
      },
    );
  }
}