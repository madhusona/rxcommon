import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxcommon/src/data/repositories/comp_repository.dart';


part 'interest_event.dart';
part 'interest_state.dart';

class InterestBloc extends Bloc<InterestEvent, InterestState> {
  final CompRepository compRepository;
  InterestBloc(this.compRepository) : super(InterestState()) {
    on<InterestFetched>(_onInterestFetched);
  //  on<ItemRefreshed>(_onItemRefreshed);
  }

  FutureOr<void> _onInterestFetched(InterestFetched event, Emitter<InterestState> emit) async {
     emit(state.copyWith(
      status: InterestStatus.loading,
    ));
    final Interests = await compRepository.getInterest();
  

    Interests.fold((failure) {
      emit(state.copyWith(
        status: InterestStatus.error,
      ));
    }, (data) {
      emit(state.copyWith(status: InterestStatus.success, interests: data));
    });
  }
}