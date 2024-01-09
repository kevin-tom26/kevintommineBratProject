import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:minebrat/Data/Models/india_city_model.dart';
import 'package:minebrat/Data/Repo/india_city_fetch_call.dart';

part 'indian_city_event.dart';
part 'indian_city_state.dart';

class IndianCityBloc extends Bloc<IndianCityEvent, IndianCityState> {
  IndianCityBloc() : super(IndianCityInitial()) {
    on<IndianCityInitailFecthEvent>(indianCityInitailFecthEvent);

    on<OnSelectingIndianCityEvent>(onSelectingIndianCityEvent);
  }

  FutureOr<void> indianCityInitailFecthEvent(
      IndianCityInitailFecthEvent event, Emitter<IndianCityState> emit) async {
    emit(IndianCityLoadingState());
    try {
      final List<IndiaCityModel> indianCityList =
          await FetchIndianCity().fetchCities(event.stateID);
      emit(IndianCitysuccessState(indianCities: indianCityList));
    } catch (e) {
      emit(IndianCityFailureState(errorMsg: e.toString()));
    }
  }

  FutureOr<void> onSelectingIndianCityEvent(
      OnSelectingIndianCityEvent event, Emitter<IndianCityState> emit) {
    emit(OnSelectingIndianCityActionState(
        stateName: event.stateName, cityName: event.cityName));
  }
}
