import 'package:app/utils.dart' as utils;
import 'package:flutter/material.dart';
import 'dart:async';

class EventTile extends StatefulWidget {
  final String title;
  final String imagePath;
  final DateTime targetDate;

  const EventTile({
    super.key,
    required this.title,
    required this.imagePath,
    required this.targetDate,
  });

  @override
  State<EventTile> createState() => _EventTileState();
}

class _EventTileState extends State<EventTile> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => setState((){}));
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            width: 288,
            height: 128,
            decoration: BoxDecoration(
              color: utils.color30,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.title,
                          style: utils.h2TextStyle,
                        ),
                        TextSpan(
                          text: " in",
                          style: utils.h3TextStyle,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
"${DateTime.now().difference(widget.targetDate).abs().inDays}:"
"${DateTime.now().difference(widget.targetDate).abs().inHours - DateTime.now().difference(widget.targetDate).abs().inDays * 24}:"
"${DateTime.now().difference(widget.targetDate).abs().inMinutes - DateTime.now().difference(widget.targetDate).abs().inHours * 60}:"
"${DateTime.now().difference(widget.targetDate).abs().inSeconds - DateTime.now().difference(widget.targetDate).abs().inMinutes * 60}",
                    style: TextStyle(
                      fontFamily: "RobotoMono",
                      color: utils.color10,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: utils.color30,
                shape: BoxShape.circle,
              ),
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  Transform.scale(
                    scale: .6,
                    child: Image.asset(widget.imagePath),
                  ),
                  CircularProgressIndicator(
                    value: .1,
                    backgroundColor: utils.colorText,
                    color: utils.color10,
                    strokeWidth: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}