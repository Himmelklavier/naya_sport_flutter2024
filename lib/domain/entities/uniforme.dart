class Uniforme {
  final String? referencia;
  final double? precioInt;
  final double? precioVenta;
  final String? imagen;
  final String? dimensiones;
  final String? nombre;
  final String? descripcion;
  final bool estado;
  final String? marca;
  final DateTime? fechaIngreso;
  final int stockTallajeId;
  final int categoriaId;
  //EL signo de interrogación es para los parámetros que permiten nulo en la BD

  Uniforme({
    this.referencia,
    this.precioInt,
    this.precioVenta,
    this.imagen,
    this.dimensiones,
    this.nombre,
    this.descripcion,
    this.estado = true,
    this.marca,
    this.fechaIngreso,
    required this.stockTallajeId,
    required this.categoriaId,
  });

//Este factory constructores para crear un objecto desde un JSON map.
//This is useful when parsing data received from an API or database.
  factory Uniforme.fromJson(Map<String, dynamic> json) {
    return Uniforme(
      referencia: json['referencia'],
      precioInt: double.tryParse(json['precio_int']),
      precioVenta: double.tryParse(json['precio_venta']),
      imagen: json['imagen'],
      dimensiones: json['dimensiones'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      estado: json['estado'] ?? true,
      marca: json['marca'],
      fechaIngreso: DateTime.tryParse(json['fecha_ingreso']),
      stockTallajeId: json['StockTallaje_idStockTallaje'],
      categoriaId: json['Categoria_idCategoria'],
    );
  }

//This method converts a Uniforme object back to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'referencia': referencia,
      'precio_int': precioInt?.toString(),
      'precio_venta': precioVenta?.toString(),
      'imagen': imagen,
      'dimensiones': dimensiones,
      'nombre': nombre,
      'descripcion': descripcion,
      'estado': estado,
      'marca': marca,
      'fecha_ingreso': fechaIngreso?.toString(),
      'StockTallaje_idStockTallaje': stockTallajeId,
      'Categoria_idCategoria': categoriaId,
    };
  }
}
