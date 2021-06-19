import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lapasar_assessment/model/product_model.dart';
import 'package:money2/money2.dart';

class HomeController extends GetxController {
  List<ProductModel> fetchProducts = [];
  List<ProductModel> searchedItem = [];
  var items = <ProductModel>[].obs;

  RxBool searchProduct = false.obs;

  RxBool isFetched = false.obs;

  TextEditingController productName;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProduct();

    productName = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    productName.dispose();
    super.onClose();
  }

  fetchProduct() async {
    var url = Uri.parse('http://149.28.132.97:7000/api/products');
    await http.get(url).then((response) {
      if (response.statusCode == 200) {
        fetchProducts = List<ProductModel>.from(
            json.decode(response.body).map((x) => ProductModel.fromJson(x)));

        fetchProducts.sort((a, b) => a.name.compareTo(b.name));

        // Iterable list = json.decode(response.body);
        // var products =
        //     list.map((model) => ProductModel.fromJson(model)).toList();

        isFetched.value = true;

        print(fetchProducts.length);
        return fetchProducts;
      } else {
        print("Error");
      }
    });
  }

  getImage(ProductModel productModel) async {
    var url = Uri.parse(
        'http://149.28.132.97:7000/api/products/${productModel.id}/${productModel.images[0]}');
    print("url $url");

    await http.get(url).then((response) {
      if (response.statusCode == 200) {
        return url;
      } else {
        print("Image Error");
      }
    });

    return url;
  }

  convertMyr(int cent) {
    print(cent.toString());
    Currency myrCurrency = Currency.create('MYR', 2);

    String costPrice = Money.fromInt(cent, myrCurrency).toString();

    return costPrice;
  }

  addItemToCard(ProductModel item) {
    // print(item.toJson());
    items.add(item);

    print(items.length);
    ScaffoldMessenger.of(Get.context).showSnackBar(snackBarAdded);
  }

  searchItem() {
    reset();

    searchProduct.value = true;

    searchedItem = fetchProducts
        .where((element) =>
            element.name.toUpperCase().contains(productName.text.toUpperCase()))
        .toList();

    Get.back();
  }

  reset() {
    searchProduct.value = false;
    searchedItem.clear();
  }

  final snackBarAdded = SnackBar(
    duration: Duration(seconds: 2),
    content: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.info_outline,
          size: 24.0,
          color: Colors.blue[300],
        ),
        SizedBox(width: 20),
        Container(
          height: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Notice", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("You've added a item to your cart"),
            ],
          ),
        ),
      ],
    ),
  );

  final snackBarAddItem = SnackBar(
    duration: Duration(seconds: 2),
    content: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.info_outline,
          size: 24.0,
          color: Colors.blue[300],
        ),
        SizedBox(width: 20),
        Container(
          height: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Notice", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Please add an item"),
            ],
          ),
        ),
      ],
    ),
  );
}
