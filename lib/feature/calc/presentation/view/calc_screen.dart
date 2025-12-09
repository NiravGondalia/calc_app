import 'package:calc/feature/calc/presentation/bloc/calc_bloc.dart';
import 'package:calc/feature/calc/presentation/bloc/calc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalcScreen extends StatelessWidget {
  const CalcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<CalcBloc>(
        create: (context) => CalcBloc(),
        child: BlocConsumer<CalcBloc, CalcState>(
          listener: (context, state) {
            if(state is CalcLoadAnswerState) {
              context.read<CalcBloc>().inputThreeController.text = state.answer.toString();
            }
          },
          builder: (context, state) {
            CalcBloc bloc = context.read<CalcBloc>();
            return Form(
              key: context.read<CalcBloc>().formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: bloc.inputOneController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.end,
                  ),
                  TextFormField(
                    controller: bloc.inputTwoController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.end,
                  ),
                  TextFormField(
                    controller: bloc.inputThreeController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.end,
                    readOnly: true,
                  ),

                  BlocBuilder<CalcBloc, CalcState>(
                    builder: (context, state) {
                      if (state is CalcErrorState) {
                        return Text(state.message);
                      }
                      return SizedBox();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          bloc.add();
                        },
                        child: Text("+"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          bloc.subs();
                        },
                        child: Text("-"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          bloc.mul();
                        },
                        child: Text("*"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          bloc.div();
                        },
                        child: Text("/"),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
