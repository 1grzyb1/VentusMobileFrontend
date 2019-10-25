class SubPODO{
  String name;
  int percentage;

  SubPODO({this.name, this.percentage});

  factory SubPODO.fromJson(Map<String, dynamic> parsedJson){
    return SubPODO(
        name: parsedJson['name'],
        percentage: parsedJson['percentage']
    );
  }
}