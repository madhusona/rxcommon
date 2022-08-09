part of 'comp_bloc.dart';



abstract class CompEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CompFetched extends CompEvent {}
