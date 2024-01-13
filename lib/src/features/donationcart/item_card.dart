import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  CartItem({super.key, this.itemname});
  final itemname;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int count=1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Row(
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.close)),
                  Text(
                    widget.itemname,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                children: [
                  Expanded(child: SizedBox.fromSize()),
                  Container(
                    child: IconButton(
                        onPressed: (){
                          setState(() {
                            if(count!=0){
                              count--;
                            }
                          });
                        },
                        icon: const Icon(Icons.remove)),
                  ),
                  Expanded(child: SizedBox.fromSize()),
                  Text(
                    "$count",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Expanded(child: SizedBox.fromSize()),
                  Container(
                    child: IconButton(
                        onPressed: (){
                          setState(() {
                            count++;
                          });
                        },
                        icon: const Icon(Icons.add)),
                  ),
                  Expanded(child: SizedBox.fromSize()),
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
