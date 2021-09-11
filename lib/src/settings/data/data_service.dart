import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class SettingsDataService with ChangeNotifier {

  static final SettingsDataService instance = SettingsDataService._internal();
  factory SettingsDataService() => instance;

  late Box _box;

  Box get box => _box;
  
  SettingsDataService._internal() {
    ///
  }

  Future<void> init() async {
    try {
      if (!kIsWeb) Hive.init((await getApplicationDocumentsDirectory()).path);
    } catch (e) {
      debugPrint(e.toString());
      debugPrint(
          'Hive has already been initialized. Skipping this step for now.');
    }

    if (!Hive.isBoxOpen('HooksBox')) {
      _box = await Hive.openBox('HooksBox');
    } else {
      _box = Hive.box('HooksBox');
    }
  }
}