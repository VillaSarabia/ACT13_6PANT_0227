import 'package:flutter/material.dart';

class ProductosPage extends StatelessWidget {
  const ProductosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8BA4D0),
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.pop(context)),
        title: const Text('Productos', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CategoryHeader(title: "Cartas"),
            ProductGrid(products: [
              ProductData("Charizard GX", "\$150.00", "https://raw.githubusercontent.com/VillaSarabia/imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/darkrai.jpg"),
              ProductData("Pikachu VMAX", "\$85.00", "https://raw.githubusercontent.com/VillaSarabia/imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/SV3PT5_LA_48.png"),
              ProductData("Mewtwo EX", "\$120.00", "https://raw.githubusercontent.com/VillaSarabia/imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/SM75_LA_55.png"),
            ]),
            const CategoryHeader(title: "Juguetes"),
            ProductGrid(products: [
              ProductData("Snorlax", "\$45.00", "https://raw.githubusercontent.com/VillaSarabia/imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/Drag%253Fn_blanco_de_ojos_azules.webp"),
              ProductData("Lucario", "\$30.00", "https://raw.githubusercontent.com/VillaSarabia/imagenes-para-Flutter-6to-I-Fecha-11-Feb-2026/refs/heads/main/Foto_mago_oscuro.webp"),
            ]),
          ],
        ),
      ),
    );
  }
}

class CategoryHeader extends StatelessWidget {
  final String title;
  const CategoryHeader({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFFFF6B6B), borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.black)),
      child: Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final List<ProductData> products;
  const ProductGrid({super.key, required this.products});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.6),
      itemBuilder: (context, index) {
        final p = products[index];
        return Column(children: [
          Expanded(child: Container(color: Colors.blue[100], child: Image.network(p.imageUrl, fit: BoxFit.cover))),
          Text(p.name, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          Text(p.price, style: const TextStyle(fontSize: 10)),
        ]);
      },
    );
  }
}

class ProductData {
  final String name, price, imageUrl;
  ProductData(this.name, this.price, this.imageUrl);
}