import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_app/generated/l10n.dart';

extension NavigationHelper on BuildContext {
  void push(Widget screen) {
    Navigator.of(this).push(MaterialPageRoute(builder: (_) => screen));
  }
  void pushNamed(String route) {
    Navigator.of(this).pushNamed(route);
  }
  void pushReplacement(Widget screen) {
    Navigator.of(this).pushReplacement(MaterialPageRoute(builder: (_) => screen));
  }
  void pushReplacementNamed(String route) {
    Navigator.of(this).pushReplacementNamed(route);
  }
  void pop() {
    Navigator.of(this).pop();
  }
  void pushAndRemoveUntil(String screenName, BuildContext context,var arguments) {
    Navigator.pushNamedAndRemoveUntil(context, screenName, (route) => false, arguments: arguments);
  }
}

extension MediaQueryHelper on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}


extension TranslationHelper on BuildContext {
  get translate => S.of(this);
}

Future<void> setBoolToPrefs( String key,bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool(key, value);
}