import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minebrat/Presentation/Screens/screen_indian_city.dart';
import 'package:minebrat/Presentation/bloc/Statebloc/indian_state_bloc.dart';

class IndiaStateScreen extends StatefulWidget {
  const IndiaStateScreen({super.key});

  @override
  State<IndiaStateScreen> createState() => _IndiaStateScreenState();
}

class _IndiaStateScreenState extends State<IndiaStateScreen> {
  IndianStateBloc indianStateBloc = IndianStateBloc();
  @override
  void initState() {
    indianStateBloc.add(IndianSatesInitailFecthEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Indian States"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                decoration: const InputDecoration(hintText: "Search"),
                onChanged: (value) {
                  indianStateBloc.add(SearchTextChangedEvent(query: value));
                },
              ),
            ),
            Expanded(
              child: BlocConsumer(
                bloc: indianStateBloc,
                listenWhen: (previous, current) =>
                    current is IndianStateActionState,
                buildWhen: (previous, current) =>
                    current is! IndianStateActionState,
                listener: (context, state) {
                  if (state is OnSelectingIndianStateActionState) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => IndianCityScreen(
                              stateID: state.stateID,
                              stateName: state.stateName,
                            )));
                  }
                },
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case IndianStateLoadingState:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );

                    case IndianStatesuccessState:
                      final successState = state as IndianStatesuccessState;
                      return ListView.builder(
                          itemCount: successState.indianStates.length,
                          itemBuilder: (ctx, index) {
                            return ListTile(
                              title: Text(
                                successState.indianStates[index].stateName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                              ),
                              subtitle: Text(
                                  successState.indianStates[index].stateId),
                              onTap: () {
                                indianStateBloc.add(OnSelectingIndianStateEvent(
                                    stateID: successState
                                        .indianStates[index].stateId,
                                    stateName: successState
                                        .indianStates[index].stateName));
                              },
                            );
                          });
                    case IndianStateFailureState:
                      final errorMsg = state as IndianStateFailureState;
                      return Center(child: Text(errorMsg.errorMsg));
                    default:
                      return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ));
  }
}
