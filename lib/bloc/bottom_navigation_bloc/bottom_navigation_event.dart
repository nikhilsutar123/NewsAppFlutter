import 'package:equatable/equatable.dart';

abstract class BottomNavigationEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NavigateTo extends BottomNavigationEvent {
  final int index;
  NavigateTo(this.index);
}
