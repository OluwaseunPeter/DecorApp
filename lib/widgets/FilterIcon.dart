
import 'package:flutter/material.dart';

import '../Screens/Utils.dart';

class FilterIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      splashColor: CustomColor.buttonClickRipple,
      splashFactory: InkRipple.splashFactory,
      borderRadius: BorderRadius.circular(14),
      child: Ink(
        width: 50,
        height: 50,
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14)),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF6E7778),
                  Color(0xFF181C1D),
                ])),
        child: Icon(
          Icons.filter_alt_outlined,
          color: Colors.white,
        ),
      ),
    );
  }

}