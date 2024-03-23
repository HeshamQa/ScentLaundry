import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import '../../models/cart_model.dart';
import '../../utils/Static/consvalue.dart';
import '../../utils/Static/sharedpref.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> listCart = [];
  double totalPrice = 0;

  getCart() async {
    .show(status: 'loading...');
    listCart = [];
    totalPrice = 0;
    General.getPrefInt(ConsValues.id, 0).then(
      (iduser) async {
        final response = await http.post(
          Uri.parse(
            "${ConsValues.baseurl}getcart.php",
          ),
          body: {
            "iduser": iduser.toString(),
          },
        );
        EasyLoading.dismiss();
        if (response.statusCode == 200) {
          var jsonBody = jsonDecode(response.body);
          var cart = jsonBody['cart'];
          for (Map i in cart) {
            listCart.add(CartModel.fromJson(i));
            totalPrice =
                totalPrice + double.parse(i['price']) * int.parse(i['count']);
            print(listCart[0].iditem);
          }
          notifyListeners();
        }
      },
    );
  }

  addToCart(
      {required var iditem,
      required var idcategories,
      required var count}) async {
    EasyLoading.show(status: 'loading...');
    General.getPrefInt(ConsValues.id, 0).then(
      (iduser) async {
        await http.post(
          Uri.parse("${ConsValues.baseurl}addcart.php"),
          body: {
            "iduser": iduser.toString(),
            "iditem": iditem.toString(),
            "idcategories": idcategories.toString(),
            "count": count.toString(),
          },
        );
        EasyLoading.dismiss();
      },
    );
  }

  updateItemCount(var id, var count, var index) async {
    EasyLoading.show(status: 'loading...');
    if (count <= 0) {
      deleteItemFromCart(id);
      listCart.removeAt(index);
    } else {
      await http.post(
        Uri.parse("${ConsValues.baseurl}updatecart.php"),
        body: {
          "id": id,
          "count": count.toString(),
        },
      );

      listCart[index].count = count;
    }
    totalPrice = 0;
    for (CartModel i in listCart) {
      totalPrice = totalPrice + double.parse(i.price) * i.count;
    }

    EasyLoading.dismiss();
    notifyListeners();
  }

  deleteItemFromCart(var id) async {
    await http.post(
      Uri.parse("${ConsValues.baseurl}deletecart.php"),
      body: {
        "id": id,
      },
    );
  }

  addItemsToOrder(int orderId) async {
    EasyLoading.show(status: 'loading...');

    for (CartModel cartItem in listCart) {
      await http.post(
        Uri.parse("${ConsValues.baseurl}addorderdet.php"),
        body: {
          "idorder": orderId.toString(),
          "iditem": cartItem.iditem.toString(),
          "count": cartItem.count.toString(),
        },
      );
      deleteItemFromCart(cartItem.id);
    }
    listCart.clear();
    totalPrice = 0;
    notifyListeners();

    EasyLoading.dismiss();
  }
}
