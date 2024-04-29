
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/theming/app_theme_cubit/app_theme_cubit.dart';
import 'package:space_app/features/dragons/logic/dragon_cubit.dart';

import '../../../core/theming/colors.dart';
import '../../../core/theming/app_theme_cubit/app_theme_state.dart';

class DragonsScreen extends StatefulWidget {
  const DragonsScreen({Key? key}) : super(key: key);

  @override
  State<DragonsScreen> createState() => _DragonsScreenState();
}

class _DragonsScreenState extends State<DragonsScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppThemeCubit>(context);
    context.read<DragonCubit>().emitGetAllDragonsStates();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Row(
          children: [
            const Text(
              'Dark Mode',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                letterSpacing: 0.5,
              ),
            ),
            BlocBuilder<AppThemeCubit, AppThemeState>(
              builder: (context, state) {
                return CupertinoSwitch(
                  activeColor: AppColors.primaryBlackColor,
                  trackColor: AppColors.primaryLightGreyColor,
                  value: AppThemeCubit.get(context).isDarkMode,
                  onChanged: (value) {
                    // setState(() {
                      debugPrint(AppThemeCubit.get(context).isDarkMode.toString());
                      AppThemeCubit.get(context).toggleTheme(value);
                    // });

                  }
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
