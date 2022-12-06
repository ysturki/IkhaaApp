class TaskModel {
  final String name;
  final String desc;
  final String type;
  final String location;
  final String hours;
  final DateTime timeStamp;
  int status;
  DateTime startTime;
  DateTime endTime;
  String createdById;
  String? acceptedById;
  bool isSpecialized;
  String specialization;
  bool isCompleted;

  TaskModel(
      {required this.startTime,
      required this.hours,
      required this.endTime,
      required this.createdById,
      required this.acceptedById,
      required this.isSpecialized,
      required this.specialization,
      required this.name,
      required this.desc,
      required this.type,
      required this.location,
      required this.timeStamp,
      this.isCompleted = false,
      this.status = 1});

  bool isAccepted() {
    return acceptedById != null;
  }

  String getStatusText() {
    switch (status) {
      case 0:
        return "مكتمل";
      case 1:
        return "متاح";
      case 2:
        return "نشط";
      case 3:
        return "بانتظار الموافقة";
      default:
        return "غير معروف";
    }
  }
}
