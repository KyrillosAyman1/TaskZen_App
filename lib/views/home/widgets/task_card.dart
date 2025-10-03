
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:taskzen_app/cubit/task_cubit/task_cubit.dart';
import 'package:taskzen_app/helper/custom_show_snak_bar.dart';
import 'package:taskzen_app/models/task_model.dart';
import 'package:taskzen_app/views/edit%20task/edit_task_view.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskModel});

  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key:  ValueKey(taskModel.key),
      background:Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
          decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(16),
            color: Color.fromARGB(255, 43, 204, 48),
          ),
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.check,
                size: 22,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Complete',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
       
      secondaryBackground: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
          decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(16),
            color: Colors.red
          ),
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.delete,
                size: 22,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Delete',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
       
      confirmDismiss: (direction)  {
        if (direction == DismissDirection.startToEnd) {
          // ✅ اكتمل
          BlocProvider.of<TaskCubit>(context).completeTask(taskModel);
          customShowSnackBar(context: context, message: "Task completed successfully");
          
          
        } else {
          // 🗑️ حذف
          BlocProvider.of<TaskCubit>(context).deleteTask(taskModel);
          customShowSnackBar(context: context, message: "Task deleted successfully");


        }
        return Future.value(false);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return EditTaskView(
                    taskModel: taskModel,
                  );
                },
              ),
            );
          },
          child: Card(
            color: taskModel.isCompleted ==true ? const Color.fromARGB(255, 43, 204, 48) : Color(taskModel.color!),
            child: ListTile(
              title: Text(
                taskModel.title!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: Text(
                      taskModel.description!,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16),
                      SizedBox(width: 5),
                      Text(
                        "${taskModel.startTime!} - ${taskModel.endTime!}", //"9:00 AM - 10:00 AM",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                       Icon(Icons.calendar_month, size: 16),
                      SizedBox(width: 5),
                      Text(
                            taskModel.date!, //"9:00 AM - 10:00 AM",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                    ],
                  ),
                ],
              ),
      
             trailing: taskModel.isCompleted == true
                  ? Lottie.asset(
                      "assets/images/Trophy.json",
                      height: 100,
                      width: 70,
                      //fit: BoxFit.cover,
                      repeat: true,
                      alignment: Alignment.centerRight,
                    )
                  : Lottie.asset(
                    "assets/images/Cat playing animation.json",
                    height: 100,
                    width: 80,
                    repeat: true,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}


/**import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskzen_app/models/task_model.dart';
import 'package:taskzen_app/views/edit task/edit_task_view.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskModel});

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(taskModel.key), // ✅ مفتاح فريد من Hive
      background: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20),
        child: Icon(Icons.check, color: Colors.white, size: 32),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        child: Icon(Icons.delete, color: Colors.white, size: 32),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          // ✅ اكتمل
          taskModel.isCompleted = true;
          taskModel.save();
        } else {
          // 🗑️ حذف
          taskModel.delete();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return EditTaskView( );
                },
              ),
            );
          },
          child: Card(
            color: Color(taskModel.color!),
            child: ListTile(
              title: Text(
                taskModel.title ?? '',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: Text(
                      taskModel.description ?? '',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16),
                      SizedBox(width: 5),
                      Text(
                        taskModel.date ?? '',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
              trailing: taskModel.isCompleted == true
                  ? Lottie.asset(
                      "assets/images/Trophy.json",
                      height: 100,
                      width: 70,
                      repeat: false,
                      alignment: Alignment.centerRight,
                    )
                  : Lottie.asset(
                      "assets/images/Cat playing animation.json",
                      height: 100,
                      width: 80,
                      repeat: false,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
 */