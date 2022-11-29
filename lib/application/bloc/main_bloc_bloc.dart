// ignore_for_file: no_leading_underscores_for_local_identifiers, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:database_sample/db/functions.dart';

import 'package:flutter/foundation.dart';

import '../../model/data_model.dart';

part 'main_bloc_event.dart';
part 'main_bloc_state.dart';

class MainBlocBloc extends Bloc<MainBlocEvent, MainBlocState> {
  MainBlocBloc() : super(InitialState()) {
    on<AddTransaction>((event, emit) async {
      ValueListenable<List<StudentModel>> updatedList = await getAllStudents();

      return emit(MainBlocState(studentList: updatedList));
    });
  }
}
