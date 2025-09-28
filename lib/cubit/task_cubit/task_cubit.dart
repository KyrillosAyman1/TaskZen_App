import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:taskzen_app/constant.dart';
import 'package:taskzen_app/models/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());


    
  List<TaskModel>? tasks;
  List<TaskModel>? tasksByDate;
  // fetchAllTasks() async {
  //   var tasksBox = Hive.box<TaskModel>(kTaskBox);
  //   tasks = tasksBox.values.toList();
  //   emit(TaskSuccess());
  // }

  Future<void> completeTask(TaskModel taskModel) async {
    taskModel.isCompleted = true;
    await taskModel.save();
    //fetchAllTasks();
    fetchTasks(taskModel.date!);
  }

  Future<void> deleteTask(TaskModel taskModel) async {
    await taskModel.delete();
    //fetchAllTasks(); // رجع الليست محدثة
     fetchTasks(taskModel.date!);
  }

  Future<void> fetchTasks( String date) async {

    var tasksBox = Hive.box<TaskModel>(kTaskBox);
    tasksByDate = tasksBox.values.toList()
        .where((task) => task.date == date)
        .toList();

    emit(TaskSuccess());
  }

}
