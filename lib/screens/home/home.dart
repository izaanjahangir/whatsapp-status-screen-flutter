import 'package:flutter/material.dart';
import 'package:whatsapp_status_screen/config/theme_colors.dart';
import 'package:whatsapp_status_screen/screens/home/status_item.dart';

const List<Map<String, String>> DUMMY_USERS = [
  {
    "username": "Tony Stark",
    "timestamp": "just now",
    "avatar": "assets/images/user-1.jpeg"
  },
  {
    "username": "Loki Odinson",
    "timestamp": "just now",
    "avatar": "assets/images/loki.jpeg"
  },
  {
    "username": "Thor Odinson",
    "timestamp": "just now",
    "avatar": "assets/images/thor.jpeg"
  },
  {
    "username": "Doctor Strange",
    "timestamp": "just now",
    "avatar": "assets/images/user-2.jpeg"
  }
];

class Home extends StatelessWidget {
  final BoxDecoration statusItemDecoration = BoxDecoration(
      border: Border(bottom: BorderSide(color: ThemeColors.grey, width: 0.2)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: ThemeColors.black,
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Status",
                      style: TextStyle(
                          color: ThemeColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 26)),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: StatusItem(
                    avatarPath: "assets/images/me.JPG",
                    heading: "My Status",
                    text: "Add to my status",
                    isMyStatus: true,
                  ),
                  decoration: BoxDecoration(
                      color: ThemeColors.lightBlack,
                      border: Border.symmetric(
                          horizontal:
                              BorderSide(color: ThemeColors.grey, width: 0.2))),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "RECENT UPDATES",
                    style: TextStyle(color: ThemeColors.grey, fontSize: 12),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    children: [
                      ...DUMMY_USERS
                          .map((e) => StatusItem(
                                avatarPath: e["avatar"],
                                heading: e['username'],
                                text: e["timestamp"],
                                containerDecoration: statusItemDecoration,
                              ))
                          .toList(),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: ThemeColors.lightBlack,
                      border: Border.symmetric(
                          horizontal:
                              BorderSide(color: ThemeColors.grey, width: 0.2))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
