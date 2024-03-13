// ignore_for_file: unused_field, unused_import

import 'package:flutter/material.dart';
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
                    children: <Widget>[
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
}


/* 
//EJEMPLO QUEMADO 1 USANDO Staggered_Grid_View
//https://pub.dev/packages/flutter_staggered_grid_view
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AccessoriesScreen extends StatelessWidget {
  const AccessoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final uniformes = [
      {
        "imagen": 'assets/images/uniforme_EAN.png',
        "nombre": "Uniforme EAN",
        "precio": 100000,
      },
      {
        "imagen": "assets/images/camiseta1.png",
        "nombre": "Camiseta uno",
        "precio": 120000,
      },
      {
        "imagen": "assets/images/camiseta2.png",
        "nombre": "Camiseta dos",
        "precio": 80000,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Uniformes'),
      ),
      body: ListView.builder(
        itemCount: uniformes.length,
        itemBuilder: (context, index) {
          return tile(uniforme: uniformes[index]);
        },
      ), /* 
        body: GridView.custom(
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            pattern: const [
              QuiltedGridTile(2, 2),
              QuiltedGridTile(2, 2),
              QuiltedGridTile(2, 2),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
              (context, index) => tile(uniforme: uniformes[index])),
        ));
         */
    );
  }

  Widget tile({required Map uniforme}) {
    return Card(
      child: Column(
        children: [
          Image.asset(uniforme["imagen"]),
          Text(uniforme["nombre"]),
          Text("\$${uniforme["precio"].toStringAsFixed(2)}"),
        ],
      ),
    );
  }
}
 */