import 'package:flutter/material.dart';
import 'package:space_app/core/theming/assets.dart';

class ScaffoldForAuthentication extends StatelessWidget {
  const ScaffoldForAuthentication({
    super.key, required this.body,
  });
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.authBackground,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          body,
        ],
      ),
    );
  }
}
