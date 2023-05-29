import 'package:flutter/material.dart';
import 'package:globalflutter/componentes/nav_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(),
      appBar: AppBar(
        title: Text("CodeShark App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bem-vindo à Dashboard',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Subtítulo da Dashboard',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/dashboard_image.png', // Coloque o caminho da imagem aqui
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
