import 'package:dexcom_board/common.dart';
import 'package:dexcom_board/services/active_user_dex_clients.dart';
import 'package:dexcom_board/services/models/app_models.dart';
import 'package:dexcom_board/services/models/station_dao.dart';
import 'package:dexcom_board/ui/screens/dashboard/dashboard.dart';
import 'package:dexcom_board/utils/app_setup.dart';
import 'package:dexcom_share_api/dexcom_http.dart';

mixin AddStationDialog on State<DashBoardScreen> {
  StationModelDao get stationModelDao => locator<StationModelDao>();

  ActiveUserDexClients get activeUserDexClients => locator<ActiveUserDexClients>();

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
              onPressed: () async {
                final stationName = stationNameController.text;
                final username = usernameController.text;
                final password = passwordController.text;
                if (stationName.isNotEmpty && username.isNotEmpty && password.isNotEmpty) {
                  final station = StationModel(
                    stationName: stationName,
                    username: username,
                    password: password,
                  );
                  // final client = DexcomUserApi();
                  // final response = await client.init(username: username, password: password);
                  if (true) {
                    // if (response.isRight) {
                    final stationId = await stationModelDao.saveStation(station);
                    // activeUserDexClients.addStation(stationId, client);
                    await AutoRouter.of(context).pop();
                  } else {
                    // final error = response.left;
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: Text('An error occurred: ${error.message}'),
                    //   ),
                    // );
                  }
                  await AutoRouter.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all fields')),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
