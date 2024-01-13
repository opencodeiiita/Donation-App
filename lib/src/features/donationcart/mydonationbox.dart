import 'package:donation_app/src/features/donationcart/item_card.dart';
import 'package:donation_app/src/features/donationcart/iconbutton.dart';
import 'package:flutter/material.dart';

import 'list_cart_item.dart';

class MyDonationBox extends StatefulWidget {
  const MyDonationBox({super.key});

  @override
  State<MyDonationBox> createState() => _MyDonationBoxState();
}

class _MyDonationBoxState extends State<MyDonationBox> {
  void fun(String type){
    if( map_item[type]==0){
      cart.add(CartItem(itemname: type));
      map_item[type]=1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("My Donation Box", style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.w600),),
            leading: BackButton(),
            actions: [cart.length!=0?TextButton(
              onPressed: (){},
                child: Text("confirm",
                  style: TextStyle(color: Colors.black),
                ),
              ):Text(''),
            ],
            backgroundColor: Colors.white,
          ),
          body: cart.length!=0?SingleChildScrollView(
            child: Column(
              children: [
                const Row(
                  children: [
                    Expanded(child: Center(
                        child: Text(
                          "Catagorey",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Center(
                      child: Text(
                        "Catagorey",
                        style: TextStyle(
                          fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ...cart,
              ],
            ),
          ):Center(child: Text("Empty Cart",style: TextStyle(fontSize: 30,color: Colors.grey),)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            width: 200,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        scrollable: true,
                        content: Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  TextButton(
                                      onPressed: (){
                                        setState(() {

                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Text('back',style: TextStyle(color: Colors.black),),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(child: IconB(name: "Shirts",ic: Icons.add,press: (){setState(() {fun("Shirts");});})),
                                  Expanded(child: IconB(name: "Pants",ic: Icons.add,press: (){setState(() {fun("Pants");});})),
                                  Expanded(child: IconB(name: "T-Shirts",ic: Icons.add,press: (){setState(() {fun("T-Shirts");});})),
                                  Expanded(child: IconB(name: "Jeans",ic: Icons.add,press: (){setState(() {fun("Jeans");});})),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(child: IconB(name: "Shoes",ic: Icons.add,press: (){setState(() {fun("Shoes");});})),
                                  Expanded(child: IconB(name: "Sweater",ic: Icons.add,press: (){setState(() {fun("Sweeter");});})),
                                  Expanded(child: IconB(name: "Dress",ic: Icons.add,press: (){setState(() {fun("Dress");});})),
                                  Expanded(child: IconB(name: "Suits",ic: Icons.add,press: (){setState(() {fun("Suits");});})),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(child: IconB(name: "Custom",ic: Icons.add,press: (){setState(() {fun("Custom");});})),
                                  Expanded(child: IconB(name: "Custom",ic: Icons.add,press: (){setState(() {fun("Custom");});})),
                                  Expanded(child: IconB(name: "Custom",ic: Icons.add,press: (){setState(() {fun("Custom");});})),
                                  Expanded(child: IconB(name: "Custom",ic: Icons.add,press: (){setState(() {fun("Custom");});})),
                                ],
                              ),
                            ],
                          ),
                        )
                      );
                    }
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff209fa6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Add To Box',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
            ),
          ),
        ),
      ]
    );
  }
}
