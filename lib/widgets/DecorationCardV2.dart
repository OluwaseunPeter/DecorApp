
import 'package:flutter/material.dart';

class DecorationCardV2 extends StatelessWidget {
  final String imagePath;
  const DecorationCardV2({
    Key? key,
    required this.imagePath
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        elevation: 12,
        margin: EdgeInsets.only(left: 12 , top: 24 , bottom: 24),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fill,
                )),
          ],
        ),
      ),
    );
  }

}