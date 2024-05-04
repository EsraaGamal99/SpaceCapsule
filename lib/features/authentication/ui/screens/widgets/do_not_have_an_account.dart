import 'package:flutter/material.dart';
import 'package:space_app/core/helpers/extenstions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/text_styles.dart';

class DoNotHaveAnAccount extends StatelessWidget {
  const DoNotHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Text(
              context.translate.doNotHaveAnAccountTextKey,
              style: AppTextStyles.fontWhite15W500.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
        ),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.registerScreen);
            },
            child: Text(
              context.translate.signUpTextKey,
              style: AppTextStyles.fontWhite17W500.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
        )
      ],
    );
  }
}
