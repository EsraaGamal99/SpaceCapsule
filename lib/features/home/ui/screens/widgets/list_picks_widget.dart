import 'package:flutter/material.dart';
import 'package:space_app/features/home/ui/screens/widgets/pick_card_widget.dart';

class ListPicksWidget extends StatelessWidget {
  const ListPicksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return PickCardWidget();
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
        itemCount: 4);
  }
}
