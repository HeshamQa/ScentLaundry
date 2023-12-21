import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel{
  final QueryDocumentSnapshot queryDocumentSnapshot;
  int count;
  final String type;

  CartModel(this.queryDocumentSnapshot, this.count, this.type);
}