import 'package:dexcom_board/common.dart';
import 'package:dexcom_board/ui/screens/dashboard/dashboard.dart';

mixin AddStationDialog on State<DashBoardScreen> {
  Future<void> displayStationDialog(
    BuildContext context, {
    required TextEditingController stationNameController,
    required TextEditingController usernameController,
    required TextEditingController passwordController,
  }) async {
    stationNameController.clear();
    usernameController.clear();
    passwordController.clear();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add a station'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: stationNameController,
                decoration: InputDecoration(
                  labelText: 'Station name',
                  hintText: 'Station name',
                ),
              ),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Username',
                ),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                ),
                obscureText: true,
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                final stationName = stationNameController.text;
                final username = usernameController.text;
                final password = passwordController.text;
                if (stationName.isNotEmpty && username.isNotEmpty && password.isNotEmpty) {
                  // Do something
                  AutoRouter.of(context).pop();
                } else {
                  // Do something
                }
              },
            ),
          ],
        );
      },
    );
  }
}
