import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class SaveDirectories {
  Future<void> init() async {
    supportDir = kIsWeb ? Directory('') : await getApplicationSupportDirectory();
    if (!kIsWeb) await Directory(dbDirPath).create(recursive: true);
  }

  late final Directory supportDir;

  String get dbDirPath => join(supportDir.path, 'db');

  Future<void> clearSaveDirectories() async {
    try {
      await supportDir.delete(recursive: true);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
