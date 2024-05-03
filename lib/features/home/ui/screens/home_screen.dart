import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/theming/app_theme_cubit/app_theme_cubit.dart';
import 'package:space_app/core/theming/app_theme_cubit/app_theme_state.dart';

import 'package:space_app/features/home/ui/screens/widgets/list_picks_widget.dart';

import 'widgets/widgets_with_background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BackgroundWidgets(),
                  ListPicksWidget(),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
