
class TaskModel {
  String? title;
  String? description;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  bool? isCompleted;


  TaskModel({
   required this.title,
   required  this.description,
   required this.date,
   required this.startTime,
   required this.endTime,
   required this.color,
   required this.isCompleted,
  });
}