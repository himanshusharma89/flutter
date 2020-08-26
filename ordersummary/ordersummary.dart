import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartPageState();
  }
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text("Cart"),
          elevation: 0,
          actions: <Widget>[
            FlatButton(
                child: Text(
                  "Clear",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => ScopedModel.of<CartModel>(context).clearCart())
          ],
        ),
        body: ScopedModel.of<CartModel>(context, rebuildOnChange: true)
                    .cart
                    .length ==
                0
            ? Center(
                child: Text("No items in Cart"),
              )
            : Container(
                padding: EdgeInsets.all(8.0),
                child: Column(children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: ScopedModel.of<CartModel>(context,
                              rebuildOnChange: true)
                          .total,
                      itemBuilder: (context, index) {
                        return ScopedModelDescendant<CartModel>(
                          builder: (context, child, model) {
                            return ListTile(
                              title: Text(model.cart[index].title),
                              subtitle: Text(model.cart[index].qty.toString() +
                                  " x " +
                                  model.cart[index].price.toString() +
                                  " = " +
                                  (model.cart[index].qty *
                                          model.cart[index].price)
                                      .toString()),
                              trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        model.updateProduct(model.cart[index],
                                            model.cart[index].qty + 1);
                                        // model.removeProduct(model.cart[index]);
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        model.updateProduct(model.cart[index],
                                            model.cart[index].qty - 1);
                                        // model.removeProduct(model.cart[index]);
                                      },
                                    ),
                                  ]),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Total: \$ " +
                            ScopedModel.of<CartModel>(context,
                                    rebuildOnChange: true)
                                .totalCartValue
                                .toString() +
                            "",
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      )),
                  FloatingActionButton.extended(
                    backgroundColor: const Color(0xFF42A5F5),
                    foregroundColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Secondpage()));
                    },
                    icon: Icon(Icons.thumb_up, color: Colors.white),
                    label: Text('BUY NOW'),
                  ),
                ])));
  }
}

class CartModel extends Model {
  List<Product> cart = [];
  double totalCartValue = 0;

  int get total => cart.length;

  void addProduct(product) {
    int index = cart.indexWhere((i) => i.id == product.id);
    print(index);
    if (index != -1)
      updateProduct(product, product.qty + 1);
    else {
      cart.add(product);
      calculateTotal();
      notifyListeners();
    }
  }

  void removeProduct(product) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].qty = 1;
    cart.removeWhere((item) => item.id == product.id);
    calculateTotal();
    notifyListeners();
  }

  void updateProduct(product, qty) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].qty = qty;
    if (cart[index].qty == 0) removeProduct(product);

    calculateTotal();
    notifyListeners();
  }

  void clearCart() {
    cart.forEach((f) => f.qty = 1);
    cart = [];
    notifyListeners();
  }

  void calculateTotal() {
    totalCartValue = 0;
    cart.forEach((f) {
      totalCartValue += f.price * f.qty;
    });
  }
}

class Product {
  int id;
  String title;
  String imgUrl;
  double price;
  int qty;

  static var length;

  Product({this.id, this.title, this.price, this.qty, this.imgUrl});
}

/* ordersummarypage*/
class Secondpage extends StatefulWidget {
  @override
  _SecondpageState createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  @override
  Widget build(BuildContext context) {
    /*return Container();*/
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text("Order summary"),
          elevation: 0,
          actions: <Widget>[
            FlatButton(
                child: Text(
                  "Remove Item",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => ScopedModel.of<CartModel>(context).clearCart())
          ],
        ),
        body: ScopedModel.of<CartModel>(context, rebuildOnChange: true)
                    .cart
                    .length ==
                0
            ? Center(
                child: Text("No items in Cart"),
              )
            : Container(
                padding: EdgeInsets.all(8.0),
                child: Column(children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: ScopedModel.of<CartModel>(context,
                              rebuildOnChange: true)
                          .total,
                      itemBuilder: (context, index) {
                        return ScopedModelDescendant<CartModel>(
                          builder: (context, child, model) {
                            return ListTile(
                              title: Text(
                                "Items bought:-" +
                                    '\n' +
                                    model.cart[index].title,
                                style: GoogleFonts.lato(
                                    textStyle:
                                        Theme.of(context).textTheme.display1,
                                    fontSize: 30),
                              ),
                              subtitle: Text(
                                "Item Quantity:-" +
                                    '\n' +
                                    model.cart[index].qty.toString() +
                                    '\n' +
                                    "Price of item" +
                                    '\n' +
                                    "Rs " +
                                    model.cart[index].price.toString(),
                                style: GoogleFonts.lato(
                                  textStyle: GoogleFonts.lato(
                                      textStyle:
                                          Theme.of(context).textTheme.display1,
                                      fontSize: 22),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Total: \$ " +
                            ScopedModel.of<CartModel>(context,
                                    rebuildOnChange: true)
                                .totalCartValue
                                .toString() +
                            "",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      )),
                  FloatingActionButton.extended(
                    backgroundColor: const Color(0xFF42A5F5),
                    foregroundColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Secondpage()));
                    },
                    icon: Icon(Icons.thumb_up, color: Colors.white),
                    label: Text('Checkout'),
                  ),
                ])));
  }
}
