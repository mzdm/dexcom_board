import 'package:dexcom_board/ui/widgets/line_chart_widget.dart';
import 'package:dexcom_share_api/dexcom_share_api.dart';
import 'package:flutter/material.dart';

class PatientDetailScreen extends StatelessWidget {
  const PatientDetailScreen({super.key});

  Future<List<GlucoseEventRecord>> get() async {
    final client = DexcomUserApi();
    await client.init(username: 'assdf', password: 'dfddf');
    final events = await client.getGlucoseEventRecords(minutes: 300);
    if (events.isRight) {
      return events.right;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patient detail')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                LineChartWidget(),
                FutureBuilder(
                  future: get(),
                  builder: (context, snapshot) {
                    final data = snapshot.data;
                    if (data == null) {
                      return const SizedBox.shrink();
                    } else {
                      return ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = data[index];
                          return ListTile(
                            title: Text('Item ${item.toString()}'),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
