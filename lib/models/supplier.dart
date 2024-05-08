
import 'package:app_stocatge/models/item.dart';

class Supplier {
  String name;
  String nif;
  String address;
  String ?municipation;
  String ?province;
  String ?zipCode;
  String ?country;
  String ?phoneNumber;
  bool active;
  List<Item> items = List.empty(growable: true);//List<Item>.filled(500, Null as Item ,growable: true);

  Supplier({
    required this.name,
    required this.nif,
    required this.address,
    this.municipation,
    this.province,
    this.zipCode,
    this.country,
    this.phoneNumber,
    this.active = true,
  });

  void setName(String name){
    this.name = name;
  }
  void setNif(String nif){
    this.nif = nif;
  }
  void setAddress(String address){
    this.address = address;
  }
  void setMunicipation(String municipation){
    this.municipation = municipation;
  }
  void setZip(String zipCode){
    this.zipCode = zipCode;
  }
  void setCountry(String country){
    this.country = country;
  }
  void setPhone(String phoneNumber){
    this.phoneNumber = phoneNumber;
  }
  void setActive(bool active){
    this.active = active;
  }

  String get getName => name;
  String get getNif => nif;
  String get getaddress => address;
  String? get getMunicipation => municipation;
  String? get getZip => zipCode;
  String? get getCountry => country;
  String? get getPhone => phoneNumber;
  bool get isActive => active;
  void printItems(){
    print(items);
  }
  void setNewItem(Item newItem){
    print("Adding new ittem");
    items.add(newItem);
    print("Item " + newItem.toString() + " added. ");
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'nif': nif,
      'address': address,
      'municipation': municipation ,
      'province': province,
      'zip': zipCode,
      'country': country,
      'num': phoneNumber,
    };
  }
}