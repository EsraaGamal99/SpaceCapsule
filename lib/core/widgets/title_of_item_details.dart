import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:space_app/core/helpers/extenstions.dart';
import 'package:space_app/core/theming/text_styles.dart';

class TitleOfItemDetails extends StatelessWidget {
  final String title;
  final String? region;

  const TitleOfItemDetails({
    super.key,
    required this.title,
    this.region,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                region ?? context.translate.adventurerTextKey,
                style: AppTextStyles.fontWhite15W500,
              ),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.fontWhite33W600,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
