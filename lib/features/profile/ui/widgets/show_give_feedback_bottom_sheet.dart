import 'package:flutter/material.dart';

import 'give_feedback_widget.dart';

void showGiveFeedbackBottomSheet({required BuildContext context, required TextEditingController feedbackTextController, required Function(String) onFeedbackChanged}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return GiveFeedBackWidget(controller: feedbackTextController, onChanged: onFeedbackChanged);
    },
  );
}