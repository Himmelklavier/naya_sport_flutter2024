// ignore_for_file: unused_field, unused_import

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:naya_sport_sebas/data/repositories/login/uniformes_repository.dart';
import 'package:naya_sport_sebas/domain/entities/uniforme.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UniformsScreen extends StatefulWidget {
  const UniformsScreen({super.key});

  @override
  State<UniformsScreen> createState() => _UniformsScreenState();
}

class _UniformsScreenState extends State<UniformsScreen> {
  final UniformesRepository _uniformesRepository = UniformesRepository();
  var uniform = GetIt.I<UniformesRepository>();
  // ignore: prefer_final_fields
  List<Uniforme> _uniformes = [];
  //Tipo de datos dinámicos como lista genérica o por seguridad mejor tipo de dato objeto uniforme?
  //List<Uniforme> _uniformes = [];

  @override
  void initState() {
    super.initState();
    _cargarUniformes();
  }

  Future<void> _cargarUniformes() async {
    try {
      print('prellamada asíncrona');
      final uniformes = await uniform.obtenerUniformes();
      print('posllamada asíncrona');
      setState(() {
        _uniformes = uniformes;
      });
    } catch (e) {
      // ignore: avoid_print
      print('Error. No es posible obtener los uniformes $e');
    }
    //Cargar los datos aquí
    //Crear widget card genérico
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uniformes'),
      ),
      body: _buildUniformesGrid(), // Implementa tu cuadrícula o lista aquí
    );
  }

  Widget _buildUniformesGrid() {
    // Implementa tu cuadrícula o lista de uniformes aquí
    // Puedes usar GridView o ListView.builder
    // Ejemplo:
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // Número de columnas
      ),
      //obtener número de items en la lista de uniformes
      itemCount: _uniformes.length,
      //definir un constructor para cada item, dentro de este constructor se inlcuye
      //La cosntrucción de cada card
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                //leading: Icon(Icons.album), IMAGE
                title: Text('${_uniformes[index].nombre}'),
                subtitle: Text('${_uniformes[index].precioVenta}'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('Comprar'),
                    onPressed: () {/* ... */},
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Text('Agregar al Carrito'),
                    onPressed: () {/* ... */},
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
