import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_status_screen/config/theme_colors.dart';
import 'package:whatsapp_status_screen/screens/home/status_item.dart';
import 'package:whatsapp_status_screen/screens/status_view/status_view.dart';

const List<Map> DUMMY_USERS = [
  {
    "username": "Tony Stark",
    "timestamp": "just now",
    "avatar": "assets/images/user-1.jpeg",
    "statuses": ["assets/images/tony-stark-status-1.jpeg"],
    "tag": "tony"
  },
  {
    "username": "Loki Laufeyson",
    "timestamp": "just now",
    "avatar": "assets/images/loki.jpeg",
    "statuses": ["assets/images/loki-status-1.jpeg"],
    "tag": "loki"
  },
  {
    "username": "Thor Odinson",
    "timestamp": "just now",
    "avatar": "assets/images/thor.jpeg",
    "statuses": ["assets/images/thor-status-1.jpeg"],
    "tag": "thor"
  },
  {
    "username": "Doctor Strange",
    "timestamp": "just now",
    "avatar": "assets/images/user-2.jpeg",
    "statuses": ["assets/images/doctor-strange-status-1.jpeg"],
    "tag": "doctor-strange"
  },
  {
    "username": "Wanda Maximoff",
    "timestamp": "just now",
    "avatar": "assets/images/wanda.jpeg",
    "statuses": ["assets/images/wanda-status-1.jpeg"],
    "tag": "wanda"
  },
  {
    "username": "Natasha Romanoff",
    "timestamp": "just now",
    "avatar": "assets/images/black-widow.jpeg",
    "statuses": ["assets/images/black-widow-status-1.jpeg"],
    "tag": "natasha"
  },
  {
    "username": "Bruce Banner",
    "timestamp": "just now",
    "avatar": "assets/images/bruce-banner.jpeg",
    "statuses": ["assets/images/bruce-banner-status-1.jpeg"],
    "tag": "bruce"
  },
  {
    "username": "Odin",
    "timestamp": "just now",
    "avatar": "assets/images/odin.jpeg",
    "statuses": ["assets/images/odin-status-1.jpeg"],
    "tag": "odin"
  },
  {
    "username": "Surter",
    "timestamp": "just now",
    "avatar": "assets/images/surter.jpeg",
    "statuses": ["assets/images/surter-status-1.jpeg"],
    "tag": "surter"
  },
  {
    "username": "Dormammu",
    "timestamp": "just now",
    "avatar": "assets/images/dormamu.jpeg",
    "statuses": ["assets/images/dormammu-status-1.jpeg"],
    "tag": "dormammu"
  }
];

class Home extends StatelessWidget {
  final BoxDecoration statusItemDecoration = BoxDecoration(
      border: Border(bottom: BorderSide(color: ThemeColors.grey, width: 0.2)));
  final Map myData = {
    "username": "My Status",
    "timestamp": "Add to my status",
    "avatar": "assets/images/me.JPG",
    "statuses": ["assets/images/me.JPG"],
    "tag": "my-status"
  };

  @override
  Widget build(BuildContext context) {
    void navigateToStatusView(Map data) {
      Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (BuildContext context) => StatusView(
                    data: data,
                  )));
    }

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
                    data: myData,
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
                                onTap: () {
                                  navigateToStatusView(e);
                                },
                                data: e,
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
