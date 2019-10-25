import 'package:ventus/PODO/PartPODO.dart';

import 'SubPODO.dart';

class SelfUserPODO{
  int id;
  String name;
  String location;
  String birthday;
  String messenger;
  int match;
  List<SubPODO> subcategories;


  SelfUserPODO({this.id, this.name, this.location, this.match, this.subcategories, this.birthday, this.messenger});

  factory SelfUserPODO.fromJson(Map<String, dynamic> parsedJson){
    var parts = parsedJson['subcategories'] as List;
    List<SubPODO> partList = parts.map((i) => SubPODO.fromJson(i)).toList();
    return SelfUserPODO(
        id: parsedJson['id'],
        name: parsedJson['name'],
        location: parsedJson['location'],
        match: parsedJson['match'],
        birthday: parsedJson['birthday'],
        subcategories: partList,
        messenger: parsedJson['messenger']
    );
  }
}