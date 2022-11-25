import 'package:dexcom_share_api/dexcom_http.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: ()async  {
                //
                final client = DexcomUserApi();
                await client.init(username: 'ffd', password: 'fddf');
              },
              child: Text('Glucose'),
            ),
          ],
        ),
      ),
    );
  }
}
