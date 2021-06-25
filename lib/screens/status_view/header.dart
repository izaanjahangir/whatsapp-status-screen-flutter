import 'package:flutter/material.dart';
import 'package:whatsapp_status_screen/components/avatar/avatar.dart';
import 'package:whatsapp_status_screen/components/icon_button/icon_button.dart'
    as IB;
import 'package:whatsapp_status_screen/config/theme_colors.dart';

class Header extends StatelessWidget {
  final Map data;

  Header({this.data});

  @override
  Widget build(BuildContext context) {
    void goBack() {
      Navigator.pop(context);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          IB.IconButton(
            onTap: goBack,
            icon: Icons.arrow_back_ios,
          ),
          Avatar(
            disabled: true,
            avatarPath: data["avatar"],
            size: 35,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data["username"],
                style: TextStyle(color: ThemeColors.white, fontSize: 14),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                data["timestamp"],
                style: TextStyle(color: ThemeColors.white, fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
