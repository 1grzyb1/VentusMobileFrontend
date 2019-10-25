class PartPODO{
  String name;
  int percentage;

  PartPODO({this.name, this.percentage});

  factory PartPODO.fromJson(Map<String, dynamic> parsedJson){
    return PartPODO(
        name: parsedJson['name'],
        percentage: parsedJson['percentage'],
    );
  }
}