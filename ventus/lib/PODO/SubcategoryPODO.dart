class SubcategoryPODO{
  int id;
  String name;
  int category;

  SubcategoryPODO({this.id, this.name, this.category});

  factory SubcategoryPODO.fromJson(Map<String, dynamic> parsedJson){
    return SubcategoryPODO(
      name: parsedJson['name'],
      id : parsedJson['id'],
      category: parsedJson['category']
    );
  }
}