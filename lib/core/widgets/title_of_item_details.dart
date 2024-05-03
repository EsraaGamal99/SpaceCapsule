import 'package:flutter/material.dart';
import 'package:space_app/core/helpers/extenstions.dart';
import 'package:space_app/core/theming/text_styles.dart';

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
              context.translate.translate.adventurerTextKey,
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
