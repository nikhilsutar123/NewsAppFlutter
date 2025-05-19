import 'package:bloc/bloc.dart';
import 'package:news_app/bloc/bottom_navigation_bloc/bottom_navigation_event.dart';
import 'package:news_app/bloc/bottom_navigation_bloc/bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(const BottomNavigationState(0)) {
    on<NavigateTo>(_navigateTo);
  }

  void _navigateTo(NavigateTo event, Emitter<BottomNavigationState> emit) {
    emit(state.copyWith(selectedIndex: event.index));
  }
}
