import 'package:flutter/material.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/core/widgets/details_screen_body.dart';
import 'package:space_app/core/widgets/title_of_item_details.dart';

class DragonsDetailsScreen extends StatefulWidget {
  const DragonsDetailsScreen({super.key});

  @override
  State<DragonsDetailsScreen> createState() => _DragonsDetailsScreen();
}

class _DragonsDetailsScreen extends State<DragonsDetailsScreen> {
  double _currentPage = 0;
  //TODO: replace it with this logic "List<int> indexes = List.generate(state.data.flickrImages.length, (index) => index);"
  //at the build of success state "like at the rockets details screen"
  List<int> indexes = List.generate(2, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.dragonsBackground),
              fit: BoxFit.cover
            )),
        child: SafeArea(
          child: Column(
            children: [
              const TitleOfItemDetails(
                title: 'Dragon_1',
              ),
              DetailsScreenBody(
                currentPage: _currentPage,
                description:
                'Planet Earth is the third planet from the Sun in our solar system. It is a unique and diverse world, home to a wide variety of life, including humans. Earth has a rich atmosphere that sustains life, vast oceans covering much of its surface, and a diverse range of ecosystems, making it a remarkable and beautiful planet.',
                index: indexes,
                images: const [AppAssets.galaxy, AppAssets.rockets, AppAssets.insightfulImage],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

