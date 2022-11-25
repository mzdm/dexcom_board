import 'package:flutter/material.dart';

class PatientDetailPopUpScreen extends StatelessWidget {
  const PatientDetailPopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const PatientDetailPopUpScreen(),
                );
              },
              child: const Text('Glucose'),
            ),
          ],
        ),
      ),
    );
  }
}
