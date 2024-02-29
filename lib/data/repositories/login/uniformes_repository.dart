//Aquí va clase Uniformes que implementa la lógica de la lista,
//métodos CRUD y la consulta a la base de datos se ubica en la capa
//PAra mantener el principio de clean Architecture

import 'package:naya_sport_sebas/domain/entities/uniforme.dart';

class UniformesRepository {
  List<Uniforme> listaUniformes = [];

  List<Uniforme> obtenerUniformes() {
    return listaUniformes;
  }

  void agregarUniforme(Uniforme uniforme) {
    listaUniformes.add(uniforme);
  }

  void editarUniforme(Uniforme uniforme) {
    int index = listaUniformes.indexOf(uniforme);
    if (index != -1) {
      listaUniformes[index] = uniforme;
    }
  }

  void eliminarUniforme(Uniforme uniforme) {
    listaUniformes.remove(uniforme);
  }
}
