import 'package:app_stocatge/repositories/food_format_types.dart';
import 'package:flutter/material.dart';

class TypeStockTile extends StatelessWidget {

  final String itemType;
  final double quantity;
  final int idx;
  final Function(BuildContext) onUpdate; 

  TypeStockTile({
    super.key,
    required this.onUpdate,
    required this.itemType,
    required this.quantity,
    required this.idx,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding:
            const EdgeInsets.only(top: 5.0, bottom: 5, left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.brown[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Center(
              child: Container(
                width:20,
                child: Text(
                  idx.toString()   ,
                  softWrap: true, 
                  overflow: TextOverflow.visible, 
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5, left: 10),
              child: Center(
                child: Container(
                  width: 100,
                  padding: const EdgeInsets.only(
                      top: 5.0, bottom: 5, right: 10),
                  child: Text(
                    itemType,
                    softWrap: true, 
                    overflow: TextOverflow.visible, 
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.only(
                      top: 5.0, bottom: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.brown[100],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.brown,
                      )),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Text(
                          quantity.toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            FoodAndFormatTypes.types[itemType] ?? "",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 50,
                child: MaterialButton(
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: Color.fromARGB(255, 83, 58, 49),
                      width: 2
                    )
                  ),
                  onPressed: () => onUpdate(context),
                  textColor: Colors.brown,
                  disabledColor: Colors.grey[800],
                  splashColor: Colors.brown[300],
                  highlightColor: Colors.brown[800],
                  child: const Icon(
                    Icons.update
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
