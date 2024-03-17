// ignore_for_file: unused_field, unused_import, avoid_print

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:naya_sport_sebas/data/repositories/login/uniformes_repository.dart';
import 'package:naya_sport_sebas/domain/entities/uniforme.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_grid/responsive_grid.dart';

class AccessoriesScreen extends StatefulWidget {
  const AccessoriesScreen({super.key});

  @override
  State<AccessoriesScreen> createState() => _AccessoriesScreenState();
}

class _AccessoriesScreenState extends State<AccessoriesScreen> {
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
      debugPrint('prellamada asíncrona');
      final uniformes = await uniform.obtenerUniformes();
      debugPrint('posllamada asíncrona');
      setState(() {
        _uniformes = uniformes;
      });
    } catch (e) {
      print('Error. No es posible obtener los uniformes $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accesorios'),
      ),
      body: ResponsiveGridList(
        desiredItemWidth: 200,
        children: _uniformes
            .map((uniforme) => Card(
                  child: Column(
                    children: [
                      uniforme.imagen.isEmpty
                          ? const Icon(Icons.error)
                          : Image.memory(
                              _extractAndDecodeBase64Image(
                                  uniforme.imagen.toString()),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Text(
                                  'Error loading image: ${error.toString()}',
                                );
                              },
                            ),
                      ListTile(
                        //leading: Icon(Icons.album), IMAGE
                        title: Text(uniforme.nombre.toString()),
                        subtitle: Text(uniforme.precioVenta.toString()),
                      ),
                      Column(
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
                ))
            .toList(),
      ),
    );
  }

// Helper function to extract and decode Base64 image safely
  Uint8List _extractAndDecodeBase64Image(dynamic imagenData) {
    //debugPrint(imagenData);
    if (imagenData is String && imagenData.isNotEmpty) {
      try {
        debugPrint('imagen es string y no es empty, decodificando');
        return base64.decode(imagenData);
        /*    return base64.decode(imagenData
            .substring(20)
            .replaceAll(RegExp(r'[{}]'), '')
            .replaceAll(RegExp(r'\[|\]'), '')
            .replaceAll(RegExp(r'\s'), '')
            .replaceAll(RegExp(r','), '')); */
        // return base64.decode(imagenData.substring(22).replaceAll(RegExp(r'[{}]'), ''));
        // return base64Decode(imagenData.replaceAll(RegExp(r'[{}]'), ''));
      } catch (error) {
        print('Error decoding Base64 image: $error');
        return Uint8List(0); // Empty list on error
      }
    } else {
      debugPrint('imagen no es String o is empty');
      return Uint8List(0); // Empty list if imagenData is not a String
    }
  }
}
