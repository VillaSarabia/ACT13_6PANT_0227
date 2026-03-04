import 'package:flutter/material.dart';

class TestimoniosPage extends StatelessWidget {
  const TestimoniosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8BA4D0),
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Navigator.pop(context)),
        title: const Text('Testimonios', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const CircleAvatar(radius: 35, child: Icon(Icons.person, size: 40)),
                const SizedBox(width: 15),
                const Text("Yahel Villa A.", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const Spacer(),
                IconButton(icon: const Icon(Icons.add_box, size: 40), onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xFFEBEBEB), border: Border.all(color: Colors.black54)),
              child: ListView.builder(itemCount: 5, itemBuilder: (context, index) => const ReviewItem()),
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key});
  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(backgroundColor: Colors.grey, child: Icon(Icons.person, color: Colors.white)),
      title: Row(children: [Icon(Icons.star, color: Colors.yellow, size: 20), Icon(Icons.star, color: Colors.yellow, size: 20), Icon(Icons.star, color: Colors.yellow, size: 20)]),
      subtitle: Text("Excelente servicio"),
    );
  }
}