import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/routing/routes.dart';
import 'package:space_app/core/widgets/loading_widgets/small_loading_widget.dart';
import 'package:space_app/features/home/ui/screens/widgets/pick_card_widget.dart';
import 'package:space_app/features/rockets/logic/rockets_cubit/rockets_cubit.dart';
import 'package:space_app/features/rockets/logic/rockets_cubit/rockets_state.dart';

class RocketsBlocBuilder extends StatelessWidget {
  const RocketsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RocketsCubit, RocketsState>(
      builder: (context, state) {
        if (state is Success) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: 15.0.w, left: 20.w, right: 20.w, top: 15.h),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return PickCardWidget(
                      cardName: state.data[index].name,
                      imageName: state.data[index].flickrImages[1],
                      isToDetailsScreen: true,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.rocketDetailsScreen,
                          arguments: state.data[index].id,
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 30.h),
                  itemCount: state.data.length),
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
          return Center(child: Text(state.error.toString()));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
