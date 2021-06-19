import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapasar_assessment/controller/home_controller.dart';
import 'package:lapasar_assessment/screen/home_screen.dart';

class SearchDialog extends StatelessWidget {
  HomeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Search",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            SizedBox(height: 20),
            TextField(
              controller: _controller.productName,
              obscureText: false,
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal),
                  ),
                  labelText: "Product Name",
                  // errorText:
                  // _usernameValidate ? null : Strings.errrequiredname.tr,
                  hintStyle: TextStyle(
                    fontSize: 14.0,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
            ),
            SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _controller.searchItem();
                      },
                      child: Text("Search")),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red
                    ),
                      onPressed: () {
                        _controller.reset();
                      },
                      child: Text("Reset"))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
