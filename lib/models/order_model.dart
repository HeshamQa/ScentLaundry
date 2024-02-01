class OrderModel{
  var id,location,pdate,rdate,orderdate,totalprice,iduser,idorderstate;

  OrderModel(
      {required this.id,
      required this.location,
      required this.pdate,
      required this.rdate,
      required this.orderdate,
      required this.totalprice,
      required this.iduser,
      required this.idorderstate});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json["id"],
      location: json["location"],
      pdate: json["pdate"],
      rdate: json["rdate"],
      orderdate: json["orderdate"],
      totalprice: json["totalprice"],
      iduser: json["iduser"],
      idorderstate: json["idorderstate"],
    );
  }
//
}