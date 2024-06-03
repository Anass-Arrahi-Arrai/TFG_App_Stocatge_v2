import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final String name;
  final double price;
  final String format;
  final int quant;
  final String uom;
  const ItemTile({super.key, required this.name, required this.format, required this.quant,required this.uom, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IntrinsicHeight(
        child: Container(
          padding:
              const EdgeInsets.only(top: 5.0, bottom: 5, left: 10, right: 10),
          decoration: BoxDecoration(
            color: Colors.brown[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Product Name",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[900],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Price",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[900],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Format",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[900],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Container(
                  padding: EdgeInsets.only(top: 8,bottom: 8,left: 8,right:8),
                  decoration: BoxDecoration(
                          color: Colors.brown[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${name}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown[900],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "${price}€",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown[900],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown[900],
                          ),
                          "${format} of ${quant} ${uom}",
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    
  }
}
