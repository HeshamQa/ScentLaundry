class CategoriesModel {
  var id, idstatetype;
  var name, image, popimage;
  var ispop;

  CategoriesModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.popimage,
      required this.ispop,
      required this.idstatetype});

  factory CategoriesModel.fromJson(var json) {
    return CategoriesModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        popimage: json['popimage'],
        ispop: json['ispop'],
        idstatetype: json['idstatetype']);
  }
}
