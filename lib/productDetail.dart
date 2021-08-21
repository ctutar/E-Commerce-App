import 'package:ecommerce/components/bottomNavigation.dart';
import 'package:ecommerce/components/header.dart';
import 'package:ecommerce/components/label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  String productTitle;

  ProductDetailPage(this.productTitle);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedCapacity = 64;

  List<Color> colors = [
    Color(0xFF52514F),
    Color(0xFF0001FC),
    Color(0xFF6F7972),
    Color(0xFFF5C8D0),
  ];

  List<int> capacities = [64 , 256 , 512];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //header
            header(widget.productTitle, context),

            SizedBox(height: 32),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //NEW ETİKETİ
                    //label("New"),

                    SizedBox(height: 0),

                    //ÜRÜN FOTO
                    Center(child: Image.asset("assets/images/iPhone.png")),

                    SizedBox(height: 32),

                    //RENK SEÇENEKLERİ
                    Text("Color",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                    SizedBox(height: 16),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: colors
                            .map((Color color) => colorOption(color))
                            .toList()),

                    //KAPASİTE SEÇENEKLERİ
                    SizedBox(height: 32),
                    Text("Capacity",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: capacities
                          .map((int number) => capacityOption(capacity: number, selected: selectedCapacity== number, onTap: (){
                            setState(() {
                              selectedCapacity=number;
                            });
                      }))
                          .toList(),
                    ),
                    
                    SizedBox(height: 32),

                    //SEPETE EKLE BUTONU
                    GestureDetector(
                      onTap: (){
                        print("Ürün Sepete Eklendi.");

                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),
                        color: Color(0xFF1F53E4)),
                        child: Text("Add to Cart", textAlign: TextAlign.center, style: TextStyle(fontSize: 19, color: Colors.white, fontWeight: FontWeight.w600),),
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            )
          ])),
              bottomNavigationBar("search"),
    ])));
  }
}

Widget colorOption(Color color) {
  return Container(
    margin: EdgeInsets.only(right: 15),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color,
    ),
    width: 22,
    height: 23,
  );
}

Widget capacityOption({int? capacity, bool? selected, Function? onTap}) {
  return Text(
    "$capacity GB  ",
    style: TextStyle(color: Color(0xFFE053D5), fontSize: 16),
  );
}
