import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'ordersummary.dart';

void main() => runApp(MyApp(
      model: CartModel(),
    ));

class MyApp extends StatelessWidget {
  final CartModel model;

  const MyApp({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModel<CartModel>(
      model: model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: {'/cart': (context) => CartPage()},
        color: Colors.black,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  List<Product> _products = [
    Product(
        id: 1,
        title: "camera",
        price: 20.0,
        imgUrl:
            "https://static.bhphoto.com/images/images1500x1500/1568053262_1502001.jpg",
        qty: 1),
    Product(
        id: 2,
        title: "book",
        price: 40.0,
        imgUrl:
            "https://tiimg.tistatic.com/fp/1/006/296/cbse-and-icse-school-books-871.jpg",
        qty: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Shopping panel",
          style: TextStyle(color: Colors.black, letterSpacing: .6),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Colors.black,
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: _products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.8),
        itemBuilder: (context, index) {
          return ScopedModelDescendant<CartModel>(
              builder: (context, child, model) {
            return Card(
                child: Column(children: <Widget>[
              Image.network(
                _products[index].imgUrl,
                height: 120,
                width: 130,
              ),
              Text(
                _products[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("\$" + _products[index].price.toString()),
              OutlineButton(
                  child: Text("Add"),
                  onPressed: () => model.addProduct(_products[index]))
            ]));
          });
        },
      ),
    );
  }
}
