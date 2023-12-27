class CartModel {
  var id;
  var iditem;
  int count;
  var price;
  var name;
  var image;
  var cate;

  CartModel({
    required this.id,
    required this.iditem,
    required this.count,
    required this.price,
    required this.name,
    required this.image,
    required this.cate
  });

  factory CartModel.fromJson(var json) {
    return CartModel(
      id: json['id'],
      iditem: json['iditem'],
      count: int.parse(json['count']),
      price: json['price'],
      name: json['name'],
      image: json['image'],
      cate: json['cate']
    );
  }
}