part of 'main_bloc_bloc.dart';

@immutable
class MainBlocState {
  ValueListenable<List<StudentModel>> studentList;

  MainBlocState({required this.studentList});
}

class InitialState extends MainBlocState {
  InitialState() : super(studentList: studentListNotifier);
}
