import 'package:auto_route/auto_route.dart';
import 'package:decorapp/AppRouter.gr.dart';
import 'package:decorapp/Screens/ListingPage.dart';
import 'package:decorapp/widgets/DecorationCard.dart';
import 'package:decorapp/Screens/Utils.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../AppRouter.dart';
import '../widgets/FilterIcon.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnimationDeveloperTools(
          position: AnimationDeveloperToolsPosition.hidden, child: HomeWidget()),
    );
  }
}

enum AnimProps {
  HeadingX,
  SearchBoxX,
  SearchIconX,
  TabX,
  LisViewX,
  NavIconY,
  NavCntY
}

class HomeWidget extends StatefulWidget {
  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with SingleTickerProviderStateMixin, AnimationMixin {
  late TabController _tabController;

  TimelineTween<AnimProps> createTween() => TimelineTween<AnimProps>()
    ..addScene(
            // Lets's decor your home
            begin: Duration.zero,
            end: const Duration(seconds: 10),
            curve: Curves.easeInOutCirc)
        .animate(AnimProps.HeadingX, tween: Tween<double>(begin: 1, end: 0))
        .animate(AnimProps.SearchBoxX, tween: Tween<double>(begin: 1, end: 0))
        .animate(AnimProps.SearchIconX, tween: Tween<double>(begin: 1, end: 0))
        .animate(AnimProps.TabX, tween: Tween<double>(begin: 1, end: 0))
        .animate(AnimProps.NavCntY, tween: Tween<double>(begin: 1, end: 0))
    ..addScene(
            begin: Duration.zero,
            end: const Duration(seconds: 20),
            curve: Curves.elasticOut)
        .animate(AnimProps.LisViewX,
            tween: Tween<double>(begin: 1, end: 0), curve: Curves.elasticOut)
    ..addScene(
            begin: Duration(seconds: 6),
            end: const Duration(seconds: 20),
            curve: Curves.elasticOut)
        .animate(AnimProps.NavIconY, tween: Tween<double>(begin: 1, end: 0));

  late Animation<TimelineValue<AnimProps>> _animation;

  var Trending =  [ ["Noom" , "Candel holders", "img003.jpeg"],
    ["Noom 1" , "Candel holders 1", "img004.jpeg"],
    ["Noom 2" , "Candel holders 2", "img005.jpeg"],
  ];

  var Chairs = [ ["Neon" , "Candel grabber", "chair1.jpeg"],
    ["Neon 1" , "Candel grabber 1", "chair2.webp"],
    ["Neon 2" , "Candel grabber 2", "chair3.jpeg"],
  ];

  var Decors = [ ["Arm Rest" , "Candel sitter", "img009.jpeg"],
    ["Arm Rest 1" , "Candel sitter 1", "img007.jpeg"],
    ["Arm Rest 2" , "Candel sitter 2", "img008.jpeg"],
  ];

  late var currentlyDisplaying  ;

  Widget _buildCard(int index) {
    var card = DecorationCard(
      title: currentlyDisplaying[index][0],
      subTitle: currentlyDisplaying[index][1],
      imageName: currentlyDisplaying[index][2],
    );

    if(index == 0 ){
      return Padding(padding: EdgeInsets.only(left: 12) , child:  card);
    }

    if(index == 2){
      return Padding(padding: EdgeInsets.only(right: 12) , child:  card);
    }

    return  card;
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
        var currentData = Trending;
        if(_tabController.index == 1){
          currentData = Decors;
        }else if(_tabController.index == 2){
          currentData = Chairs;
        }

        if(currentData != currentlyDisplaying) {
          setState(() {
            currentlyDisplaying = currentData;
          });
        }
    });
    _animation = createTween().animate(controller);
    currentlyDisplaying = Trending;
    enableDeveloperMode(controller);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.play(duration: Duration(seconds: 1));
    return SafeArea(
      child: Material(
          color: CustomColor.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 24, right: 24, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Transform.translate(
                      offset: Offset(
                          -180 * _animation.value.get(AnimProps.HeadingX), 0),
                      child: Text(
                        "Discover\nNew items",
                        style: TextStyle(
                            fontSize: 32,
                            color: CustomColor.black,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: FractionalTranslation(
                            translation: Offset(
                                -1.1 * _animation.value.get(AnimProps.SearchBoxX),
                                0),
                            child: TextField(
                                decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(14)),
                              hintText: "Search products",
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(Icons.search),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Transform.translate(
                            offset: Offset(
                                80 *
                                    _animation.value.get(AnimProps.SearchIconX),
                                0),
                            child: FilterIcon())
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              FractionalTranslation(
                translation: Offset(-1.0 * _animation.value.get(AnimProps.TabX)
                    , 0),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: TabBar(
                      labelColor: CustomColor.scrollColorActive,
                      labelStyle: TextStyle(fontWeight: FontWeight.w600),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: CustomColor.scrollColorActive,
                      unselectedLabelColor: CustomColor.tabColor,
                      controller: _tabController,
                      tabs: [
                        Tab(
                          child: Text("Trending"),
                        ),
                        Tab(
                          child: Text("Decor"),
                        ),
                        Tab(
                          child: Text("Chairs"),
                        )
                      ]),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Flexible(
                child: FractionalTranslation(
                  translation:
                      Offset(1.01 * _animation.value.get(AnimProps.LisViewX)
                          , 0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 3,
                    restorationId: "${currentlyDisplaying.hashCode}",
                    itemBuilder: (context , index){
                      return _buildCard(index);
                    }
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              FractionalTranslation(
                translation:
                    Offset(0,
                        1.1  * _animation.value.get(AnimProps.NavCntY)
                    ),
                child: Card(
                    color: CustomColor.black,
                    elevation: 24,
                    margin: EdgeInsets.only(left: 24, right: 24, bottom: 32),
                    // clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      child: Transform.translate(
                        offset: Offset(
                            0, -60 * _animation.value.get(AnimProps.NavIconY)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                controller.repeat();
                              },
                              icon:
                                  Icon(Icons.home_outlined, color: Colors.red),
                            ),
                            IconButton(
                              onPressed: () {
                                context.router
                                    .navigate(ListingPageRoute(pageName: "Favorites"));
                              },
                              icon: Icon(Icons.favorite_outline,
                                  color: Colors.white),
                            ),
                            IconButton(
                              onPressed: () {
                                context.router
                                    .navigate(ListingPageRoute(pageName: "Cart Items"));
                              },
                              icon: Icon(Icons.shopping_cart_outlined,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          )),
    );
  }
}
