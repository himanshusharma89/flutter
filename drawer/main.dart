import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

/*class for drawer*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tradewinds"),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                ),
                accountName: Text(
                  'Singh',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                ),
                accountEmail: Text(
                  "singh@singh.com",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://previews.123rf.com/images/yupiramos/yupiramos1609/yupiramos160912741/62358463-avatar-man-smiling-cartoon-with-beard-male-person-user-vector-illustration.jpg'),
                  onBackgroundImageError: (exception, stackTrace) {},
                ),
              ),
            ),
            ListTile(
              title: Text("MyAccount"),
              trailing: Icon(Icons.account_balance),
              onTap: () {},
            ),
            ListTile(
              title: Text("ShoppingCart"),
              trailing: Icon(Icons.shopping_cart),
              onTap: () {},
            ),
            ListTile(
              title: Text("MyOrders"),
              trailing: Icon(Icons.list),
              onTap: () {},
            ),
            ListTile(
              title: Text("Login"),
              trailing: Icon(Icons.insert_link),
              onTap: () {},
            ),
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
            ListTile(
              title: Text("Settings"),
              trailing: Icon(Icons.settings),
              onTap: () {},
            ),
            ListTile(
              title: Text("About"),
              trailing: Icon(Icons.error),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text("HomePage"),
        ),
      ),
    );
  }
}
