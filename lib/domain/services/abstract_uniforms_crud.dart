import 'package:naya_sport_sebas/domain/entities/uniforme.dart';

abstract class UniformesService {
  Future<List<Uniforme>> obtenerUniformes();

  void agregarUniforme(Uniforme uniforme);

  void editarUniforme(Uniforme uniforme);

  void eliminarUniforme(Uniforme uniforme);
}
