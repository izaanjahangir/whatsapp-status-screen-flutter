import 'package:flutter/material.dart';
import 'package:whatsapp_status_screen/config/theme_colors.dart';

class AddIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: ThemeColors.lightBlue,
        child: Icon(
          Icons.add,
          color: ThemeColors.white,
          size: 18,
        ),
      ),
    );
  }
}
