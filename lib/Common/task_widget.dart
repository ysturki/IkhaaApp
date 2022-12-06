import 'package:flutter/material.dart';
import 'package:flutter_salam/Common/app_user_model.dart';
import 'package:flutter_salam/Common/profile_picture_widget.dart';
import 'package:flutter_salam/Common/task_model.dart';
import 'package:flutter_salam/Provider/app_provider.dart';
import 'package:provider/provider.dart';

class TaskWidget extends StatefulWidget {
  final TaskModel model;
  const TaskWidget({super.key, required this.model});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    AppUserInfo user = context.read<AppProvider>().user;
    return InkWell(
        onTap: goToDetails,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black.withOpacity(0.2)))),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                ProfilePicture(
                    color: widget.model.isCompleted ? Colors.green : null,
                    id: widget.model.status == 2 ||
                            (widget.model.status == 0 &&
                                user.userId != widget.model.acceptedById)
                        ? widget.model.acceptedById ?? widget.model.createdById
                        : widget.model.createdById,
                    picture: "assets/svg/Task.svg"),
                Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Text(widget.model.name),
              ],
            ),
            Text(widget.model.getStatusText()),
            Text("${widget.model.hours} ساعات"),
            // Text(
            //     "${widget.model.endTime.difference(DateTime.now()).inDays} يوم متبقي")
          ]),
        ));
  }

  goToDetails() {
    Navigator.pushNamed(
      context,
      '/taskDetailsPage',
      arguments: {'task': widget.model},
    );
  }
}
