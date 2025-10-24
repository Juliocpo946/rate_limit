import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person_pin, size: 100, color: Colors.green),
            const SizedBox(height: 20),
            Text(
              'Estás en la Vista de Perfil',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'El temporizador de inactividad también está activo aquí. Toca la pantalla para reiniciarlo.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
