import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/DecorationCard.dart';
import 'Utils.dart';

class ListingPage extends StatelessWidget {
  var currentlyDisplaying = [
    ["Noom", "Candel holders", "img003.jpeg"],
    ["Noom 1", "Candel holders 1", "img004.jpeg"],
    ["Noom 2", "Candel holders 2", "img005.jpeg"],
    ["Arm Rest", "Candel sitter", "img009.jpeg"],
    ["Arm Rest 1", "Candel sitter 1", "img007.jpeg"],
    ["Arm Rest 2", "Candel sitter 2", "img008.jpeg"],
    ["Neon", "Candel grabber", "chair1.jpeg"],
    ["Neon 1", "Candel grabber 1", "chair2.webp"],
    ["Neon 2", "Candel grabber 2", "chair3.jpeg"],
  ];

  final String pageName;

  ListingPage({
    Key? key,
    @PathParam('name') required this.pageName }) : super(key: key);

  Widget _buildCard(int index) {
    return SizedBox(
      height: 450,
      child: DecorationCard(
        title: currentlyDisplaying[index][0],
        subTitle: currentlyDisplaying[index][1],
        imageName: currentlyDisplaying[index][2],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: CustomColor.backgroundColor,
        child: SafeArea(
            child: Stack(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: EdgeInsets.only(left: 16, top: 16),
              child: Row(mainAxisSize: MainAxisSize.max, children: [
                InkWell(
                  onTap: () {
                    context.router.navigateBack();
                  },
                  splashColor: CustomColor.buttonClickRipple,
                  splashFactory: InkRipple.splashFactory,
                  borderRadius: BorderRadius.circular(24),
                  child: Ink(
                    width: 44,
                    height: 44,
                    decoration: ShapeDecoration(
                        shape: CircleBorder(), color: CustomColor.backBtnBg),
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 24,),
                Text(
                  pageName,
                  style: TextStyle(
                      fontSize: 32,
                      color: CustomColor.black,
                      fontWeight: FontWeight.w900),
                ),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return _buildCard(index);
                    }),
              ),
            )
          ]),
          SizedBox(
            height: 24,
          ),
        ])));
  }
}
