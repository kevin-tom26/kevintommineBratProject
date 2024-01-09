part of 'indian_city_bloc.dart';

@immutable
sealed class IndianCityState {}

final class IndianCityInitial extends IndianCityState {}

final class IndianCityActionState extends IndianCityState {}

final class IndianCityLoadingState extends IndianCityState {}

final class IndianCitysuccessState extends IndianCityState {
  final List<IndiaCityModel> indianCities;
  IndianCitysuccessState({required this.indianCities});
}

final class IndianCityFailureState extends IndianCityState {
  final String errorMsg;

  IndianCityFailureState({required this.errorMsg});
}

final class OnSelectingIndianCityActionState extends IndianCityActionState {
  final String stateName;
  final String cityName;

  OnSelectingIndianCityActionState(
      {required this.stateName, required this.cityName});
}
