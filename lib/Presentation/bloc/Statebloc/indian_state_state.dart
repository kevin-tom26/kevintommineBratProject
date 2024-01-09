part of 'indian_state_bloc.dart';

@immutable
sealed class IndianStateState {}

final class IndianStateInitial extends IndianStateState {}

final class IndianStateActionState extends IndianStateState {}

final class IndianStateLoadingState extends IndianStateState {}

final class IndianStatesuccessState extends IndianStateState {
  final List<IndiaStateModel> indianStates;
  IndianStatesuccessState({required this.indianStates});
}

final class IndianStateFailureState extends IndianStateState {
  final String errorMsg;

  IndianStateFailureState({required this.errorMsg});
}

final class OnSelectingIndianStateActionState extends IndianStateActionState {
  final String stateID;
  final String stateName;

  OnSelectingIndianStateActionState(
      {required this.stateID, required this.stateName});
}
