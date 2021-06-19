import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapasar_assessment/controller/home_controller.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  HomeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: Container(
          child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
              itemCount: _controller.items.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FutureBuilder(
                              future: _controller
                                  .getImage(_controller.items[index]),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Image.network(
                                    snapshot.data.toString(),
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace stackTrace) {
                                      return Center(
                                        child: Icon(Icons.image, size: 150),
                                      );
                                    },
                                  );
                                }

                                return Center(
                                    child: CircularProgressIndicator());
                              }),
                          Text(_controller.items[index].name),
                          SizedBox(height: 10),
                          Text(_controller.items[index].brand),
                          SizedBox(height: 10),

                          Text(_controller
                              .convertMyr((_controller.items[index].price))),
                          SizedBox(height: 10),
                          // Image.network(_controller.getImage(_controller.fetchProducts[index]))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
              child: Text(
            "List of item: ${_controller.items.length}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ))
        ],
      )),
    );
  }
}
