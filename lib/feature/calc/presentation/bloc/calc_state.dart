abstract class CalcState {}

class CalcInitialState extends CalcState {}

class CalcLoadAnswerState extends CalcState {
  final num answer;

  CalcLoadAnswerState({required this.answer});
}

class CalcErrorState extends CalcState {
  final String message;

  CalcErrorState({required this.message});
}
