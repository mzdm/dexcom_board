import 'package:dexcom_share_api/dexcom_share_api.dart';

Future<void> main(List<String> arguments) async {
  final client = DexcomUserApi();
  await client.init(username: 'username', password: 'password');
  final events = await client.getGlucoseEventRecords(minutes: 10);
}
