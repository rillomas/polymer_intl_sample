library main_menu;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:intl/intl.dart';

@CustomTag("main-menu")
class MainMenu extends PolymerElement {
  MainMenu.created(): super.created() {
  }

  @observable String loginStr;
  @observable String settingStr;

  /// Update locale for this component
  void updateLocale() {
    loginStr = login();
    settingStr = setting();
  }
  
  setting() => Intl.message("Setting",name:"setting",args:[]);
  login() => Intl.message("Login",name:"login",args:[]);
}
