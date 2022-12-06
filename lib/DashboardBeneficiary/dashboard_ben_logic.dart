import 'package:flutter_salam/Common/app_user_model.dart';
import 'package:flutter_salam/Common/task_model.dart';

class DashboardBenificiaryLogic {
  late Future<AppUserInfo?>? userInfo;

  bool loggedin() => true; //firebase.appAuth.loggedin();

  bool logout() => true;

  String? email;

  List<TaskModel> activeTasks = [
    TaskModel(
        hours: "٣",
        name: "مهمة ٣",
        desc: "مهمة ٣ Description ",
        type: "Type 3",
        location: "Location 3",
        timeStamp: DateTime.now(),
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(days: 30)),
        createdById: "2",
        acceptedById: null,
        isSpecialized: true,
        specialization: "Specialization 3",
        status: 1),
    TaskModel(
        hours: "٢",
        name: "مهمة ٢",
        desc: "مهمة ٢ Description ",
        type: "Type 2",
        location: "Location 2",
        timeStamp: DateTime.now(),
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(days: 20)),
        createdById: "1",
        acceptedById: null,
        isSpecialized: true,
        specialization: "Specialization 2",
        status: 3),
    TaskModel(
        hours: "٥",
        name: "مهمة ١",
        desc: "مهمة ١ Description ",
        type: "Type 1",
        location: "Location 1",
        timeStamp: DateTime.now(),
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(days: 10)),
        createdById: "1",
        acceptedById: null,
        isSpecialized: true,
        specialization: "Specialization 1",
        status: 2),
  ];

  getCompletedTasks() {
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
          createdById: "4",
          acceptedById: "1",
          isSpecialized: true,
          specialization: "Specialization 1",
          status: 0),
      TaskModel(
          hours: "٢",
          name: "مهمة ٢",
          desc: "مهمة ٢ Description ",
          type: "Type 2",
          location: "Location 2",
          timeStamp: DateTime.now(),
          startTime: DateTime.now(),
          endTime: DateTime.now().add(Duration(days: 20)),
          createdById: "3",
          acceptedById: "1",
          isSpecialized: true,
          specialization: "Specialization 2",
          status: 0),
      TaskModel(
          hours: "٣",
          name: "مهمة ٣",
          desc: "مهمة ٣ Description ",
          type: "Type 3",
          location: "Location 3",
          timeStamp: DateTime.now(),
          startTime: DateTime.now(),
          endTime: DateTime.now().add(Duration(days: 30)),
          createdById: "2",
          acceptedById: "1",
          isSpecialized: true,
          specialization: "Specialization 3",
          status: 0),
    ];
  }
}
