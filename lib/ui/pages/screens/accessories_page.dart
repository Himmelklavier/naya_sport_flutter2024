//EJEMPLO QUEMADO 2 USANDO responsive_Grid
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class AccessoriesScreen extends StatelessWidget {
  const AccessoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final uniformes = [
      {
        "imagen": "assets/images/uniforme_EAN.png",
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
        title: const Text('Accesorios'),
      ),
      body: ResponsiveGridList(
        desiredItemWidth: 200,
        children: uniformes
            .map((uniforme) => Card(
                  child: Column(
                    children: [
                      Image.asset(uniforme["imagen"] as String),
                      Text(uniforme["nombre"] as String),
                      Text("\$${uniforme["precio"]!.toString}"),
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