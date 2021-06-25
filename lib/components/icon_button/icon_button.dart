import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class IconButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;

  IconButton({@required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    void handleTap() {
      if (onTap != null) {
        onTap();
      }
    }

    return TouchableOpacity(
        onTap: handleTap,
        child: Icon(
          icon,
          color: Colors.white,
          size: 25,
        ));
  }
}
