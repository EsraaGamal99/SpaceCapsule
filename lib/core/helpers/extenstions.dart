import 'package:flutter/material.dart';

extension NavigationHelper on BuildContext {
  void push(Widget screen) {
    Navigator.of(this).push(MaterialPageRoute(builder: (_) => screen));
  }
  void pushNamed(String route) {
    Navigator.of(this).pushNamed(route);
  }
  void pop() {
    Navigator.of(this).pop();
  }
}