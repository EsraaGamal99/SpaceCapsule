import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/helpers/functions/get_current_language.dart';
import 'package:space_app/core/widgets/loading_widgets/small_loading_widget.dart';
import 'package:space_app/core/helpers/extenstions.dart';

import '../../../../core/widgets/app_bars/inner_screens_app_bar.dart';
import '../widgets/app_prefrences_item_widget.dart';
import '../widgets/show_change_language_bottom_sheet.dart';
import '../widgets/show_change_theme_bottom_sheet.dart';


class AppPreferencesScreen extends StatelessWidget {
  const AppPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30.0.h, right: 17.0.w, left: 17.0.w),
                  child: InnerAppBar(
                    topText: context.translate.translate.appTextKey,
                    bottomText: context.translate.translate.preferencesTextKey,
                  ),
                ),
                SizedBox(height: 20.h),
                AppPreferencesItemWidget(iconData: Icons.light_mode_rounded, title: context.translate.translate.themeTextKey, subTitle: context.translate.translate.darkTextKey, onTap: () => showChangeThemeBottomSheet(context: context),),
                Divider(indent: 50.w, endIndent: 50.w, color: Theme.of(context).colorScheme.primary,),
                FutureBuilder<String>(
                  future: getCurrentLanguageName(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SmallLoadingWidget();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return AppPreferencesItemWidget(
                        iconData: Icons.language,
                        title: context.translate.translate.languageTextKey,
                        subTitle: snapshot.data ?? '',
                        onTap: () => showChangeLanguageBottomSheet(context: context),
                      );
                    }
                  },
                ),
                SizedBox(height: 25.h),
              ],
            ),
          ),
        )
    );
  }
}



