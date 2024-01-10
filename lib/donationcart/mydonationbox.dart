import 'package:donation_app/donationcart/item_card.dart';
import 'package:donation_app/donationcart/iconbutton.dart';
import 'package:flutter/material.dart';

import 'list_cart_item.dart';

class MyDonationBox extends StatefulWidget {
  const MyDonationBox({super.key});

  @override
  State<MyDonationBox> createState() => _MyDonationBoxState();
}

class _MyDonationBoxState extends State<MyDonationBox> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("My Donation Box", style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.w600),),
            leading: BackButton(),
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
                                      child: Text('back'),
                                  ),
                                ],
                              ),
                              const Row(
                                children: [
                                  Expanded(child: IconB(name: "Shirts",ic: Icons.add,)),
                                  Expanded(child: IconB(name: "Pants",ic: Icons.add,)),
                                  Expanded(child: IconB(name: "T-Shirts",ic: Icons.add,)),
                                  Expanded(child: IconB(name: "Jeans",ic: Icons.add,)),
                                ],
                              ),
                              const Row(
                                children: [
                                  Expanded(child: IconB(name: "Shoes",ic: Icons.add,)),
                                  Expanded(child: IconB(name: "Sweater",ic: Icons.add,)),
                                  Expanded(child: IconB(name: "Dress",ic: Icons.add,)),
                                  Expanded(child: IconB(name: "Suits",ic: Icons.add,)),
                                ],
                              ),
                              const Row(
                                children: [
                                  Expanded(child: IconB(name: "Custom",ic: Icons.add,)),
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
