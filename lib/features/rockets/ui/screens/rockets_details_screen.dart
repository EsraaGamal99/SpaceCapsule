import 'package:flutter/material.dart';
import 'package:space_app/core/theming/assets.dart';
import 'package:space_app/core/widgets/details_screen_body.dart';
import 'package:space_app/core/widgets/title_of_item_details.dart';

class RocketDetailsScreen extends StatefulWidget {
  const RocketDetailsScreen({super.key});

  @override
  State<RocketDetailsScreen> createState() => _RocketDetailsScreenState();
}

class _RocketDetailsScreenState extends State<RocketDetailsScreen> {
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
          child: Column(
            children: [
              const TitleOfItemDetails(
                title: 'Rocket_1',
              ),
              DetailsScreenBody(
                currentPage: _currentPage,
                description:
                    'Planet Earth is the third planet from the Sun in our solar system. It is a unique and diverse world, home to a wide variety of life, including humans. Earth has a rich atmosphere that sustains life, vast oceans covering much of its surface, and a diverse range of ecosystems, making it a remarkable and beautiful planet.',
                index: _currentPage.toInt(),
                images: [AppAssets.galaxy, AppAssets.rockets, AppAssets.insightfulImage],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

