import 'package:flutter/material.dart';

import '../../../../../core/helpers/constants_strings.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/text_styles.dart';

class DoNotHaveAnAccount extends StatelessWidget {
  const DoNotHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
              'Don\'t have an account?',
              style: AppTextStyles.fontWhite15W500.copyWith(color: Theme.of(context).colorScheme.primary),
            )),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.registerScreen);
            },
            child: Text(
              signUpTextKey,
              style: AppTextStyles.fontWhite17W500.copyWith(color: Theme.of(context).colorScheme.primary),
            ))
      ],
    );
  }
}
