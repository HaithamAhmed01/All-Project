import 'package:bloc/bloc.dart';
import 'package:flutter_app/modules/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit():super(CounterInitialState());

  int counter=0;

  static CounterCubit get(context) => BlocProvider.of(context);

  void minus(){
    counter--;
    emit(CounterMinusState(counter));
  }
  void plus(){
    counter++;
    emit(CounterPlusState(counter));
  }
}