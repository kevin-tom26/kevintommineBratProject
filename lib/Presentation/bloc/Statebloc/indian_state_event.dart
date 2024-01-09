part of 'indian_state_bloc.dart';

@immutable
sealed class IndianStateEvent {}

final class IndianSatesInitailFecthEvent extends IndianStateEvent {}

final class SearchTextChangedEvent extends IndianStateEvent {
  final String query;

  SearchTextChangedEvent({required this.query});
}

final class OnSelectingIndianStateEvent extends IndianStateEvent {
  final String stateName;
  final String stateID;

  OnSelectingIndianStateEvent({required this.stateID, required this.stateName});
}
