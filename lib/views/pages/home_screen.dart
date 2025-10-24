import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.timer, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            Text(
              'Estás en la Vista Principal',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Deja de interactuar con la app por 5 minutos (o el tiempo configurado) para que la sesión se cierre automáticamente.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
