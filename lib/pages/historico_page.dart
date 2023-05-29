import 'package:flutter/material.dart';
import 'package:globalflutter/model/AnaliseImageHistorico.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({Key? key}) : super(key: key);

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  List<AnaliseImageHistorico> imageResults = [
    AnaliseImageHistorico(
      "assets/image1.jpg",
      "Mexicana",
      "asdasdasdad",
      "asdsadasd",
      "asdasdasdasd",
      "asdasdasd",
    ),
    AnaliseImageHistorico(
      "assets/image2.jpg",
      "Japonesa",
      "asdasdasdad",
      "asdsadasd",
      "asdasdasdasd",
      "asdasdasd",
    ),
    AnaliseImageHistorico(
      "assets/image3.jpg",
      "Brasileira",
      "asdasdasdad",
      "asdsadasd",
      "asdasdasdasd",
      "asdasdasd",
    ),
  ];

  List<AnaliseImageHistorico> filteredResults = [];

  @override
  void initState() {
    super.initState();
    filteredResults.addAll(imageResults);
  }

  void filterResults(String query) {
    if (query.isNotEmpty) {
      setState(() {
        filteredResults = imageResults
            .where((result) =>
            result.cropIdentification.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        filteredResults.clear();
        filteredResults.addAll(imageResults);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CodeShark App"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => filterResults(value),
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredResults.length,
              itemBuilder: (context, index) {
                final result = filteredResults[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 250,
                        child: Image.asset(
                          result.imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Cultura: ${result.cropIdentification}'),
                      SizedBox(height: 4),
                      Text('Pragas e doenças: ${result.pestsAndDiseases}'),
                      SizedBox(height: 4),
                      Text('Deficiência de nutrientes: ${result.nutrientDeficiency}'),
                      SizedBox(height: 4),
                      Text('Necessidade de irrigação: ${result.irrigationNeed}'),
                      SizedBox(height: 4),
                      Text('Recomendações: ${result.recommendations}'),
                      Divider(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}