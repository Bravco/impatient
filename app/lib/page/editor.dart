import 'package:app/utils.dart' as utils;
import 'package:flutter/material.dart';

// Widget
import 'package:app/widget/outlined_icon_button.dart';

class EditorPage extends StatelessWidget {
  const EditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: utils.bgGradient,
        ),
        child: Center(
          child: OutlinedIconButton(
            onPressed: () {
              Navigator.pop(context);  
            },
            iconData: Icons.arrow_back_ios_new,
          ),
        ),
      ),
    );
  }
}