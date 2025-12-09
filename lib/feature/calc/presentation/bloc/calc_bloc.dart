import 'package:calc/feature/calc/presentation/bloc/calc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalcBloc extends Cubit<CalcState> {
  CalcBloc() : super(CalcInitialState());


}
