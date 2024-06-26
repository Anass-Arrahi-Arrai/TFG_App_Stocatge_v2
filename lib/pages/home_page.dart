
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_stocatge/repositories/order_repository.dart';
import 'package:app_stocatge/repositories/user_data_repository.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  OrderRepository orders = OrderRepository();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    UserRepository uR = UserRepository();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text("Stock-it by Anass Arrahi Arrai",
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
            onPressed: () {orders.printExpensesCurrentMonth();},
            icon: Icon(Icons.info_outlined),
            color: Colors.white,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              child: Padding(
                      padding: const EdgeInsets.only(bottom: 30, left: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Hello",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "      ${uR.getUser()?.fiscalName}",
                            style: TextStyle(
                              color: Colors.green[700],
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            SizedBox(
              width: 350,
              height: 350,
              child: ListView(
                children: [ 
                  GestureDetector( 
                    onTap: () => Navigator.pushNamed(context, '/checkStock'),
                    child: Container(
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
      floatingActionButton: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                onPressed: () => Navigator.pushNamed(context, '/userdata'),
                foregroundColor: Colors.white,
                backgroundColor: Colors.brown,
                child: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
              SizedBox(height: 4), // Espacio entre el botón y el texto
              Text(
                'User Data',
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
