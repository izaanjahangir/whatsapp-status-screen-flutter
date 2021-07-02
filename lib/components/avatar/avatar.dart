import 'package:flutter/material.dart';
import 'package:whatsapp_status_screen/components/add_indicator/add_indicator.dart';

class Avatar extends StatelessWidget {
  final bool disabled;
  final bool showAddIcon;
  final String avatarPath;
  final Function onTap;
  final double size;

  Avatar(
      {this.disabled = false,
      this.onTap,
      this.size = 50,
      @required this.avatarPath,
      this.showAddIcon = false});

  @override
  Widget build(BuildContext context) {
    void handleTap() {
      if (onTap != null) {
        onTap();
      }
    }

    return AbsorbPointer(
      absorbing: disabled,
      child: GestureDetector(
        onTap: handleTap,
        child: Container(
          child: Stack(
            children: [
              ClipOval(
                child: Image.network(
                  avatarPath,
                  width: size,
                  height: size,
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
