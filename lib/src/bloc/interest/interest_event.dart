part of 'interest_bloc.dart';
abstract class InterestEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class InterestFetched extends InterestEvent {}
