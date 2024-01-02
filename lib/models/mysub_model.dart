class MySubModel {
  var id;
  var count;
  var iduser;
  var idsub;
  var c;
  var price;

  MySubModel(
      {required this.id,
      required this.count,
      required this.iduser,
      required this.idsub,
      required this.c,
      required this.price});

  factory MySubModel.fromJson(var json) {
    return MySubModel(
        id: json['id'],
        count: json['count'],
        iduser: json['iduser'],
        idsub: json['idsub'], c: json['c'], price: json['price']);
  }
}
