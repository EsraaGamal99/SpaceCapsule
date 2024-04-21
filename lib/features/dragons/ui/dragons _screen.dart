
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/dragons/logic/dragon_cubit.dart';

class DragonsScreen extends StatefulWidget {
  const DragonsScreen({Key? key}) : super(key: key);

  @override
  State<DragonsScreen> createState() => _DragonsScreenState();
}

class _DragonsScreenState extends State<DragonsScreen> {

  @override
  void initState() {
    super.initState();

    context.read<DragonCubit>().emitGetAllDragonsStates();

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
