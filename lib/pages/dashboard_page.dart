import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:globalflutter/model/InfoPlanta.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<String> imagePaths = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
  ];

  final List<String> names = ['Christian Gaxiola', 'Luiz Antonio', 'Luan Santos'];
  final List<String> rms = ['RM: 88018', 'RM: 87153', 'RM: 87005'];

  final List<InfoPlanta> plantationInfoList = [
    InfoPlanta(
      country: 'Mexico',
      information:
      'Mexico has a rich agricultural heritage and diverse crop cultivation. Plantations in Mexico utilize advanced technologies like drones for monitoring and analysis.',
    ),
    InfoPlanta(
      country: 'Japan',
      information:
      'Japan is known for its precision agriculture practices. Plantations in Japan focus on optimizing crop quality and yield through advanced techniques and technologies.',
    ),
    InfoPlanta(
      country: 'Brazil',
      information:
      'Brazil is a major player in the global agriculture industry. Plantations in Brazil make use of innovative approaches like drone-based spraying and data-driven crop management.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plantation Drones'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            Text(
              'Welcome to Plantation Drones!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Explore the benefits of using drones in plantations for monitoring, crop analysis, and more.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32.0),
            const Text(
              'Plant Quality Improvement',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            CarouselSlider(
              items: imagePaths.map((imagePath) {
                return Image.asset(
                  imagePath,
                  width: 200,
                  height: 200,
                );
              }).toList(),
              options: CarouselOptions(
                height: 200,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            const SizedBox(height: 40.0),
            const Text(
              'Plantations by Country',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            Column(
              children: plantationInfoList.map((info) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.grey[200],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        info.country,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        info.information,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 40.0),
            const Text(
              'Initiative Leaders',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPersonWidget(names[0], rms[0]),
                _buildPersonWidget(names[1], rms[1]),
                _buildPersonWidget(names[2], rms[2]),
              ],
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonWidget(String name, String rm) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/person_avatar.png'),
        ),
        const SizedBox(height: 8.0),
        Text(
          name,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4.0),
        Text(
          rm,
          style: const TextStyle(fontSize: 14.0),
        ),
      ],
    );
  }
}