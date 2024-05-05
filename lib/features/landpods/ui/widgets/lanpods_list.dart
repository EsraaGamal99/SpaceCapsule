import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/routing/routes.dart';
import 'package:space_app/core/widgets/loading_widgets/small_loading_widget.dart';
import 'package:space_app/features/home/ui/screens/widgets/pick_card_widget.dart';
import 'package:space_app/features/landpods/logic/landpod_cubit.dart';
import 'package:space_app/features/landpods/logic/landpod_state.dart';

class LandPodsList extends StatelessWidget {
  const LandPodsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LandpodCubit, LandpodState>(
      builder: (context, state) {
        if (state is Loaded) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: 15.0.w, left: 20.w, right: 20.w, top: 15.h),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return PickCardWidget(
                      cardName: state.landpods[index].name ?? '',
                      locality: state.landpods[index].locality,
                      imageName: state.landpods[index].image?.large?[0].toString() ?? '',
                      isToDetailsScreen: true,
                      onPressed: () {
                        Navigator.pushNamed(
                            context, Routes.landPodsDetailsScreen, arguments: state.landpods[index]);
                      },
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 30.h),
                  itemCount: state.landpods.length),
            ),
          );
        } else if (state is Loading) {
          return Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              const SmallLoadingWidget(),
            ],
          );
        } else if (state is Error) {
          return Center(child: Text(state.message.toString()));
        }
        else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}