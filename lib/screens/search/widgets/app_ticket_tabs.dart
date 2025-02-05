import 'package:flutter/material.dart';
import 'package:tichet_app/base/widgets/app_tabs.dart';

class AppTicketTabs extends StatelessWidget {
  final String firstTab;
  final String secondTab;
  const AppTicketTabs(
      {super.key, required this.firstTab, required this.secondTab});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color(0xFFF4F6FD)),
      child: Row(children: [
        AppTabs(tabBorder: false, tabColor: false, tabText: firstTab),
        AppTabs(tabBorder: true, tabColor: true, tabText: secondTab),
      ]),
    );
  }
}
