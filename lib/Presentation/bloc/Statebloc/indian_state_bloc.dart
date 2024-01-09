import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:minebrat/Data/Models/india_state_model.dart';
import 'package:minebrat/Data/Repo/india_state_fetch_call.dart';

part 'indian_state_event.dart';
part 'indian_state_state.dart';

class IndianStateBloc extends Bloc<IndianStateEvent, IndianStateState> {
  late List<IndiaStateModel> indianStateList;
  late List<IndiaStateModel> indStateList;
  IndianStateBloc() : super(IndianStateInitial()) {
    on<IndianSatesInitailFecthEvent>(indianSatesInitailFecthEvent);

    on<SearchTextChangedEvent>(searchTextChangedEvent);

    on<OnSelectingIndianStateEvent>(onSelectingIndianStateEvent);
  }

  FutureOr<void> indianSatesInitailFecthEvent(
      IndianSatesInitailFecthEvent event,
      Emitter<IndianStateState> emit) async {
    emit(IndianStateLoadingState());
    try {
      indianStateList = await FetchIndianState().fetchStates();
      emit(IndianStatesuccessState(indianStates: indianStateList));
    } catch (e) {
      emit(IndianStateFailureState(errorMsg: e.toString()));
    }
  }

  FutureOr<void> searchTextChangedEvent(
      SearchTextChangedEvent event, Emitter<IndianStateState> emit) {
    indStateList = indianStateList
        .where((item) =>
            item.stateName.toLowerCase().contains(event.query.toLowerCase()))
        .toList();
    emit(IndianStatesuccessState(indianStates: indStateList));
  }

  FutureOr<void> onSelectingIndianStateEvent(
      OnSelectingIndianStateEvent event, Emitter<IndianStateState> emit) {
    emit(OnSelectingIndianStateActionState(
        stateID: event.stateID, stateName: event.stateName));
  }
}
