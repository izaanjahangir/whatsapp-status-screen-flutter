import 'package:flutter/material.dart';
import 'package:whatsapp_status_screen/components/avatar/avatar.dart';
import 'package:whatsapp_status_screen/config/theme_colors.dart';

class StatusItem extends StatelessWidget {
  final BoxDecoration containerDecoration;
  final String heading;
  final String text;
  final bool isMyStatus;
  final String avatarPath;

  StatusItem(
      {this.containerDecoration,
      @required this.heading,
      @required this.avatarPath,
      this.isMyStatus = false,
      @required this.text});

  @override
  Widget build(BuildContext context) {
    BoxDecoration getContainerDecoration() {
      final BoxDecoration defaultContainerDecoration = BoxDecoration();
      return containerDecoration == null
          ? defaultContainerDecoration
          : defaultContainerDecoration.copyWith(
              border: containerDecoration.border);
    }

    Widget renderMiddleContent() {
      return Container(
        padding: const EdgeInsets.only(bottom: 5),
        decoration: getContainerDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              heading,
              style: TextStyle(color: ThemeColors.white, fontSize: 16),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              text,
              style: TextStyle(color: ThemeColors.grey, fontSize: 13),
            ),
          ],
        ),
      );
    }

    return Container(
      height: 60,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        children: [
          Avatar(
            avatarPath: avatarPath,
            showAddIcon: isMyStatus,
          ),
          SizedBox(width: 10),
          Expanded(child: renderMiddleContent()),
        ],
      ),
    );
  }
}
