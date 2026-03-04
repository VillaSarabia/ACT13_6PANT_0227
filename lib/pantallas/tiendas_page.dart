import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TiendasFisicasPage(),
  ));
}

class TiendasFisicasPage extends StatelessWidget {
  const TiendasFisicasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF8BA4D0), // Azul claro del boceto
        leading: const Icon(Icons.menu, color: Colors.black, size: 30),
        title: const Text(
          'Tiendas Fisicas',
          style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.shopping_cart_outlined, color: Colors.black, size: 30),
          SizedBox(width: 10),
        ],
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Botón de regresar
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_back, size: 30),
            ),

            // Selector de ciudad (CD Juarez)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.location_on, color: Colors.red, size: 20),
                        SizedBox(width: 5),
                        Text("CD Juarez", style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text("-  +", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Tienda 1: Las Misiones
            const StoreItem(
              name: "Las misiones - DeckTCG",
              // URL de imagen de la web (Sustituye por tu link)
              mapUrl: "https://raw.githubusercontent.com/VillaSarabia/imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/ihop-cd-jz-misiones-768x768.jpeg",
              showDetail: true,
              detailText: "Tienda Física\nlocal #32\nsegundo piso",
              storeImageUrl: "https://raw.githubusercontent.com/VillaSarabia/imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/misiones.jpeg",
            ),

            const SizedBox(height: 20),

            // Tienda 2: Las Torres
            const StoreItem(
              name: "Las Torres - DeckTCG",
              // URL de imagen de la web (Sustituye por tu link)
              mapUrl: "https://raw.githubusercontent.com/VillaSarabia/imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/principal_torres-e-independencia-ampliacion.jpg",
              showDetail: false,
            ),
          ],
        ),
      ),
    );
  }
}

class StoreItem extends StatelessWidget {
  final String name;
  final String mapUrl;
  final bool showDetail;
  final String? detailText;
  final String? storeImageUrl;

  const StoreItem({
    super.key,
    required this.name,
    required this.mapUrl,
    required this.showDetail,
    this.detailText,
    this.storeImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Franja gris con el nombre
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          color: const Color(0xFFBDBDBD),
          child: Text(
            name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        // Imagen desde la Web (Antes Mapa)
        Container(
          height: 160,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
          child: Image.network(
            mapUrl, // Ahora carga una imagen web normal
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => 
              Container(color: Colors.grey[300], child: const Icon(Icons.image_not_supported)),
          ),
        ),
        // Detalle inferior (solo si showDetail es true)
        if (showDetail)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  width: 140,
                  height: 100,
                  decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
                  child: Image.network(
                    storeImageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    detailText!,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, height: 1.4),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}