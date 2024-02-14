class OrderAdminModel{
  var id,totalprice,location,pdate,rdate,orderdate,name,idorderstate,status;

  OrderAdminModel(
      {required this.id,
        required this.totalprice,
        required this.location,
        required this.pdate,
        required this.rdate,
        required this.orderdate,
        required this.name,
        required this.idorderstate,
        required this.status
     });

  factory OrderAdminModel.fromJson(Map<String, dynamic> json) {
    return OrderAdminModel(
      id: json["id"],
      totalprice: json["totalprice"],
      location: json["location"],
      pdate: json["pdate"],
      rdate: json["rdate"],
      orderdate: json["orderdate"],
      name: json["name"],
      idorderstate: json["idorderstate"],
      status: json['status']
    );
  }
//
}