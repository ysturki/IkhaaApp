import 'package:flutter/material.dart';
import 'package:flutter_salam/DashboardViolator/dashboard_vio_logic.dart';
import 'package:flutter_salam/DashboardViolator/dashboard_vio_widget.dart';
import 'package:provider/provider.dart';

class DashboardViolatorPage extends StatelessWidget {
  const DashboardViolatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardViolatorLogic logic = DashboardViolatorLogic();
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: DashboardViolatorWidget(logic: logic)));
  }
}
