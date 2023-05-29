class AnaliseImage {
  final String imagePath;
  final String cropIdentification;
  final String pestsAndDiseases;
  final String nutrientDeficiency;
  final String irrigationNeed;
  final String recommendations;
  bool isReadyForCollection;

  AnaliseImage(
      this.imagePath,
      this.cropIdentification,
      this.pestsAndDiseases,
      this.nutrientDeficiency,
      this.irrigationNeed,
      this.recommendations,
      this.isReadyForCollection,
      );
}