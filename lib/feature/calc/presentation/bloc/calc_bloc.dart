import 'package:calc/feature/calc/presentation/bloc/calc_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalcBloc extends Cubit<CalcState> {
  CalcBloc() : super(CalcInitialState());

  GlobalKey formKey = GlobalKey();
  final TextEditingController inputOneController = TextEditingController();
  final TextEditingController inputTwoController = TextEditingController();
  final TextEditingController inputThreeController = TextEditingController();

  num? get input1 => num.tryParse(inputOneController.text.trim());

  num? get input2 => num.tryParse(inputTwoController.text.trim());

  bool validateInputs() {
    if (input1 == null || input2 == null) {
      emit(CalcErrorState(message: "Please input valid data"));
      return false;
    };
    return true;
  }

  void add() {
    if (!validateInputs()) return;
    emitAnswer(input1! + input2!);
  }

  void subs() {
    if (!validateInputs()) return;
    emitAnswer(input1! - input2!);
  }

  void mul() {
    if (!validateInputs()) return;
    emitAnswer(input1! * input2!);
  }

  void div() {
    if (input2 == 0) {
      emit(CalcErrorState(message: "Input 2 cannot be 0"));
      return;
    };

    if (!validateInputs()) return;

    emitAnswer(input1! / input2!);
  }

  void emitAnswer(num answer) {
    emit(CalcLoadAnswerState(answer: answer));
  }
}
