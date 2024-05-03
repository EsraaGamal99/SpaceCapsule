import 'package:flutter/material.dart';
import 'package:space_app/core/theming/text_styles.dart';

import '../helpers/constants_strings.dart';

class TitleOfItemDetails extends StatelessWidget {
  final String title;

  const TitleOfItemDetails({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              adventurerTextKey,
              style: AppTextStyles.fontWhite15W500,
            ),
            Text(
              title,
              style: AppTextStyles.fontWhite33W600,
            ),
          ],
        ),
      ],
    );
  }
}
