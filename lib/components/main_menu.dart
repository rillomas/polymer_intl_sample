library main_menu;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:intl/intl.dart';
import 'package:polymer_intl_sample/components/common_messages.dart' as msg;

@CustomTag("main-menu")
class MainMenu extends PolymerElement {
  MainMenu.created(): super.created() {
  }

  @observable String userStr;
  @observable String settingStr;

  /// Update locale for this component
  void updateLocale() {
    userStr = msg.user();
    settingStr = setting();
  }
  
  setting() => Intl.message("Setting",name:"setting",args:[]);
}
