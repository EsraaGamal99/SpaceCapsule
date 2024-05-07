import 'package:flutter/material.dart';
import 'package:space_app/core/widgets/loading_widgets/screens_loading_widget.dart';

Future<dynamic> authLoadingDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => const ScreensLoadingWidget(),
  );
}
