import 'package:flutter/material.dart';

import '../model/DroneImage.dart';

class ImagensPage extends StatefulWidget {
  const ImagensPage({Key? key}) : super(key: key);

  @override
  State<ImagensPage> createState() => _ImagensPageState();
}

class _ImagensPageState extends State<ImagensPage> {

  final List<DroneImage> droneImages = [
    DroneImage('assets/image1.jpg', 40.712776, -74.005974),
    DroneImage('assets/image2.jpg', 51.5074, -0.1278),
    DroneImage('assets/image3.jpg', 48.8566, 2.3522),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CodeShark App"),
      ),
      body: ListView.builder(
        itemCount: droneImages.length,
        itemBuilder: (context, index) {
          final image = droneImages[index];
          final id = generateId(image.latitude, image.longitude);

          return ListTile(
            leading: Image.asset(
              image.path,
              width: 60,
              height: 60,
            ),
            title: Text('ID: $id'),
          );
        },
      ),
    );
  }

  String generateId(double latitude, double longitude) {
    final lat = latitude.toStringAsFixed(2);
    final lon = longitude.toStringAsFixed(2);
    return 'ID-$lat-$lon';
  }
}
