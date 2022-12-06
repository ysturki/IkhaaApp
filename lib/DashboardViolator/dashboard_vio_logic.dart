import 'package:flutter_salam/Common/app_user_model.dart';
import 'package:flutter_salam/Common/task_model.dart';

class DashboardViolatorLogic {
  late Future<AppUserInfo?>? userInfo;

  List<TaskModel> tasks = [
    TaskModel(
        hours: "١",
        name: "مهمة ١",
        desc: "وصف مهمة ١",
        type: "نوع مهمة ١",
        location: "موقع ١",
        timeStamp: DateTime.now(),
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(days: 4)),
        createdById: "2",
        acceptedById: "1",
        isSpecialized: true,
        specialization: "تخصص ١",
        status: 2),
    TaskModel(
        hours: "٨",
        name: "مهمة ٢",
        desc: "وصف مهمة ٢",
        type: "نوع مهمة ٢",
        location: "موقع ٢",
        timeStamp: DateTime.now(),
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(days: 17)),
        createdById: "3",
        acceptedById: "1",
        isSpecialized: true,
        specialization: "تخصص ٢",
        status: 3),
    TaskModel(
        hours: "٤",
        name: "مهمة ٣",
        desc: "وصف مهمة ٣",
        type: "نوع مهمة ٣",
        location: "موقع ٣",
        timeStamp: DateTime.now(),
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(days: 25)),
        createdById: "4",
        acceptedById: "1",
        isSpecialized: true,
        specialization: "تخصص ٣",
        status: 2),
  ];

  bool loggedin() => true; //firebase.appAuth.loggedin();

  bool logout() => true;

  List<TaskModel> loadCompletedTaskList() {
    return [
      TaskModel(
          hours: "٥",
          name: "مهمة ١",
          desc: "مهمة ١ Description ",
          type: "Type 1",
          location: "Location 1",
          timeStamp: DateTime.now(),
          startTime: DateTime.now(),
          endTime: DateTime.now().add(Duration(days: 10)),
          createdById: "5",
          acceptedById: "1",
          isSpecialized: true,
          specialization: "Specialization 1",
          isCompleted: true,
          status: 0),
      TaskModel(
          hours: "١٠",
          name: "مهمة ٢",
          desc: "مهمة ٢ Description ",
          type: "Type 2",
          location: "Location 2",
          timeStamp: DateTime.now(),
          startTime: DateTime.now(),
          endTime: DateTime.now().add(Duration(days: 20)),
          createdById: "2",
          acceptedById: "1",
          isSpecialized: true,
          specialization: "Specialization 2",
          isCompleted: true,
          status: 0),
      TaskModel(
          hours: "٢٢",
          name: "مهمة ٣",
          desc: "مهمة ٣ Description ",
          type: "Type 3",
          location: "Location 3",
          timeStamp: DateTime.now(),
          startTime: DateTime.now(),
          endTime: DateTime.now().add(Duration(days: 30)),
          createdById: "3",
          acceptedById: "1",
          isSpecialized: true,
          specialization: "Specialization 3",
          isCompleted: true,
          status: 0),
    ];
  }
}
