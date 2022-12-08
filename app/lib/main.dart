import 'package:app/utils.dart' as utils;
import 'package:flutter/material.dart';
import 'dart:async';

// Model
import 'package:app/model/event.dart';

// Data
import 'package:app/data/events.dart';

// Widget
import 'package:app/widget/event_tile.dart';
import 'package:app/widget/outlined_icon_button.dart';

// Page
import 'package:app/page/editor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: utils.color10),
      ),
      home: const SafeArea(
        child: Page(),
      ),
    );
  }
}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => setState((){}));
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: utils.bgGradient,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Impatient.",
                    style: utils.h1TextStyle,
                  ),
                  Transform.rotate(
                    angle: .5,
                    child: Image.asset(
                      "assets/images/hourglass.png",
                      width: 80,
                      height: 80,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              indent: 64,
              endIndent: 64,
              color: utils.colorText,
              thickness: 2,
            ),
            Expanded(
              child: ListView(
                children: buildList(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildList(BuildContext context) {
    List<Widget> temp = [];

    for (Event event in events) {
      temp.add(EventTile(
        title: event.title,
        imageIndex: event.imageIndex,
        targetDate: event.targetDate,
      ));
    }

    temp.add(Padding(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: OutlinedIconButton(
          onPressed: () {
            _timer?.cancel();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EditorPage()),
            ).then((value) {
              setState(() {});
              _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => setState((){}));
            });
          },
          iconData: Icons.add,
        ),
      ),
    ));

    return temp;
  }
}