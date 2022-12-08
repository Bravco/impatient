import 'package:app/utils.dart' as utils;
import 'package:flutter/material.dart';

// Pub
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

// Model
import 'package:app/model/event.dart';

// Page
import 'package:app/page/editor.dart';

class EventTile extends StatefulWidget {
  final Event event;

  const EventTile({
    super.key,
    required this.event,
  });

  @override
  State<EventTile> createState() => _EventTileState();
}

class _EventTileState extends State<EventTile> {
  double value() {
    double value = 1 - (
      widget.event.targetDate.difference(DateTime.now()).inMinutes /
      widget.event.targetDate.difference(widget.event.createdDate).inMinutes
    );

    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
      child: FocusedMenuHolder(
        onPressed: () {},
        menuWidth: MediaQuery.of(context).size.width / 2,
        menuOffset: 16,
        menuItems: [
          FocusedMenuItem(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditorPage(event: widget.event)),
              );
            },
            backgroundColor: utils.color30,
            title: Text(
              "Edit",
              style: utils.h4TextStyle,
            ),
            trailingIcon: Icon(
              Icons.edit,
              size: 24,
              color: utils.colorTextAlt,
            ),
          ),
          FocusedMenuItem(
            onPressed: () => widget.event.delete(),
            backgroundColor: utils.color30,
            title: Text(
              "Delete",
              style: utils.h4TextStyle,
            ),
            trailingIcon: Icon(
              Icons.delete_forever,
              size: 24,
              color: utils.color10,
            ),
          ),
        ],
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              width: 288,
              height: 128,
              decoration: BoxDecoration(
                color: utils.color30,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [utils.boxShadow],
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
                            text: widget.event.title,
                            style: utils.h2TextStyle,
                          ),
                          TextSpan(
                            text: " in",
                            style: utils.h4TextStyleAlt,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
      "${DateTime.now().difference(widget.event.targetDate).abs().inDays}:"
      "${DateTime.now().difference(widget.event.targetDate).abs().inHours - DateTime.now().difference(widget.event.targetDate).abs().inDays * 24}:"
      "${DateTime.now().difference(widget.event.targetDate).abs().inMinutes - DateTime.now().difference(widget.event.targetDate).abs().inHours * 60}:"
      "${DateTime.now().difference(widget.event.targetDate).abs().inSeconds - DateTime.now().difference(widget.event.targetDate).abs().inMinutes * 60}",
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
                  boxShadow: [utils.boxShadow],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  children: [
                    Transform.scale(
                      scale: .6,
                      child: Image.asset("assets/images/${widget.event.imageIndex}.png"),
                    ),
                    CircularProgressIndicator(
                      value: value(),
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
      ),
    );
  }
}