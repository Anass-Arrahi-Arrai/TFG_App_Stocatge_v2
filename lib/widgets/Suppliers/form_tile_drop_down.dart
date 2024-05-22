import 'package:flutter/material.dart';

class FormTileDropDown extends StatefulWidget {
  final String dataName;
  final String? Function(String?)? validator;
  final List<String> options;

  FormTileDropDown({
    Key? key,
    required this.dataName,
    required this.options,
    this.validator,
  }) : super(key: key);

  @override
  FormTileDropDownState createState() => FormTileDropDownState();
}

class FormTileDropDownState extends State<FormTileDropDown> {
  String? _selectedOption;

  String? get selectedOption => _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10,),
      child: Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.brown[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              widget.dataName,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.brown[900],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: DropdownButtonFormField<String>(
                isExpanded: true,
                value: _selectedOption,
                menuMaxHeight: 200,
                dropdownColor: Colors.brown[50],
                hint: Text(
                  'Choose',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Colors.brown[900],
                  ),
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.brown, width: 1.5),
                  ),
                  filled: false,
                  fillColor: Colors.brown[200],
                ),
                items: widget.options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(
                      option,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color: Colors.brown[900],
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedOption = newValue;
                  });
                },
                validator: widget.validator,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
