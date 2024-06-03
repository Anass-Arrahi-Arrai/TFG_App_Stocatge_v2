
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

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
            onPressed: () {},
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
    );
  }

  void userTapped() {
    print("User tapped!");
  }
}
