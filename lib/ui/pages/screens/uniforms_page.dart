import 'package:flutter/material.dart';
import 'package:naya_sport_sebas/data/repositories/login/uniformes_repository.dart';
import 'package:naya_sport_sebas/domain/entities/uniforme.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UniformsScreen extends StatefulWidget {
  const UniformsScreen({super.key});

  @override
  State<UniformsScreen> createState() => _UniformsScreenState();
}

class _UniformsScreenState extends State<UniformsScreen> {
  final UniformesRepository _uniformesRepository = UniformesRepository();
  List<Uniforme> _uniformes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uniformes'),
      ),
      //body: _uniformes.isEmpty
      /* ? const Center(child: CircularProgressIndicator())
            : StaggeredGrid.count(
                crossAxisCount: 4,
              ) */
      /* itemCount: _uniformes.length,
              itemBuilder: (context, index) {
                Uniforme uniforme = _uniformes[index];
                return Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        uniforme.imagen != null
                            ? uniforme.imagen!
                            : 'path/to/default_image.png',
                      ),
                      Text(
                        uniforme.nombre != null
                            ? uniforme.nombre!
                            : 'No name available',
                      ),
                      Text(
                          "\$${uniforme.precioVenta?.toStringAsFixed(2)}"), // Assuming precioVenta is double
                    ],
                  ),
                );
              },
              staggeredTileBuilder: (index) => StaggeredTile.fit(2),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ), */
    );
  }

  @override
  void initState() {
    super.initState();
    _cargarUniformes();
  }

  void _cargarUniformes() async {
    _uniformes = _uniformesRepository.obtenerUniformes();
    setState(() {});
  }
}
