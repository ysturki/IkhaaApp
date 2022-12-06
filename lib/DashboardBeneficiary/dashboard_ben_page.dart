import 'package:flutter/material.dart';
import 'package:flutter_salam/DashboardBeneficiary/dashboard_ben_logic.dart';

import 'package:flutter_salam/DashboardBeneficiary/dashboard_ben_widget.dart';

class DashboardBeneficiaryPage extends StatelessWidget {
  const DashboardBeneficiaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardBenificiaryLogic logic = DashboardBenificiaryLogic();
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: DashboardBeneficiaryWidget(logic: logic)));
  }
}
