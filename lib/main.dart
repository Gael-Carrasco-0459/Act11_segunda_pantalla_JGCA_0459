import 'package:flutter/material.dart';

void main() => runApp(const SpideySaurusApp());

class SpideySaurusApp extends StatelessWidget {
  const SpideySaurusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spidey-Saurus',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Spidey-Saurus', style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.yellow,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _NavBarItem(title: 'Inicio'),
                _NavBarItem(title: 'Productos'),
                _NavBarItem(title: 'Conócenos'),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  // Centramos los elementos de la columna principal
                  crossAxisAlignment: CrossAxisAlignment.center, 
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Ropa',
                        style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                    
                    // CAMBIO: De GridView a Column para mostrar uno debajo del otro
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          DinoCardWrapper(
                            imageUrl: 'https://raw.githubusercontent.com/Gael-Carrasco-0459/Act11_segunda_pantalla_JGCA_0459/refs/heads/main/playera.JPG',
                            nombre: 'Playera',
                          ),
                          DinoCardWrapper(
                            imageUrl: 'https://raw.githubusercontent.com/Gael-Carrasco-0459/Act11_segunda_pantalla_JGCA_0459/refs/heads/main/pantalon.jpg',
                            nombre: 'Pantalon',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          // Footer
          Container(
            color: Colors.white,
            width: double.infinity, 
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.network(
                    'https://raw.githubusercontent.com/Gael-Carrasco-0459/Act10_disenio_pagina_JGCA_6J/refs/heads/main/%5BCITYPNG.COM%5DHD%20Jurassic%20Park%20Logo%20Transparent%20Background%20-%202000x2000.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, color: Colors.red),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Jesus Gael Carrasco Avitia',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget intermedio para controlar el tamaño de la tarjeta en la columna
class DinoCardWrapper extends StatelessWidget {
  final String imageUrl;
  final String nombre;
  const DinoCardWrapper({super.key, required this.imageUrl, required this.nombre});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 300, // Altura fija para cada tarjeta
        width: 300,  // Ancho fijo para que se vea centrada y no estirada
        child: DinoCard(imageUrl: imageUrl, nombre: nombre),
      ),
    );
  }
}

// Widget DinoCard (Mantenemos tu lógica pero quitamos el Expanded de la imagen)
class DinoCard extends StatelessWidget {
  final String imageUrl;
  final String nombre;

  const DinoCard({super.key, required this.imageUrl, required this.nombre});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          // Imagen con altura fija dentro de la tarjeta
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Image.network(
                imageUrl, 
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(nombre, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Comprar', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatefulWidget {
  final String title;
  const _NavBarItem({required this.title});
  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  Color _textColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _textColor = Colors.orange),
      onExit: (_) => setState(() => _textColor = Colors.black),
      child: TextButton(
        onPressed: () {},
        child: Text(widget.title, style: TextStyle(color: _textColor, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
