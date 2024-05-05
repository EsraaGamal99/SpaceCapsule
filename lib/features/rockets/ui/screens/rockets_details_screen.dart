import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/core/widgets/details_screen_body.dart';
import 'package:space_app/core/widgets/loading_widgets/small_loading_widget.dart';
import 'package:space_app/core/widgets/title_of_item_details.dart';
import 'package:space_app/features/rockets/logic/one_rocket_cubit/one_rocket_cubit.dart';
import 'package:space_app/features/rockets/logic/one_rocket_cubit/one_rocket_state.dart';

class RocketDetailsScreen extends StatefulWidget {
  final String rocketId;
  const RocketDetailsScreen({super.key, required this.rocketId});

  @override
  State<RocketDetailsScreen> createState() => _RocketDetailsScreenState();
}

class _RocketDetailsScreenState extends State<RocketDetailsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<OneRocketCubit>(context)
        .emitGetRocketByIDStates(rocketId: widget.rocketId);
  }

  double _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(AppAssets.rocketsBackground),
        )),
        child: SafeArea(
          child: BlocBuilder<OneRocketCubit, OneRocketState>(
            builder: (context, state) {
              if (state is Success) {
                List<int> indexes = List.generate(
                    state.data.flickrImages.length, (index) => index);

                return Column(
                  children: [
                     TitleOfItemDetails(
                      title: state.data.name,
                    ),
                    DetailsScreenBody(
                      currentPage: _currentPage,
                      description: state.data.description,
                      index: indexes,
                      images: state.data.flickrImages,
                    ),
                  ],
                );
              } else if (state is Error) {
                return Center(
                  child: Text(state.error),
                );
              } else if (state is Loading) {
                return Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    const SmallLoadingWidget(),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
