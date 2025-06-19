import 'package:bloc/bloc.dart';
import 'package:news_app/bloc/snack_bar_bloc/snackbar_event.dart';
import 'package:news_app/bloc/snack_bar_bloc/snackbar_state.dart';

class SnackbarBloc extends Bloc<SnackbarEvent, SnackbarState>{
  SnackbarBloc(): super(const SnackbarState(message: "")){
    on<ShowSnackbarEvent>((event,emit) async {
      emit(state.copyWith(msg: event.message));
      await Future.delayed(const Duration(milliseconds: 100),(){
        emit(state.copyWith(msg: ""));
      });
    });
  }

}