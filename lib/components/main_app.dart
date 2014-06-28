library main_app;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:logging/logging.dart';
import 'package:intl/intl.dart';
import 'package:polymer_intl_sample/components/main_menu.dart';
import 'package:polymer_intl_sample/components/messages_all/messages_all.dart';

@CustomTag("main-app")
class MainApp extends PolymerElement {
  MainApp.created(): super.created() {
    Logger.root.level = Level.INFO;
    Logger.root.onRecord.listen((log) {
      print(log);
    });
  }

  /// Locale of language
  @observable String locale;

  @override
  void attached() {
    super.attached();

    _menu = $["mainMenu"];

    Logger.root.info("Language: ${window.navigator.language}");
    locale = window.navigator.language;
  }

  void localeChanged(String old) {
    try {
      initializeMessages(locale).then((succeed) => _updateLocale(locale));
    } catch (e) {
      Logger.root.warning("Language $locale is not supported. Defaulting to en_US");
      _updateLocale("en_US");
    }
  }

  void _updateLocale(String locale) {
    Intl.defaultLocale = locale;
    _menu.updateLocale();
  }

  MainMenu _menu;
}
