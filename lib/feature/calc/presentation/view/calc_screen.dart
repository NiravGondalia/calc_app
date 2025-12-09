import 'package:calc/feature/calc/presentation/bloc/calc_bloc.dart';
import 'package:calc/feature/calc/presentation/bloc/calc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalcScreen extends StatelessWidget {
  CalcScreen({super.key});

  final TextEditingController inputOneController = TextEditingController();
  final TextEditingController inputTwoController = TextEditingController();
  final TextEditingController inputThreeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<CalcBloc>(
        create: (context) => CalcBloc(),
        child: BlocBuilder<CalcBloc, CalcState>(
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: inputOneController),
              TextField(controller: inputTwoController),
              TextField(controller: inputThreeController, readOnly: true),
              ElevatedButton(onPressed: () {}, child: Text("Calculate")),
            ],
          ),
        ),
      ),
    );
  }
}
