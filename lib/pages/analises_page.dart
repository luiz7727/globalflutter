import 'package:flutter/material.dart';
import 'package:globalflutter/model/AnaliseImage.dart';

class AnalisesPage extends StatefulWidget {
  const AnalisesPage({Key? key}) : super(key: key);

  @override
  State<AnalisesPage> createState() => _AnalisesPageState();
}

class _AnalisesPageState extends State<AnalisesPage> {

  final List<AnaliseImage> imageResults = [
    AnaliseImage(
      'assets/image1.jpg', // Caminho da imagem
      'Trigo', // Identificação da cultura
      'N/A', // Detecção de pragas e doenças
      'Deficiência de nitrogênio', // Deficiência de nutrientes
      'Alta necessidade de irrigação', // Necessidade de irrigação
      'Aplicar fertilizante nitrogenado e aumentar a irrigação', // Recomendações
    ),
    AnaliseImage(
      'assets/image1.jpg', // Caminho da imagem
      'Trigo', // Identificação da cultura
      'N/A', // Detecção de pragas e doenças
      'Deficiência de nitrogênio', // Deficiência de nutrientes
      'Alta necessidade de irrigação', // Necessidade de irrigação
      'Aplicar fertilizante nitrogenado e aumentar a irrigação', // Recomendações
    ),
    AnaliseImage(
      'assets/image1.jpg', // Caminho da imagem
      'Trigo', // Identificação da cultura
      'N/A', // Detecção de pragas e doenças
      'Deficiência de nitrogênio', // Deficiência de nutrientes
      'Alta necessidade de irrigação', // Necessidade de irrigação
      'Aplicar fertilizante nitrogenado e aumentar a irrigação', // Recomendações
    ),
    // Adicione mais resultados de análise de imagem conforme necessário
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
                width: 250,
                height: 250,
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
        )
    );
  }
}
