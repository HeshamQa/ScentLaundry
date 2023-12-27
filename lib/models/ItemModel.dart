class ItemModel {
  var id;
  var image;
  var name;
  var price;
  var idstatetype;
  var idcategories;

  ItemModel(
      {required this.id,
      required this.image,
      required this.name,
      required this.price,
      required this.idstatetype,
      required this.idcategories});

  factory ItemModel.fromJson(var json) {
    return ItemModel(
      id: json['id'],
      image: json['image'],
      idstatetype: json['idstatetype'],
      name: json['name'],
      price: json['price'],
      idcategories: json['idcategories'],
    );
  }
}
