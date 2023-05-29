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
      "../assets/image1.jpg",
      "eu nao sei",
      "asdasdasdad",
      "asdsadasd",
      "asdasdasdasd",
      "asdasdasd"
    ),
    AnaliseImageHistorico(
        "../assets/image2.jpg",
        "eu nao sei",
        "asdasdasdad",
        "asdsadasd",
        "asdasdasdasd",
        "asdasdasd"
    ),
    AnaliseImageHistorico(
        "../assets/image3.jpg",
        "eu nao sei",
        "asdasdasdad",
        "asdsadasd",
        "asdasdasdasd",
        "asdasdasd"
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CodeShark App"),
      ),
      body: ListView.builder(
        itemCount: imageResults.length,
        itemBuilder: (context, index) {
          final result = imageResults[index];

          return ListTile(
            leading: Image.asset(
              result.imagePath,
              width: 60,
              height: 60,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Abre a tela de captura de imagem e análise
        },
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
