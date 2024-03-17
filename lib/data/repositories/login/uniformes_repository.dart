//Aquí va clase Uniformes que implementa la lógica de la lista,
//métodos CRUD y la consulta a la base de datos se ubica en la capa
//PAra mantener el principio de clean Architecture

// ignore_for_file: avoid_print

// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:naya_sport_sebas/domain/entities/uniforme.dart';
import 'package:naya_sport_sebas/domain/services/abstract_uniforms_crud.dart';

class UniformesRepository extends UniformesService {
  List<Uniforme> listaUniformes = [];
  //List<Uniforme>? test;

  @override
  //data repository implementa domain repository - define el modelo definido en domain
  //data services implementa domain servicies
  //data services implementa
  //Data domain define
  //Domain repo es la clase abstracta define el qué
  //Data repo define el cómo
  Future<List<Uniforme>> obtenerUniformes() async {
    //URL del endpoint
    //var url = Uri.parse('http://192.168.1.10:3001/api/productos');
    //var url = Uri.parse('http://193.203.175.52:3001/api/productos');
    //var url = Uri.parse('http://192.168.1.10:3001/api/productos');
    //http://127.0.0.1:3001/api/productos

    // Cabeceras
    var headers = {
      'Content-Type': 'application/json',
    };

    // Petición GET
    var response = await http.get(
        Uri.parse('http://192.168.1.10:3001/api/productos'),
        headers: headers);
    print('Estoy recibiendo algo');

    if (response.statusCode == 200) {
      print(response.statusCode);
      print('Ya recibí todo');
      var jsonFromResponse = jsonDecode(response.body);
      List<Uniforme> uniformes =
          jsonFromResponse.map<Uniforme>((e) => Uniforme.fromJson(e)).toList();

      return uniformes;
    } else {
      throw Exception('Error al obtener la lista de productos');
    }
  }

  @override
  void agregarUniforme(Uniforme uniforme) {
    listaUniformes.add(uniforme);
  }

  @override
  void editarUniforme(Uniforme uniforme) {
    int index = listaUniformes.indexOf(uniforme);
    if (index != -1) {
      listaUniformes[index] = uniforme;
    }
  }

  @override
  void eliminarUniforme(Uniforme uniforme) {
    listaUniformes.remove(uniforme);
  }
}
