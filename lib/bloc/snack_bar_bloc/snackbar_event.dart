import 'package:equatable/equatable.dart';

abstract class SnackbarEvent extends Equatable {

  @override
  List<Object?> get props => [];

}
class ShowSnackbarEvent extends SnackbarEvent{
  final String message;

   ShowSnackbarEvent({required this.message});
}