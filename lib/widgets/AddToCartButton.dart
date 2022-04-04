
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Screens/Utils.dart';

class AddToCartButton extends StatelessWidget {

  late  FToast fToast;
  void showToast(){
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check , color: Colors.black,),
          SizedBox(
            width: 12.0,
          ),
          Text("Product Added Successfully", style: TextStyle(
            color: Colors.black
          ),
          ),
        ],
      ),
    );


    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    fToast = FToast();
    fToast.init(context);

    return Card(
        color: CustomColor.black,
        elevation: 8,
        margin: EdgeInsets.symmetric(horizontal: 24),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        child:
        InkWell(
          onTap: (){ showToast();},
          splashFactory: InkRipple.splashFactory,
          splashColor: CustomColor.buttonClickRipple,
          child: Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12, left: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Add to cart",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 24,
                ),
                Ink(
                  decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: CustomColor.cartIconBackground),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.add_shopping_cart,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
        )
    );
  }

}