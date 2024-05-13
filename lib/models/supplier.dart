
import 'package:hive/hive.dart';
part 'supplier.g.dart';

@HiveType(typeId: 1)
class Supplier extends HiveObject{
  @HiveField(0)
  String name;
  @HiveField(1)
  String nif;
  @HiveField(2)
  String address;
  @HiveField(3)
  String ?municipation;
  @HiveField(4)
  String ?province;
  @HiveField(5)
  String ?zipCode;
  @HiveField(6)
  String ?country;
  @HiveField(7)
  String ?phoneNumber;
  @HiveField(8)
  bool active;
  @HiveField(9)
  

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