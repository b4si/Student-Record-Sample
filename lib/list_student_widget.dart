import 'package:database_sample/application/bloc/main_bloc_bloc.dart';
import 'package:database_sample/db/functions.dart';
import 'package:database_sample/details_page.dart';
import 'package:database_sample/edit_page.dart';
import 'package:database_sample/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('All');
    return ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder: (BuildContext context, List<StudentModel> list, _) {
          return BlocBuilder<MainBlocBloc, MainBlocState>(
            builder: (context, state) {
              return ListView.separated(
                itemBuilder: (ctx, index) {
                  final data = state.studentList.value[index];
                  return ListTile(
                    onLongPress: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) {
                      return EditPage(
                        id: data.id!,
                        index: index,
                        name: data.name,
                        age: data.age,
                        place: data.place,
                        number: data.number,
                      );
                    })),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) {
                          return DetailsPage(
                              name: data.name,
                              age: data.age,
                              place: data.place,
                              number: data.number);
                        },
                      ),
                    ),
                    title: Text(data.name),
                    subtitle: Text(data.age),
                    trailing: IconButton(
                      onPressed: () {
                        if (data.id != null) {
                          deleteStudent(data.id!);
                        }
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                    ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const Divider();
                },
                itemCount: state.studentList.value.length,
              );
            },
          );
        });
  }
}
