import 'package:dexcom_board/common.dart';
import 'package:dexcom_board/navigation/app_router.gr.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashBoard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                context.pushRoute(const PatientDetailRoute());
              },
              child: const Text('Glucose'),
            ),
          ],
        ),
      ),
    );
  }
}
