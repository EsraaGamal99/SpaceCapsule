import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  String? routeSettingsName;
  NotFoundScreen({super.key, required this.routeSettingsName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('There is no route defined for $routeSettingsName'),
      ),
    );
  }
}
