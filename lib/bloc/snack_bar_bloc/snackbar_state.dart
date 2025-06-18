import 'package:equatable/equatable.dart';

class SnackbarState extends Equatable{

  final String message;

  const SnackbarState({required this.message});

  SnackbarState copyWith({String? msg}){
    return SnackbarState(message: msg ?? message);
  }
  @override
  List<Object?> get props => [message];

}