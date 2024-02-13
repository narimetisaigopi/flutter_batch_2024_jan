import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_batch_2024_jan/models/shopping_model.dart';
import 'package:http/http.dart' as http;

class ShoppingProvider extends ChangeNotifier {
  int count = 0;
  bool isLoading = false;

  List<ShoppingModel> shoppingModelList = [];

  increaseCount() {
    count++;
    print("object $count");
    notifyListeners();
  }

  getShoppingItems() async {
    try {
      isLoading = true;
      notifyListeners();
      http.Response response =
          await http.get(Uri.parse("https://fakestoreapi.com/products"));
      print(response.statusCode.toString());
      if (response.statusCode == 200) {
        shoppingModelList = (jsonDecode(response.body) as List)
            .map((e) => ShoppingModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      notifyListeners();
    } catch (e, stack) {
      print(e.toString());
      print(stack.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
