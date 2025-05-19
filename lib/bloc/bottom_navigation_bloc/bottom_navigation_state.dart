import 'package:equatable/equatable.dart';

class BottomNavigationState extends Equatable {
  final int selectedIndex;

  const BottomNavigationState(this.selectedIndex);

  BottomNavigationState copyWith({int? selectedIndex}) {
    return BottomNavigationState(selectedIndex ?? this.selectedIndex);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [selectedIndex];
}
