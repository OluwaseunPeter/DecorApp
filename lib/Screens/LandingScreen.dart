import 'package:auto_route/auto_route.dart';
import 'package:decorapp/Screens/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_animations/simple_animations.dart';

import '../AppRouter.dart';

enum AnimProp { titleX, circleX, descriptionX, headingX, arrowX }
enum PulseProp { scale, color }

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnimationDeveloperTools(
          position: AnimationDeveloperToolsPosition.hidden,
          child: LandingScreenWidget()),
    );
  }
}

class LandingScreenWidget extends StatefulWidget {
  const LandingScreenWidget({Key? key}) : super(key: key);

  @override
  State<LandingScreenWidget> createState() => _LandingScreenWidgetState();
}

class _LandingScreenWidgetState extends State<LandingScreenWidget>
    with AnimationMixin {
  TimelineTween<AnimProp> createTween() => TimelineTween<AnimProp>()
    ..addScene(
            // Lets's decor your home
            begin: Duration.zero,
            end: const Duration(seconds: 10),
            curve: Curves.elasticOut)
        .animate(AnimProp.headingX, tween: Tween<double>(begin: -290, end: 16))
    ..addScene(
            // NeoDecor
            begin: Duration(seconds: 2),
            duration: Duration(seconds: 12),
            curve: Curves.elasticOut)
        .animate(AnimProp.titleX, tween: Tween<double>(begin: -150, end: 16))
    ..addScene(
            // Be Faithful Decription
            begin: Duration(seconds: 3),
            duration: Duration(seconds: 13),
            curve: Curves.elasticOut)
        .animate(AnimProp.descriptionX,
            tween: Tween<double>(begin: -260, end: 16))
    ..addScene(
            //Circle
            begin: Duration(seconds: 4, milliseconds: 200),
            duration: Duration(seconds: 15),
            curve: Curves.elasticOut)
        .animate(AnimProp.circleX, tween: Tween<double>(begin: -500, end: -190))
    ..addScene(
            // Arrow
            begin: Duration(seconds: 4, milliseconds: 400),
            duration: Duration(seconds: 10),
            curve: Curves.elasticOut)
        .animate(AnimProp.arrowX, tween: Tween<double>(begin: -70, end: 16));

  TimelineTween<PulseProp> createPulseTween() => TimelineTween<PulseProp>()
    ..addScene(
            // Lets's decor your home
            begin: Duration.zero,
            end: const Duration(seconds: 10),
            curve: Curves.easeInOutCirc)
        .animate(PulseProp.scale, tween: Tween<double>(begin: 1, end: 3))
        .animate(PulseProp.color,
            tween: ColorTween(
                begin: CustomColor.circleColor,
                end: CustomColor.backgroundColor));

  late Animation<TimelineValue<AnimProp>> animation;

  late AnimationController _pulseController;
  late Animation<TimelineValue<PulseProp>> _pulseAnimation;

  @override
  void initState() {
    animation = createTween().animate(controller);

    _pulseController = createController();
    _pulseAnimation = createPulseTween().animate(_pulseController);

    // enableDeveloperMode(_pulseController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.play(duration: Duration(seconds: 1, milliseconds: 800));
    return Material(
      color: CustomColor.landingBackgroundColor,
      child: SafeArea(
        child: Stack(
          children: [
            Visibility(
              visible: false,
              child: Positioned(
                top: 2,
                left: 0,
                bottom: 0,
                child: Container(
                  width: 310,
                  height: 100,
                  color: CustomColor.tabColor,
                ),
              ),
            ),
            Positioned(
              top: 24,
              left: animation.value.get(AnimProp.titleX),
              child: Row(
                children: [
                  Text("Neo",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w900)),
                  Text("Decor",
                      style: TextStyle(
                          fontSize: 32,
                          color: CustomColor.neoOtherColor,
                          fontWeight: FontWeight.w900)),
                ],
              ),
            ),
            Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                child: Transform.translate(
                  offset: Offset(animation.value.get(AnimProp.circleX) , 85),
                  child : Transform.scale(
                    scale: _pulseAnimation.value.get(PulseProp.scale),
                    child: Ink(
                        width: 500,
                        decoration: ShapeDecoration(
                            shape: CircleBorder(),
                            color: _pulseAnimation.value.get(PulseProp.color)),
                      ),
                  ),

                )),
            Align(
              alignment: Alignment(-1.0, -0.25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: Offset(animation.value.get(AnimProp.headingX), 0),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Let's",
                              style: TextStyle(
                                  fontSize: 60, fontWeight: FontWeight.w600)),
                          Text("decor",
                              style: TextStyle(
                                  fontSize: 60,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600)),
                          Text("your home",
                              style: TextStyle(
                                  fontSize: 60, fontWeight: FontWeight.w600)),
                        ]),
                  ),
                  SizedBox(
                    height: 44,
                  ),
                  Transform.translate(
                    offset:
                        Offset(animation.value.get(AnimProp.descriptionX), 0),
                    child: Text(
                      "Be faithful to your own taste, because\nnothing you really like is ever out of style",
                    ),
                  ),
                  SizedBox(
                    height: 44,
                  ),
                  Transform.translate(
                    offset: Offset(animation.value.get(AnimProp.arrowX), 0),
                    child: GestureDetector(
                      onTap: () {
                        _pulseController
                            .play(duration: Duration(milliseconds: 450))
                            .whenComplete(() {
                          context.router
                              .navigateNamed(Screens.homeScreen)
                              .whenComplete(() {
                            _pulseController.reset();
                            controller.reset();
                          });
                        });
                      },
                      child: SizedBox(
                        height: 24,
                        width: 74,
                        child: SvgPicture.asset(
                          "images/long_arrow.svg",
                          width: 74,
                          fit: BoxFit.fitWidth,
                          color: CustomColor.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
