import 'package:flutter/material.dart';

class AppTabs extends StatelessWidget {
  final bool tabBorder;
  final bool tabColor;
  final String tabText;
  const AppTabs(
      {super.key,
      this.tabBorder = false,
      this.tabColor = false,
      this.tabText = ""});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7),
      width: size.width * .44,
      decoration: BoxDecoration(
          borderRadius: (tabBorder == false
              ? const BorderRadius.horizontal(left: Radius.circular(50))
              : const BorderRadius.horizontal(right: Radius.circular(50))),
          color: tabColor == false ? Colors.white : Colors.transparent),
      child: Center(
        child: Text(tabText),
      ),
    );
  }
}
