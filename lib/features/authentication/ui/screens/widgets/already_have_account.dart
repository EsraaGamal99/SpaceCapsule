import 'package:flutter/material.dart';
import 'package:space_app/core/theming/text_styles.dart';

import '../../../../../core/routing/routes.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text('Already have an account?',style: AppTextStyles.fontWhite15W500,)),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.loginScreen);
            },
            child:  Text(
              'Login',
              style: AppTextStyles.fontWhite17W500,
            )
        )
      ],
    );
  }
}
