import 'package:flutter/material.dart';

/// NotFoundScreen is a StatelessWidget that displays a message when a route is not found.
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
