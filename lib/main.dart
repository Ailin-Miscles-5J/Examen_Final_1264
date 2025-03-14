import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductosScreen(),
    );
  }
}

class ProductosScreen extends StatelessWidget {
  // Mapa de datos de productos
  final Map<String, dynamic> datos_productos = {
    'producto1': {
      'Nombre': 'Producto 1',
      'ID producto': '001',
      'precio': 19.99,
      'stock': 10,
      'imagen':
          'https://raw.githubusercontent.com/Ailin-Miscles-5J/ExamenFinal_1264/refs/heads/main/Joyeria-y-accesorios-2024-Lo-que-no-te-puede-faltar-scaled.jpg', // URL de imagen de ejemplo
    },
    'producto2': {
      'Nombre': 'Producto 2',
      'ID producto': '002',
      'precio': 29.99,
      'stock': 5,
      'imagen':
          'https://raw.githubusercontent.com/Ailin-Miscles-5J/ExamenFinal_1264/refs/heads/main/Variedad-de-joyas-de-oro-14k-min.jpg',
    },
    'producto3': {
      'Nombre': 'Producto 3',
      'ID producto': '003',
      'precio': 39.99,
      'stock': 2,
      'imagen':
          'https://raw.githubusercontent.com/Ailin-Miscles-5J/ExamenFinal_1264/refs/heads/main/b06119c4b6394092a10ae8aa15438e27.jpg',
    },
    'producto4': {
      'Nombre': 'Producto 4',
      'ID producto': '004',
      'precio': 49.99,
      'stock': 8,
      'imagen':
          'https://raw.githubusercontent.com/Ailin-Miscles-5J/ExamenFinal_1264/refs/heads/main/oro-660x371.jpg',
    },
    'producto5': {
      'Nombre': 'Producto 4',
      'ID producto': '004',
      'precio': 49.99,
      'stock': 8,
      'imagen':
          'https://raw.githubusercontent.com/Ailin-Miscles-5J/ExamenFinal_1264/refs/heads/main/proveedores-de-joyeria-mexico-1200x685.jpg',
    },
  };

  @override
  Widget build(BuildContext context) {
    // Convertir el mapa a una lista de productos
    List produtos = datos_productos.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Productos',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // Acción del botón leading
          },
        ),
      ),
      body: Column(
        children: [
          // Lista de productos
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: produtos.map((producto) {
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Color de fondo
                      borderRadius:
                          BorderRadius.circular(12.0), // Bordes redondeados
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Sombra
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            producto['imagen']), // Avatar con imagen
                      ),
                      title: Text(
                        producto['Nombre'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold), // Nombre en negrita
                      ),
                      subtitle: Text(
                        '\$${producto['precio'].toString()}',
                        style: TextStyle(
                            color: Colors.blue), // Precio en color azul
                      ),
                      trailing: Text('Stock: ${producto['stock']}'),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          // Texto en la parte inferior
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.blueAccent,
            width: double.infinity,
            child: Text(
              'Citlali Miscles 1264',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
