
import 'package:flutter/material.dart';

import '../Screens/Utils.dart';

class DecorColor extends StatelessWidget {
  final Color color;
  final bool active;
  final GestureTapCallback? onTap;
  const DecorColor({
    Key? key,
    required this.color,
    this.active = false,
    this.onTap
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Stack(
        children: [
          Visibility(
            visible: active,
            child: Align(
              alignment: Alignment.center,
              child: Ink(
                decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    color: color.withAlpha(150)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              splashColor: color.withOpacity(0.3),
              splashFactory: InkRipple.splashFactory,
              onTap: onTap,
              child: Ink(
              width: 32,
              height: 32,
              decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  color: color),
        ),
            ),
          ),
        ]
      ),
    );
  }

}