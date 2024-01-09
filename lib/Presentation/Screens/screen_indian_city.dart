import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minebrat/Presentation/Screens/screen_welcome_message.dart';
import 'package:minebrat/Presentation/bloc/Citybloc/bloc/indian_city_bloc.dart';

class IndianCityScreen extends StatefulWidget {
  final String stateID;
  final String stateName;
  const IndianCityScreen(
      {super.key, required this.stateID, required this.stateName});

  @override
  State<IndianCityScreen> createState() => _IndianCityScreenState();
}

class _IndianCityScreenState extends State<IndianCityScreen> {
  IndianCityBloc indianCityBloc = IndianCityBloc();

  @override
  void initState() {
    indianCityBloc.add(IndianCityInitailFecthEvent(stateID: widget.stateID));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        bloc: indianCityBloc,
        listenWhen: (previous, current) => current is IndianCityActionState,
        buildWhen: (previous, current) => current is! IndianCityActionState,
        listener: (context, state) {
          if (state is OnSelectingIndianCityActionState) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => WelcomeScreen(
                    stateName: state.stateName, cityName: state.cityName)));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case IndianCityLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case IndianCitysuccessState:
              final successState = state as IndianCitysuccessState;
              return ListView.builder(
                  itemCount: successState.indianCities.length,
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      title: Text(
                        successState.indianCities[index].cityName,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(successState.indianCities[index].cityId),
                      onTap: () {
                        indianCityBloc.add(OnSelectingIndianCityEvent(
                            stateName: widget.stateName,
                            cityName:
                                successState.indianCities[index].cityName));
                      },
                    );
                  });

            case IndianCityFailureState:
              final errorMsg = state as IndianCityFailureState;
              return Center(child: Text(errorMsg.errorMsg));
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
