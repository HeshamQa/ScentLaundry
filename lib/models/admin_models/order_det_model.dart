class OrderDetModel{
  var count,item_name,category_name;

  OrderDetModel({required this.count,required this.item_name,required this.category_name});

  factory OrderDetModel.fromJson(Map<String, dynamic> json) {
    return OrderDetModel(
      count: json["count"],
      item_name: json["item_name"],
      category_name: json["category_name"],
    );
  }
//
}