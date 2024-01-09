part of 'indian_city_bloc.dart';

@immutable
sealed class IndianCityEvent {}

final class IndianCityInitailFecthEvent extends IndianCityEvent {
  final String stateID;

  IndianCityInitailFecthEvent({required this.stateID});
}

final class SearchTextChangedEvent extends IndianCityEvent {
  final String query;

  SearchTextChangedEvent({required this.query});
}

final class OnSelectingIndianCityEvent extends IndianCityEvent {
  final String stateName;
  final String cityName;

  OnSelectingIndianCityEvent({required this.stateName, required this.cityName});
}
