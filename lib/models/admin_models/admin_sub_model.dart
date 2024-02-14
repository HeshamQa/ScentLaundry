class AdminSubModel{
  String name,price,id;

  AdminSubModel({required this.id,required this.name,required this.price});

  factory AdminSubModel.fromJson(Map<String, dynamic> json) {
    return AdminSubModel(
      name: json["name"],
      price: json["price"],
      id: json['id'],
    );
  }
}
class AdminSubModel2{
  String name,price,id,count;

  AdminSubModel2({required this.id,required this.name,required this.price,required this.count});

  factory AdminSubModel2.fromJson(Map<String, dynamic> json) {
    return AdminSubModel2(
      name: json["name"],
      price: json["price"],
      id: json['id'], count: json['count'],
    );
  }
}