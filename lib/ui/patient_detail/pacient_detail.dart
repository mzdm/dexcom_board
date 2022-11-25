import 'package:dexcom_board/ui/widgets/line_chart_widget.dart';
import 'package:flutter/material.dart';

class PatientDetailScreen extends StatelessWidget {
  const PatientDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patient detail')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: LineChartWidget(),
        ),
      ),
    );
  }
}
