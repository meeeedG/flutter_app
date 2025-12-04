import 'package:flutter/material.dart';

class ChatbotPage extends StatelessWidget {
  const ChatbotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ChatBot')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: TextEditingController(),
              decoration: const InputDecoration(
                labelText: 'Prompt',
                hintText: 'Entrez votre question',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => (),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: () {}, child: const Text('Rechercher')),
            const SizedBox(height: 16),
            Expanded(child: SingleChildScrollView(child: Container())),
          ],
        ),
      ),
    );
  }
}
