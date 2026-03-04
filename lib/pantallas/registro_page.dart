import 'package:flutter/material.dart';

class RegistroPage extends StatelessWidget {
  const RegistroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Registrar'),
        actions: const [Padding(padding: EdgeInsets.all(10), child: Icon(Icons.lock_outline))],
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildInput("Nombre:"),
            _buildInput("Email:"),
            _buildInput("Teléfono:"),
            _buildInput("Dirección:"),
            _buildInput("Tipo Entrenador:"),
            _buildInput("Contraseña:", isPassword: true),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade200),
                  child: const Text("Registrar", style: TextStyle(color: Colors.black)),
                ),
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Inicio Sesión", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCircularButton(context, Icons.add, "Testimonios", '/testimonios'),
                _buildCircularButton(context, Icons.shopping_bag, "Productos", '/productos'),
                _buildCircularButton(context, Icons.catching_pokemon, "Tienda", '/tiendas'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(String label, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(width: 120, child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(
            child: TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                fillColor: Colors.red.shade100,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularButton(BuildContext context, IconData icon, String label, String route) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.shade300,
            child: Icon(icon, color: Colors.black, size: 30),
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}