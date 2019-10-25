class CategoryPODO{
  String category;
  int id;

  CategoryPODO({
    this.category,
    this.id
  });

  factory CategoryPODO.fromJson(Map<String, dynamic> parsedJson){
    return CategoryPODO(
        category: parsedJson['name'],
        id : parsedJson['id'],
    );
  }
}