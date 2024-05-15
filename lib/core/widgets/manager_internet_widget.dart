import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:space_app/core/widgets/loading_widgets/small_loading_widget.dart';
import '../networking/internet_checker/logic/internet_checker_cubit.dart';

class InternetManagerWidget extends StatefulWidget {
  InternetManagerWidget({Key? key, required this.screenWidget, required this.onInternetChanged}) : super(key: key);
  Widget screenWidget;
  Function onInternetChanged;

  @override
  State<InternetManagerWidget> createState() => _InternetManagerWidgetState();
}

class _InternetManagerWidgetState extends State<InternetManagerWidget> {

  @override
  void initState() {
    InternetCheckerCubit.get(context).emitInternetStatus();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
          ) {
        final bool connected = connectivity != ConnectivityResult.none;

        if (connected) {
          widget.onInternetChanged();
          return widget.screenWidget;
        } else {
          widget.onInternetChanged();
          return widget.screenWidget;
        }
      },
      child: SmallLoadingWidget(),
    );
  }
}