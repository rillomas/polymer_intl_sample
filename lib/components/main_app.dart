library main_app;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:logging/logging.dart';
import 'package:intl/intl.dart';
import 'package:polymer_intl_sample/components/main_menu.dart';
import 'package:polymer_intl_sample/components/common_messages.dart' as msg;
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
  @observable String currentLocale;
  @observable String helloStr;
  @observable String userStr;
  @observable String localeStr;
  @observable String japaneseStr;
  @observable String englishStr;
  @observable int selectedLocale;

  @override
  void attached() {
    super.attached();

    _menu = $["mainMenu"];

    selectedLocale = 1;
    // Logger.root.info("Language: ${window.navigator.language}");
    // currentLocale = window.navigator.language;
  }

  void currentLocaleChanged(String old) {
    try {
      initializeMessages(currentLocale).then((succeed) => _updateLocale(currentLocale));
    } catch (e) {
      Logger.root.warning("Language $currentLocale is not supported. Defaulting to en_US");
      _updateLocale("en_US");
    }
  }

  void selectedLocaleChanged(int old) {
    switch (selectedLocale) {
      case 0:
        currentLocale = "ja";
        break;
      case 1:
        currentLocale = "en_US";
    }
  }

  void _updateLocale(String locale) {
    Intl.defaultLocale = locale;
    helloStr = hello();
    userStr = msg.user();
    localeStr = msg.locale();
    japaneseStr = msg.japanese();
    englishStr = msg.english();
    _menu.updateLocale();
  }

  hello() => Intl.message("Hello",name:"hello",args:[]);

  MainMenu _menu;
}
