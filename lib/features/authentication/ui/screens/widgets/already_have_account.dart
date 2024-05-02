import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_app/core/theming/text_styles.dart';
import 'package:space_app/generated/l10n.dart';

import '../../../../../core/routing/routes.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            S.of(context).alreadyHaveAnAccountTextKey,
            style: AppTextStyles.fontWhite15W500,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.loginScreen);
          },
          child: Text(
            S.of(context).logInTextKey,
            style: AppTextStyles.fontWhite17W500,
          ),
        ),
      ],
    );
  }
}
