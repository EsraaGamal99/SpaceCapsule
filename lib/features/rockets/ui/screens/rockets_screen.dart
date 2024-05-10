import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/features/home_of_items/ui/screens/widgets/space_item_app_bar.dart';
import 'package:space_app/features/rockets/logic/rockets_cubit/rockets_cubit.dart';
import 'package:space_app/features/rockets/ui/screens/widgets/rockets_bloc_builder.dart';
import 'package:space_app/features/rockets/ui/screens/widgets/rockets_body_widget.dart';

import '../../../../core/widgets/manager_internet_widget.dart';

class RocketsScreen extends StatelessWidget {
  const RocketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InternetManagerWidget(screenWidget: RocketsBodyWidget(), onInternetChanged: () => BlocProvider.of<RocketsCubit>(context).getRockets(context),);
  }
}

