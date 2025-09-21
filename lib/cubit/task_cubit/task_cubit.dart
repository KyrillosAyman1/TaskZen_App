import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:taskzen_app/constant.dart';
import 'package:taskzen_app/models/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  List<TaskModel>? tasks;
  //List<TaskModel>? tasksByDate;
  fetchAllTasks() async {
    var tasksBox = Hive.box<TaskModel>(kTaskBox);
    tasks = tasksBox.values.toList();
  }

  // fetchTasks() async {
  //   var tasksBox = Hive.box<TaskModel>(kTaskBox);
  //   tasksByDate = tasksBox.values.toList()
  //       .where((task) => task.date == DateTime.now().toString())
  //       .toList();
  // }
}
