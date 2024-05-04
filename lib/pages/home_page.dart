// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text("Stockify v1.1",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
            color: Colors.white,
          ),
        ],
      ),
      drawer: Drawer(
          backgroundColor: Colors.brown[100],
          child: Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.favorite,
                  size: 48,
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("H O M E"),
                onTap: () {},
              )
            ],
          )
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              child: Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Hello Anass.",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
            ),
            SizedBox(
              width: 350,
              height: 350,
              child: ListView(
                children: [ 
                  GestureDetector( //CheckStock Button
                    onTap: () => Navigator.pushNamed(context, '/checkStock'),
                    child: Container(
                        //Button 1
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.brown[200],
                            borderRadius: BorderRadius.all(Radius.circular(230))),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Check Stock",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.manage_search_rounded,
                                color: Colors.black,
                                size: 35,
                              )
                            ],
                          ),
                        ),
                      ),
                  ),
                  SizedBox(height: 10.0), 
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/orders'),
                    child: Container(
                      //Button 2
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.brown[100],
                          borderRadius: BorderRadius.all(Radius.circular(230))),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Orders",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.shopping_cart,
                              color: Colors.black,
                              size: 28,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/suppliers'),
                    child: Container(
                      //Button 3
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.brown[50],
                          borderRadius: BorderRadius.all(Radius.circular(230))),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Suppliers",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.people,
                              color: Colors.black,
                              size: 28,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/stats'),
                    child: Container(
                      //Button 4
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.brown[50],
                          borderRadius: BorderRadius.all(Radius.circular(230))),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Stats",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.bar_chart_rounded,
                              color: Colors.black,
                              size: 28,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void userTapped() {
    print("User tapped!");
  }
}
