import 'package:coffee_ui/coffee_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'coffee_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List coffeeTypes = [
    ["Cappuccino", true],
    ["Latte", false],
    ["Black", false],
    ["Tea", false],
  ];

  void coffeeTypeSelected(int index) {
    setState(() {

      for(int i=0;i<coffeeTypes.length;i++){
        coffeeTypes[i][1]= false;
      }

      coffeeTypes[index][1]= true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.person)],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text("Find the best coffee for you",
              style: GoogleFonts.bebasNeue(fontSize: 70)),
        ),

        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey,),
                hintText: "Find your coffee..",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green.shade600)
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)
                )
            ),
          ),
        ),

        SizedBox(height: 20,),

        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: coffeeTypes.length, itemBuilder: (context, index) {
                return CoffeeType(
                    coffeType: coffeeTypes[index][0],
                    isSelected: coffeeTypes[index][1],
                    onTapp: (){
                      coffeeTypeSelected(index);
                    });
            }),
        ),

        Expanded(child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            CoffeeItem(
              coffeeImagePath: 'images/cappuccino.jpg',
              coffeeName: 'Cappuccino',
              coffeePrice: '5.10',
            ),
          CoffeeItem(
              coffeeImagePath: 'images/latte.jpg',
              coffeeName: 'Latte',
              coffeePrice: '5.10',
            ),
          CoffeeItem(
              coffeeImagePath: 'images/milk.jpg',
              coffeeName: 'Black',
              coffeePrice: '5.90',
            ),
          ],
        ))
      ],),
    );
  }
}
