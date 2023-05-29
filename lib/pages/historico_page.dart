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

                return ListTile(

                  leading: SizedBox(
                    width: 250,
                    height: 250,
                    child: Image.asset(
                      result.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text('Cultura: ${result.cropIdentification}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pragas e doenças: ${result.pestsAndDiseases}'),
                      Text('Deficiência de nutrientes: ${result.nutrientDeficiency}'),
                      Text('Necessidade de irrigação: ${result.irrigationNeed}'),
                      Text('Recomendações: ${result.recommendations}'),
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