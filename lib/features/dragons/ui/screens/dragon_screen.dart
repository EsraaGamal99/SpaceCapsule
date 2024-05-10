import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/dragons/ui/widgets/dragons_body_widget.dart';
import '../../../../core/widgets/manager_internet_widget.dart';
import '../../logic/dragon_cubit.dart';

class DragonScreen extends StatelessWidget {
  const DragonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InternetManagerWidget(screenWidget: DragonsBodyWidget(), onInternetChanged: () => BlocProvider.of<DragonCubit>(context).getDragons(context),);
  }
}