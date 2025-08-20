import 'package:flutter/material.dart';

class LoaderScreen extends StatelessWidget {
  const LoaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 100,
      width: 300,
      decoration: const BoxDecoration(color: Color.fromARGB(50, 255, 255, 255)),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
