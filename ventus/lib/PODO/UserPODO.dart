import 'package:ventus/PODO/PartPODO.dart';

class UserPODO{
  int id;
  String name;
  String location;
  int match;
  List<PartPODO> top;


  UserPODO({this.id, this.name, this.location, this.match, this.top});

  factory UserPODO.fromJson(Map<String, dynamic> parsedJson){
    var parts = parsedJson['top'] as List;
    List<PartPODO> partList = parts.map((i) => PartPODO.fromJson(i)).toList();
    return UserPODO(
        id: parsedJson['id'],
        name: parsedJson['name'],
        location: parsedJson['location'],
        match: parsedJson['match'],
        top: partList
    );
  }
}