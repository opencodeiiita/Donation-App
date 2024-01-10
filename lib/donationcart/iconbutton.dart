import 'package:donation_app/donationcart/item_card.dart';
import 'package:flutter/material.dart';
import 'list_cart_item.dart';

import '../feedPage.dart';

class IconB extends StatelessWidget {
  const IconB({super.key, required this.name, required this.ic});
  final String name;
  final IconData ic;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Ink(
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(25),
                right: Radius.circular(25),
              ),
            ),
            color: tealLikeColor,
          ),
          child: IconButton(
              onPressed: (){
                cart.add(CartItem(itemname: name));
                Navigator.pop;
              },
              icon: Icon(ic, color: Colors.white)),
        ),
        Text(name,style: TextStyle(fontSize: 8),),
      ]
    );
  }
}
