import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapasar_assessment/controller/home_controller.dart';
import 'package:lapasar_assessment/resource/widget.dart';
import 'package:lapasar_assessment/screen/cart_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Product List"),
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Get.dialog(SearchDialog());
                })
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(
              () => Container(
                  child: _controller.searchProduct.value == true
                      ? GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 4.0,
                                  mainAxisSpacing: 4.0,
                                  childAspectRatio: 3 / 5),
                          itemCount: _controller.searchedItem.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                print(_controller.searchedItem[index].toJson());
                                _controller.addItemToCard(
                                    _controller.searchedItem[index]);
                              },
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FutureBuilder(
                                          future: _controller.getImage(
                                              _controller.searchedItem[index]),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Center(
                                                child: Container(
                                                  height: 100,
                                                  child: Image.network(
                                                    snapshot.data.toString(),
                                                    errorBuilder: (BuildContext
                                                            context,
                                                        Object exception,
                                                        StackTrace stackTrace) {
                                                      return Center(
                                                        child: Icon(Icons.image,
                                                            size: 50),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              );
                                            }

                                            return Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }),
                                      SizedBox(height: 10),
                                      Text("Name",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                          _controller.searchedItem[index].name),
                                      SizedBox(height: 10),
                                      Text("Brand",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(_controller
                                          .searchedItem[index].brand),
                                      SizedBox(height: 10),
                                      Text("Price",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(_controller.convertMyr((_controller
                                          .searchedItem[index].price))),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 4.0,
                                  mainAxisSpacing: 4.0,
                                  childAspectRatio: 3 / 5),
                          itemCount: _controller.fetchProducts.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                print(
                                    _controller.fetchProducts[index].toJson());
                                _controller.addItemToCard(
                                    _controller.fetchProducts[index]);
                              },
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FutureBuilder(
                                          future: _controller.getImage(
                                              _controller.fetchProducts[index]),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Center(
                                                child: Container(
                                                  height: 100,
                                                  child: Image.network(
                                                    snapshot.data.toString(),
                                                    errorBuilder: (BuildContext
                                                            context,
                                                        Object exception,
                                                        StackTrace stackTrace) {
                                                      return Center(
                                                        child: Icon(Icons.image,
                                                            size: 50),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              );
                                            }

                                            return Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }),
                                      SizedBox(height: 10),
                                      Text("Name",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(_controller
                                          .fetchProducts[index].name),
                                      SizedBox(height: 10),
                                      Text("Brand",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(_controller
                                          .fetchProducts[index].brand),
                                      SizedBox(height: 10),
                                      Text("Price",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(_controller.convertMyr((_controller
                                          .fetchProducts[index].price))),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: const Icon(Icons.shopping_cart),
          onPressed: () {
            if (_controller.items.value.length > 0) Get.to(() => CartScreen());

            return ScaffoldMessenger.of(Get.context)
                .showSnackBar(_controller.snackBarAddItem);
          },
        ));
  }
}
