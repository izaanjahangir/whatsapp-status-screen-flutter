import 'package:flutter/material.dart';
import 'package:whatsapp_status_screen/components/add_indicator/add_indicator.dart';

class Avatar extends StatelessWidget {
  final bool disabled;
  final bool showAddIcon;
  final String avatarPath;

  Avatar(
      {this.disabled = false,
      @required this.avatarPath,
      this.showAddIcon = false});

  @override
  Widget build(BuildContext context) {
    void handleTap() {}

    return AbsorbPointer(
      absorbing: disabled,
      child: GestureDetector(
        onTap: handleTap,
        child: Container(
          child: Stack(
            children: [
              ClipOval(
                child: Image.asset(
                  avatarPath,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              if (showAddIcon)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: AddIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}
