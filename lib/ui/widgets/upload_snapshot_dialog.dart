import 'package:dexcom_board/common.dart';

Future<String?> displayUploadSnapshotDialog(BuildContext context) async {
  final textController = TextEditingController();
  return showDialog<String?>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Upload current snapshot Glucose data to FHIR'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  labelText: 'Birth number of patient',
                  hintText: 'Birth number',
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Ok'),
            onPressed: () {
              if (textController.text.isNotEmpty) {
                AutoRouter.of(context).pop(textController.text);
              }
            },
          ),
        ],
      );
    },
  );
}
