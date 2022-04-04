
import 'package:auto_route/auto_route.dart';
import 'package:decorapp/AppRouter.dart';
import 'package:decorapp/Screens/Utils.dart';
import 'package:flutter/material.dart';

class DecorationCard extends StatefulWidget {

  final String imageName;
  final String title;
  final String subTitle;

  const DecorationCard({
    Key? key,
    required this.imageName,
    required this.title,
    required this.subTitle
  }) : super(key: key);

  @override
  State<DecorationCard> createState() => _DecorationCardState();
}

class _DecorationCardState extends State<DecorationCard> {

  late bool _liked;

  @override
  void initState() {
    _liked = false;
    super.initState();
  }

  void toggleLike(){
    setState(() {
      _liked = !_liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.all(12),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: GestureDetector(
          onTap: (){
            context.router.navigateNamed(Screens.productDetails);
          },
          child: Stack(
            children: [
              Positioned.fill(
                  child: Image.asset(
                    "images/${widget.imageName}",
                    fit: BoxFit.fill,
                  )),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      decoration:  BoxDecoration(
                          gradient:  LinearGradient(
                              begin: Alignment.topCenter,
                              end:  Alignment.bottomCenter,
                              colors:  [
                                CustomColor.carGradientStart,
                                CustomColor.cardGradientEnd
                              ]
                          )
                      ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 12 , right: 12 , bottom: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: TextStyle(
                                    color: Colors.white,
                                  fontWeight: FontWeight.w800
                                ),
                              ),
                              Text(
                                widget.subTitle,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {toggleLike();},
                            icon: Icon(
                                _liked ? Icons.favorite : Icons.favorite_outline,
                                color: _liked ? Colors.red :  Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}