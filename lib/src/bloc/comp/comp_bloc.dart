import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:rxcommon/src/data/models/comp.dart';
import 'package:rxcommon/src/data/repositories/comp_repository.dart';


part 'comp_event.dart';
part 'comp_state.dart';

class CompBloc extends Bloc<CompEvent, CompState> {
  final CompRepository _compRepository;
  CompBloc(this._compRepository) : super(CompState()) {
    on<CompFetched>(_onCompFetched);
  //  on<CompRefreshed>(_onCompRefreshed);
  }
  
 

  FutureOr<void> _onCompFetched(
      CompFetched event, Emitter<CompState> emit) async {
    emit(state.copyWith(
      status: CompStatus.loading,
    ));
    final Comps = await _compRepository.getComp();
    // print("in bloc");
    //   print(Comps);

    Comps.fold((failure) {
      emit(state.copyWith(
        status: CompStatus.error,
      ));
    }, (data) {
      emit(state.copyWith(status: CompStatus.success, posts: data));
    });
  }
}
