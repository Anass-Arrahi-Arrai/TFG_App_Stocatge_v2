import "package:app_stocatge/widgets/form_tile.dart";
import "package:app_stocatge/widgets/my_button.dart";
import "package:flutter/material.dart";

class NewItemBox extends StatelessWidget {

  final Function(Map<String, String>) onSave;

  NewItemBox({super.key, required this.onSave});

  final idController = TextEditingController();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(
        "New Item Data", 
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.brown[800],
        ),
        ),
      insetPadding: const EdgeInsets.only(top:80, bottom: 40),
      contentPadding: const EdgeInsets.all(10),
      iconPadding: EdgeInsets.zero,
      icon: Icon(Icons.fastfood, size: 60, color: Colors.brown[800]),
      backgroundColor: Colors.brown[200],
      content: Container(
        width: 375,
        height: 270,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(10)
              ),
                child: ListView(
                  children: [
                    FormTile(dataName: "Product ID",controller: idController,),
                    FormTile(dataName: "Product Name",controller: nameController),
                    FormTile(dataName: "Price",controller: priceController),
                    const SizedBox(height: 10)
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyButton(text: "Save", onPressed: handleSave),
                    const SizedBox(width: 10),
                    MyButton(
                      text: "Cancel", 
                      onPressed: (
                        () => Navigator.of(context).pop()
                      ),
                      )
                  ],
                ),
              ),
            )
          ]
          
        ),
      ),
    );
  }
  
  void handleSave() {
    Map<String, String> newItemData = {
      'name': nameController.text,
      'id': idController.text,
      'price': priceController.text,

    };
    onSave(newItemData);
  }
}