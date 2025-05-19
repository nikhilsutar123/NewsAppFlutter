import 'package:equatable/equatable.dart';

abstract class HeadlinesEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HeadlinesFetched extends HeadlinesEvent {
  final String pageNum;

  HeadlinesFetched(this.pageNum);
}
