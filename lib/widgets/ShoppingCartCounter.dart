

import 'package:flutter/material.dart';

import '../Screens/Utils.dart';

class ShoppingCartCounter extends StatefulWidget {
  @override
  State<ShoppingCartCounter> createState() => _ShoppingCartCounterState();
}

class _ShoppingCartCounterState extends State<ShoppingCartCounter> {
  late int productCount;

  @override
  void initState() {
    productCount = 1;
    super.initState();
  }

  void updateProductCount(int amount){
    var newValue = productCount + amount;
    if(newValue > 0 ){
      setState(() {
        productCount = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColor.counterBackground,
      elevation: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: InkWell(
              onTap: (){ updateProductCount(-1);},
              borderRadius: BorderRadius.circular(24),
              splashColor: CustomColor.buttonClickRipple,
              splashFactory: InkRipple.splashFactory,
              child: Ink(
                width: 16,
                height: 16,
                child: Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            "$productCount",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 8,
          ),
          InkWell(
            onTap: (){ updateProductCount(1);},
            borderRadius: BorderRadius.circular(24),
            splashColor: CustomColor.buttonClickRipple,
            splashFactory: InkRipple.splashFactory,
            child: Ink(
              width: 32,
              height: 32,
              decoration: ShapeDecoration(
                  shape: CircleBorder(), color: Colors.black),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}