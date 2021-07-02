import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_status_screen/components/avatar/avatar.dart';
import 'package:whatsapp_status_screen/config/theme_colors.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class StatusItem extends StatelessWidget {
  final BoxDecoration containerDecoration;

  final bool isMyStatus;

  final Function onTap;
  final Map data;

  StatusItem({
    this.containerDecoration,
    this.data,
    this.onTap,
    this.isMyStatus = false,
  });

  @override
  Widget build(BuildContext context) {
    String getTimestamp() {
      if (isMyStatus) {
        return "Add to my status";
      }

      Timestamp timestamp = data["timestamp"] as Timestamp;
      if (timestamp != null) {
        DateTime dt = DateTime.fromMillisecondsSinceEpoch(
            timestamp.millisecondsSinceEpoch);
        Duration duration = DateTime.now().difference(dt);

        return duration.inMinutes.toString() + " minutes";
      }

      return "";
    }

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
              data["username"],
              style: TextStyle(color: ThemeColors.white, fontSize: 16),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              getTimestamp(),
              style: TextStyle(color: ThemeColors.grey, fontSize: 13),
            ),
          ],
        ),
      );
    }

    return TouchableOpacity(
      activeOpacity: 0.1,
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        height: 60,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          children: [
            Avatar(
              disabled: true,
              avatarPath: data["image"],
              showAddIcon: isMyStatus,
            ),
            SizedBox(width: 10),
            Expanded(child: renderMiddleContent()),
          ],
        ),
      ),
    );
  }
}
