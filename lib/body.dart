import 'package:flutter/material.dart';
import 'package:tradewinds/constants.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              product.title,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Text(
            "Rs. ${product.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Bags", "Clothes", "Footwear", "Acessories"];
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Wildcraft 30 Ltrs Blue Casual Backpack (11641-Blue)",
      price: 234,
      size: 30,
      description: dummyText,
      image: "assets/images/homeProd1.jpg",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "DUNE LONDON Tan Dinidorrie Di Medium Shoulder Bag",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/homeProd2.jpeg",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Men's Adidas Sport Inspired Grand Court Shoes",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/homeProd3.jpg",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "YOONIKK Mens Bomber Jacket",
      price: 234,
      size: 11,
      description: dummyText,
      image: "assets/images/homeProd4.jpg",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "QUECHUA Women's Mountain Walking Fleece Jacket MH120 - Black",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/homeProd5.jpg",
      color: Color(0xFF000000)),
  Product(
    id: 6,
    title: "Kalenji Support Women's shoes - Marina",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/homeProd6.jpg",
    color: Color(0xFF42A5F5),
  ),
];
String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 250.0,
      child:  new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/images/app_icon.png'),
          AssetImage('assets/images/carousel4.png'),
          AssetImage('assets/images/carousel1.png'),
          AssetImage('assets/images/carousel2.jpg'),
          AssetImage('assets/images/carousel3.jpg'),
        ],
        autoplay: true,
//      animationCurve: Curves.fastOutSlowIn,
//      animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        image_carousel,
        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                  product: products[index],
                )),
          ),
        ),
      ],
    );
  }
}