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
      false, // Button state (initially uncollected)
    ),
    AnaliseImage(
      'assets/image2.jpg', // Caminho da imagem
      'Trigo', // Identificação da cultura
      'N/A', // Detecção de pragas e doenças
      'Deficiência de nitrogênio', // Deficiência de nutrientes
      'Alta necessidade de irrigação', // Necessidade de irrigação
      'Aplicar fertilizante nitrogenado e aumentar a irrigação', // Recomendações
      false, // Button state (initially uncollected)
    ),
    AnaliseImage(
      'assets/image3.jpg', // Caminho da imagem
      'Trigo', // Identificação da cultura
      'N/A', // Detecção de pragas e doenças
      'Deficiência de nitrogênio', // Deficiência de nutrientes
      'Alta necessidade de irrigação', // Necessidade de irrigação
      'Aplicar fertilizante nitrogenado e aumentar a irrigação', // Recomendações
      false, // Button state (initially uncollected)
    ),
    // Adicione mais resultados de análise de imagem conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CodeShark App"),
      ),
      body: ListView.builder(
        itemCount: imageResults.length,
        itemBuilder: (context, index) {
          final result = imageResults[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        result.imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Positioned(
                        bottom: 10,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              result.isReadyForCollection =
                              !result.isReadyForCollection;
                            });
                          },
                          style: ElevatedButton.styleFrom(primary: result.isReadyForCollection == true ? Colors.green : Colors.red,
                          ),
                          child: Text(
                            result.isReadyForCollection
                                ? 'Pronto'
                                : 'Crescendo',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text('Cultura: ${result.cropIdentification}'),
                const SizedBox(height: 4),
                Text('Pragas e doenças: ${result.pestsAndDiseases}'),
                const SizedBox(height: 4),
                Text('Deficiência de nutrientes: ${result.nutrientDeficiency}'),
                const SizedBox(height: 4),
                Text('Necessidade de irrigação: ${result.irrigationNeed}'),
                const SizedBox(height: 4),
                Text('Recomendações: ${result.recommendations}'),
                const Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}