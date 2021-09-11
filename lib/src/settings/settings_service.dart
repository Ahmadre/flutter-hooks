import 'package:flutter/material.dart';
import 'package:hooks/src/settings/data/data_service.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  final _appThemeKey = 'app.theme';

  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async {
    final themeMode = SettingsDataService.instance.box.get(_appThemeKey) != null
        ? getThemeFromInt(SettingsDataService.instance.box.get(_appThemeKey))
        : ThemeMode.system;

    return themeMode;
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
    SettingsDataService.instance.box.put(_appThemeKey, theme.index);
  }

  ThemeMode getThemeFromInt(int index) {
    switch (index) {
      case 0:
        return ThemeMode.system;
      case 1:
        return ThemeMode.light;
      case 2:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
