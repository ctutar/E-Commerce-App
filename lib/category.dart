import 'package:ecommerce/components/bottomNavigation.dart';
import 'package:ecommerce/components/header.dart';
import 'package:ecommerce/productDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  String categoryTitle;
  CategoryPage(this.categoryTitle);

  List<Map> products = [
    {
      "isim": "Surface Laptop 3",
      "fotoğraf": "assets/images/laptop1.png",
      "fiyat": "999"
    },
    {
      "isim": "Iphone 11 Pro ",
      "fotoğraf": "assets/images/laptop2.png",
      "fiyat": "999"
    },
    {
      "isim": "Macbook",
      "fotoğraf": "assets/images/laptop2.png",
      "fiyat": "999"
    },
    {
      "isim": "Surface Laptop 6",
      "fotoğraf": "assets/images/laptop1.png",
      "fiyat": "999"
    },
    {
      "isim": "Surface Laptop 7",
      "fotoğraf": "assets/images/laptop1.png",
      "fiyat": "999"
    },
    {
      "isim": "Surface Laptop 8",
      "fotoğraf": "assets/images/laptop2.png",
      "fiyat": "999"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //header
              header(categoryTitle, context),

              SizedBox(height: 32),
              //içerikler

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 10,
                  children: products.map((Map product) {
                    return buildContent(
                        product["isim"], product["fotoğraf"], product["fiyat"],context);
                  }).toList(),
                ),
              )
            ],
          )),
      //bottom navigation
      bottomNavigationBar("search"),
    ])));
  }
}

Widget buildContent(String title, String photoUrl, String price, context) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context!, MaterialPageRoute(builder: (context) {
        return ProductDetailPage(title);
      }));

    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 24,
              offset: Offset(0, 16))
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 16),
          Image.asset(photoUrl),
          SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "USD $price",
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
