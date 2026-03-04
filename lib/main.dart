import 'package:flutter/material.dart';
import 'pantallas/home_page.dart';
import 'pantallas/carrito_page.dart';
import 'pantallas/registro_page.dart';
import 'pantallas/tiendas_page.dart';
import 'pantallas/testimonios_page.dart';
import 'pantallas/productos_page.dart';

void main() {
  runApp(const DeckTCGApp());
}

class DeckTCGApp extends StatelessWidget {
  const DeckTCGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeckTCG Store',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/registro': (context) => const RegistroPage(),
        '/carrito': (context) => const PantallaCarrito(),
        '/tiendas': (context) => const TiendasFisicasPage(),
        '/testimonios': (context) => const TestimoniosPage(),
        '/productos': (context) => const ProductosPage(),
      },
    );
  }
}