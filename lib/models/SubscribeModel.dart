class SubscribeModel{
  var id;
  var count;
  var price;

  SubscribeModel({required this.id,required this.count,required this.price});
  factory SubscribeModel.fromJson(var json) {
    return SubscribeModel(
        id: json['id'],
        count: json['count'],
        price: json['price']
    );
  }
}