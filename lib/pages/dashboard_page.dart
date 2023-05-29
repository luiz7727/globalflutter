import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:globalflutter/model/InfoPlanta.dart';
import 'package:globalflutter/model/PlantData.dart';

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

  int _currentIndex = 0;

  final List<String> names = ['Christian Gaxiola', 'Luiz Antonio', 'Luan Santos'];
  final List<String> rms = ['RM: 88018', 'RM: 87153', 'RM: 87005'];
  final List<String> urlPath = ['assets/christian_gaxiola.jpeg', 'assets/luiz_antonio.jpeg', 'assets/luan_santos.jpeg'];

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
        title: const Text("CodeShark App"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Melhoria da qualidade da planta',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Explore os benefícios de usar drones para monitoramento, análises e etc em plantações com alta qualidade',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Container(
                  height: 300,
                  child: CarouselSlider(
                    items: imagePaths.map((imagePath) {
                      return Image.asset(
                        imagePath,
                        width: 300,
                        height: 300,
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 300,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                      const Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                      onPageChanged: (index, _) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Informações das Plantações',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  children: plantationInfoList.map((info) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[200],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            info.country,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            info.information,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Diferença que o uso de IA faz nas plantações ao passar dos anos',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 160, // Altura reduzida do gráfico
                  child: Column(
                    children: [
                      Expanded(
                        child: charts.BarChart(
                          _createSampleData(),
                          animate: true,
                          defaultRenderer: charts.BarRendererConfig(
                            cornerStrategy:
                            const charts.ConstCornerStrategy(30),
                          ),
                          primaryMeasureAxis: const charts.NumericAxisSpec(
                            tickProviderSpec:
                            charts.BasicNumericTickProviderSpec(
                              desiredTickCount: 5,
                            ),
                          ),
                          domainAxis: const charts.OrdinalAxisSpec(
                            renderSpec: charts.SmallTickRendererSpec(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        ' Números de fazendas que implementaram a IA',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Perfil dos Líderes',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildPersonWidget(names[0],urlPath[0], rms[0]),
                    _buildPersonWidget(names[1],urlPath[1], rms[1]),
                    _buildPersonWidget(names[2],urlPath[2], rms[2]),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPersonWidget(String name,String photo, String rm) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(photo),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          rm,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  List<charts.Series<PlantData, String>> _createSampleData() {
    final data = [
      PlantData('2020', 10),
      PlantData('2021', 15),
      PlantData('2022', 20),
      PlantData('2023', 35),
    ];

    return [
      charts.Series<PlantData, String>(
        id: 'PlantData',
        domainFn: (PlantData data, _) => data.category,
        measureFn: (PlantData data, _) => data.value,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        data: data,
        labelAccessorFn: (PlantData data, _) => '${data.value}',
      ),
    ];
  }
}

