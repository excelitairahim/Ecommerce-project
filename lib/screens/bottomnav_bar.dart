import 'package:fashion_design/screens/cart_screen.dart';
import 'package:fashion_design/screens/login_signup.dart/login_and_signup.dart';
import 'package:fashion_design/screens/product_list.dart';
import 'package:fashion_design/screens/product_page.dart';
import 'package:flutter/material.dart';



import 'package:badges/badges.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar(
      {this.currentTab = 0, this.currentScreen = const MyHomePage()});
  int currentTab = 0;
  Widget currentScreen = MyHomePage();
  @override
  _BottomNavBarState createState() =>
      _BottomNavBarState(currentTab, currentScreen);
}

class _BottomNavBarState extends State<BottomNavBar> {
  // Properties & Variables needed

  _BottomNavBarState(this.currentTab, this.currentScreen);
  int currentTab; // to keep track of active tab index
  final List<Widget> screens = [
    MyHomePage(),
    ProductList(),
    CartScreen(),
    LoginPage(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen; //= Home_Page(); // Our first view in viewport
  int itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFFE37D4E),
          onPressed: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => OrderDetails()));
          },
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Badge(
                badgeContent: Text(
                  itemCount.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(Icons.shopping_bag_outlined),
              ),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            MyHomePage(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color:
                              currentTab == 0 ? Color(0xFFE37D4E) : Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: currentTab == 0
                                ? Color(0xFFE37D4E)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            ProductList(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.favorite_border_outlined,
                          color:
                              currentTab == 1 ? Color(0xFFE37D4E) : Colors.grey,
                        ),
                        Text(
                          'Favorite',
                          style: TextStyle(
                            color: currentTab == 1
                                ? Color(0xFFE37D4E)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            CartScreen(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.dashboard_outlined,
                          color:
                              currentTab == 2 ? Color(0xFFE37D4E) : Colors.grey,
                        ),
                        Text(
                          'History',
                          style: TextStyle(
                            color: currentTab == 2
                                ? Color(0xFFE37D4E)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            LoginPage(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          color:
                              currentTab == 3 ? Color(0xFFE37D4E) : Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: currentTab == 3
                                ? Color(0xFFE37D4E)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
