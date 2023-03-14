import 'package:crudd_app/Style/style.dart';
import 'package:flutter/material.dart';

class ProductCreateScreen extends StatefulWidget {
  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Product'),
      ),
      body: Stack(
        children: [
          ScreenBacground(context),
          Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration('Product Name'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration('Product Code'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration('Product Image'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration('Unit Price'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration('Total Price'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppDropDownStyle(
                    DropdownButton(
                    value: "",
                    items: [
                      DropdownMenuItem(
                        child: Text('Select Qt'),
                        value: "",
                      ),
                      DropdownMenuItem(
                        child: Text('1 pcs'),
                        value: "1pcs",
                      ),
                      DropdownMenuItem(
                        child: Text('2 pcs'),
                        value: '2pcs',
                      ),
                      DropdownMenuItem(
                        child: Text('3 pcs'),
                        value: '3pcs',
                      ),
                      DropdownMenuItem(
                        child: Text('4 pcs'),
                        value: '4pcs',
                      ),
                    ],
                    onChanged: (value) {},
                    underline: Container(),
                    isExpanded: true,
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: ElevatedButton(
                        style: AppButtonStyle(),
                        onPressed: () {},
                        child: SuccessButtonChild('Submit')),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
