import 'package:flutter/material.dart';

class Carta {
  final String nombre;
  final String info;
  final String urlImagen;
  Carta({required this.nombre, required this.info, required this.urlImagen});
}

class PantallaCarrito extends StatelessWidget {
  const PantallaCarrito({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Carta> misCartas = [
      Carta(nombre: 'Pikachu', info: 'Pokémon TCG - Base Set', urlImagen: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png'),
      Carta(nombre: 'Mago Oscuro', info: 'Yu-Gi-Oh! - Duel Monsters', urlImagen: 'https://raw.githubusercontent.com/VillaSarabia/imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/SM75_LA_55.png'),
      Carta(nombre: 'Charizard', info: 'Pokémon TCG - Fire Type', urlImagen: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png'),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A76C5),
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
        title: const Text('CARRITO', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(border: Border.all(color: const Color(0xFF0D2C44), width: 2), color: const Color(0xFFE0E0E0)),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: const Color(0xFFCCCCCC),
                    child: const Row(children: [Icon(Icons.shopping_cart), SizedBox(width: 10), Text('Compras', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))]),
                  ),
                  Expanded(child: ListView.builder(itemCount: misCartas.length, itemBuilder: (context, index) => ElementoCarrito(carta: misCartas[index]))),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _botonAzul(context, 'Comprar', () {}),
                        const SizedBox(width: 20),
                        _botonAzul(context, 'Volver', () => Navigator.pop(context)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Información de la tienda'),
                _botonAzul(context, 'Tienda Física', () => Navigator.pushNamed(context, '/tiendas')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _botonAzul(BuildContext context, String texto, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4A76C5)),
      child: Text(texto, style: const TextStyle(color: Colors.white)),
    );
  }
}

class ElementoCarrito extends StatelessWidget {
  final Carta carta;
  const ElementoCarrito({super.key, required this.carta});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(carta.urlImagen, width: 40),
      title: Text(carta.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(carta.info),
      trailing: const Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.add_circle_outline), SizedBox(width: 10), Icon(Icons.remove_circle_outline)]),
    );
  }
}