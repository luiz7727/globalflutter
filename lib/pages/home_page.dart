import 'package:flutter/material.dart';
import 'package:globalflutter/pages/analises_page.dart';
import 'package:globalflutter/pages/historico_page.dart';
import 'package:globalflutter/pages/images_page.dart';
import 'package:ionicons/ionicons.dart';

import 'dashboard_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        DashboardPage(),
        ImagensPage(),
        AnalisesPage(),
        HistoricoPage(),
      ],
    );
  }

  Widget getBottomNavigationBar() {
    final items = [
      const BottomNavigationBarItem(icon: Icon(Ionicons.home), label: 'Home'),
      const BottomNavigationBarItem(icon: Icon(Ionicons.swap_horizontal_outline), label: 'Imagens'),
      const BottomNavigationBarItem(icon: Icon(Ionicons.wallet_outline), label: 'Análises'),
      const BottomNavigationBarItem(icon: Icon(Ionicons.list_outline), label: 'Histórico'),
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
