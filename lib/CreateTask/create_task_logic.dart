import 'package:flutter/material.dart';
import 'package:flutter_salam/Common/task_model.dart';

class CreateTaskLogic {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController hoursController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  DateTime timestamp = DateTime.now();
  DateTimeRange timeRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  String createdById = "";
  bool isSpecialized = false;
  TextEditingController specializationController = TextEditingController();

  Future<TaskModel> createTask() async {
    TaskModel model = TaskModel(
      hours: hoursController.text,
      name: taskNameController.text,
      desc: descController.text,
      type: typeController.text,
      location: locationController.text,
      timeStamp: timestamp,
      startTime: timeRange.start,
      endTime: timeRange.end,
      createdById: createdById,
      acceptedById: null,
      isSpecialized: isSpecialized,
      specialization: specializationController.text,
    );

    return model;
  }
}
