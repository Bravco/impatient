import 'package:app/utils.dart' as utils;
import 'package:flutter/material.dart';

class OutlinedIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData iconData;

  const OutlinedIconButton({
    super.key,
    required this.onPressed,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: utils.colorText, width: 2),
            shape: BoxShape.circle,
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            iconData,
            color: utils.colorText,
          ),
        ),
      ],
    );
  }
}