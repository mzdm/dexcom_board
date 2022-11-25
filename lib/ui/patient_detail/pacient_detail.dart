import 'package:flutter/material.dart';

class PatientDetailScreen extends StatelessWidget {
  const PatientDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patient detail')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
