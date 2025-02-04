import 'package:flutter/material.dart';
import 'package:tichet_app/base/widgets/app_tabs.dart';

class AppTicketTabs extends StatelessWidget {
  const AppTicketTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color(0xFFF4F6FD)),
      child: const Row(children: [
        AppTabs(tabBorder: false, tabColor: false, tabText: "AirLine Tickets"),
        AppTabs(tabBorder: true, tabColor: true, tabText: "Hotels"),
      ]),
    );
  }
}
