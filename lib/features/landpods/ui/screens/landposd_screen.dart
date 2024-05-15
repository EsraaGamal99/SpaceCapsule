import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/landpods/logic/landpod_cubit.dart';
import 'package:space_app/features/landpods/ui/widgets/landpods_body_widget.dart';
import 'package:space_app/core/widgets/manager_internet_widget.dart';

class LandPodsScreen extends StatelessWidget {
  const LandPodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InternetManagerWidget(screenWidget: LandPodsBodyWidget(), onInternetChanged: () => BlocProvider.of<LandpodCubit>(context).getLandpods(context),);
  }
}
