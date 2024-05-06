import 'package:flutter/material.dart';
import 'package:space_app/core/theming/text_styles.dart';
import 'package:space_app/core/helpers/extenstions.dart';

import '../../../../../core/routing/routes.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            context.translate.alreadyHaveAnAccountTextKey,
            style: AppTextStyles.fontWhite15W500.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.loginScreen, arguments: false);
          },
          child: Text(
            context.translate.logInTextKey,
            style: AppTextStyles.fontWhite17W500.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ],
    );
  }
}
