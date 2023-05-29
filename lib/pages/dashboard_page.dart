import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CodeShark App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Melhoria da qualidade da planta',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Explore os benefícios de usar drones para monitoranmento, análises e etc em plantações com alta qualidade',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Image.asset(
              '../assets/drone.jpg',
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
