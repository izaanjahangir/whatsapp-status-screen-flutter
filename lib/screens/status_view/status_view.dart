import 'package:flutter/material.dart';
import 'package:whatsapp_status_screen/config/theme_colors.dart';
import 'package:whatsapp_status_screen/screens/status_view/header.dart';

class StatusView extends StatelessWidget {
  final Map data;

  StatusView({this.data});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
            color: ThemeColors.black,
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Image.asset(data["statuses"][0])),
                Positioned(
                    child: Header(data: data), top: 0, width: size.width),
              ],
            )),
      ),
    );
  }
}
