

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../internet_checker.dart';
import 'internet_checker_state.dart';

class InternetCheckerCubit extends Cubit<InternetCheckerState> {
  InternetCheckerCubit(this.internetChecker)
      : super(const InternetCheckerState.initial());
  
  final InternetCheckerImpl internetChecker;


  static InternetCheckerCubit get(context) => BlocProvider.of<InternetCheckerCubit>(context);
  bool isConnected = false;
  void emitInternetStatus () async{
    if(await internetChecker.isConnected){
      emit(InternetCheckerState.connected());
      isConnected = true;
    }else {
      emit(InternetCheckerState.notConnected());
      isConnected = false;
    }
}

}