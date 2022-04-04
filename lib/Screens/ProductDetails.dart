import 'package:auto_route/auto_route.dart';
import 'package:decorapp/widgets/DecorColor.dart';
import 'package:decorapp/Screens/Utils.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/AddToCartButton.dart';
import '../widgets/DecorationCardV2.dart';
import '../widgets/ShoppingCartCounter.dart';

enum AnimProps { LisViewX }
class ProductDetails extends StatefulWidget {
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> with AnimationMixin {
  late final PageController _controller;
  late int _colorSelectionIndex;
  late bool _liked;

  TimelineTween<AnimProps> createTween() => TimelineTween<AnimProps>()
    ..addScene(
        begin: Duration.zero,
        end: const Duration(seconds: 20),
        curve: Curves.elasticOut)
        .animate(AnimProps.LisViewX,
        tween: Tween<double>(begin: 1, end: 0), curve: Curves.elasticOut);
  late Animation<TimelineValue<AnimProps>> _animation;

  static const images = ["img010.jpeg" , "img011.webp", "img012.jpeg"];

  Widget _buildPage(int index){
    return DecorationCardV2(imagePath: "images/${images[index]}");
  }

  void setColorSelectionIndex(int index){
    if(index != _colorSelectionIndex) {
      setState(() {
        _colorSelectionIndex = index;
      });
    }
  }

  void toggleLike(){
      setState(() {
        _liked = !_liked;
      });
  }

  @override
  void initState() {
    _controller = PageController(viewportFraction: 0.6);
    _animation = createTween().animate(controller);
    _colorSelectionIndex = 0;
    _liked = false;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.play(duration: Duration(seconds: 1));
    return Material(
        color: CustomColor.backgroundColor,
        child: SafeArea(
          child: Stack(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  margin: EdgeInsets.only(left: 16 , top: 16),
                  child: InkWell(
                    onTap: (){
                      context.router.navigateBack();
                    },
                    splashColor: CustomColor.buttonClickRipple,
                    splashFactory: InkRipple.splashFactory,
                    borderRadius: BorderRadius.circular(24),
                    child: Ink(
                      width: 44,
                      height: 44,
                      decoration:
                          ShapeDecoration(shape: CircleBorder(), color: CustomColor.backBtnBg),
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 350,
                  child: FractionalTranslation(
                    translation:
                    Offset(1.01 * _animation.value.get(AnimProps.LisViewX)
                        , 0),
                    child: PageView.builder(
                        physics: BouncingScrollPhysics(),
                        controller: _controller,
                        itemCount: 3,
                        itemBuilder: (context , index){
                      return _buildPage(index);
                    }),
                  )
                ),
                Align(
                  alignment: Alignment.center,
                  child: SmoothPageIndicator(
                    controller: _controller,
                    onDotClicked: (index){ _controller.animateToPage(
                        index, duration: Duration(milliseconds: 300), curve: Curves.easeOut);},
                    count: 3,
                    effect: WormEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                      activeDotColor: CustomColor.scrollColorActive,
                      dotColor: CustomColor.scrollColorInActive,
                      type: WormType.thin,
                      // strokeWidth: 5,
                    ),
                  ),
                ),
                SizedBox(height: 24,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Noom" , style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: 8,),
                              Text("Candles",  style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold
                              ),)],
                          ),
                          Text("\$50" , style: TextStyle(
                              fontSize: 32,
                          )
                          )
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                          "ORB is a set of seven metal candle holders stacked on top of one another to form a modern spherical sculpture. Designed to be functional.",
                          style: TextStyle(
                            fontWeight: FontWeight.w800
                          )
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              DecorColor(
                                color: CustomColor.decorColors1,
                                active: _colorSelectionIndex == 0,
                                onTap: (){setColorSelectionIndex(0);},
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              DecorColor(
                                color: CustomColor.decorColors2,
                                active: _colorSelectionIndex == 1,
                                onTap: (){setColorSelectionIndex(1);},
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              DecorColor(
                                color: CustomColor.decorColors3,
                                active: _colorSelectionIndex == 2,
                                onTap: (){setColorSelectionIndex(2);},
                              )
                            ],
                          ),
                          ShoppingCartCounter()
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),

              ]),
              Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 44 , vertical: 44),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){toggleLike();},
                        child: Ink(
                          width: 32,
                          height: 32,
                          decoration: ShapeDecoration(
                              shape: CircleBorder(), color: Colors.white),
                          child: Icon(
                            _liked ? Icons.favorite : Icons.favorite_outline,
                            color: _liked ? Colors.red : CustomColor.heartColor,
                          ),
                        ),
                      ),
                      AddToCartButton()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}
