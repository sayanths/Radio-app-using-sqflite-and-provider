import 'package:flutter/material.dart';
import 'package:radio_app/model/radio.dart';
import 'package:radio_app/screens/now_playing/now_playing.dart';
import 'package:radio_app/screens/radio_row/radio_row.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  RadioModel radioModel = new RadioModel(
      id: 1,
      radioName: 'Test Radio 1',
      radioUrl: null.toString(),
      radioDesc: "test radio desc",
      radioWebsite: null.toString(),
      radioPic: "http://isharpeners.com/sc_logo.png",
      isBookMarked: false);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _appLogo(),
          _searchBar(),
          // RadioRow(radioModel: radioModel),
          // RadioRow(radioModel: radioModel),
          _radioList(),
          NowPlaying(
              radioTitle: "now playing",
              radioImageUrl: "http://isharpeners.com/sc_logo.png")
        ],
      ),
    );
  }

  Widget _appLogo() {
    return Container(
      width: double.infinity,
      color: Color.fromARGB(255, 25, 0, 68),
      height: MediaQuery.of(context).size.height / 10,
      child: const Center(
        child: Text(
          "Radio app",
          style: TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(Icons.search),
          Flexible(
              child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(5),
              hintText: 'search Radio',
            ),
            // controller: _searchQuery,
          )),
          Spacer(),
        ],
      ),
    );
  }

  Widget _radioList() {
    return Expanded(
        child: ListView(
      children: [
        ListView.separated(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return RadioRow(radioModel: radioModel);
            },
            separatorBuilder: ((context, index) {
              return Divider(
                height: 10,
              );
            }),
            itemCount: 10)
      ],
    ));
  }
}
