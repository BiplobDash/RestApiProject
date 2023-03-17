import 'package:crudd_app/RestApi/RestClient.dart';
import 'package:crudd_app/Screen/ProductCreateScreen.dart';
import 'package:crudd_app/Screen/product_update_screen.dart';
import 'package:crudd_app/Style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({super.key});

  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {
  List productList = [];
  bool isloading = false;

  @override
  void initState() {
    callData();
    super.initState();
  }

  callData() async {
    isloading = true;
    var data = await productGridListRequest();
    setState(() {
      productList = data;
      isloading = false;
    });
  }

  deleteItem(id) async {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Text('Delete!'),
            content: Text("Do you want to delete?"),
            actions: [
              OutlinedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    setState(() {
                      isloading = true;
                    });
                    await productDeletedRequest(id);
                    await callData();
                  },
                  child: Text('Yes')),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('No'))
            ],
          );
        }));
  }

  GotoUpdate(context, productItem) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductUpdateScreen(productItem)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Product'),
      ),
      body: Stack(children: [
        ScreenBacground(context),
        Container(
            child: isloading
                ? (Center(
                    child: CircularProgressIndicator(),
                  ))
                : RefreshIndicator(
                    child: GridView.builder(
                        gridDelegate: productGridViewStyle(),
                        itemCount: productList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                    child: Image.network(
                                  productList[index]['Img'],
                                  fit: BoxFit.fill,
                                )),
                                Container(
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(productList[index]['ProductName']),
                                      Divider(),
                                      Text("Price: " +
                                          productList[index]['UnitPrice'] +
                                          "BDT"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          OutlinedButton(
                                              onPressed: () {
                                                GotoUpdate(context,
                                                    productList[index]);
                                              },
                                              child: Icon(
                                                CupertinoIcons
                                                    .ellipsis_vertical_circle,
                                                size: 18,
                                                color: colorGreen,
                                              )),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          OutlinedButton(
                                              onPressed: () {
                                                deleteItem(
                                                    productList[index]['_id']);
                                              },
                                              child: Icon(
                                                CupertinoIcons.delete,
                                                size: 18,
                                                color: colorRed,
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                    onRefresh: () async {
                      await callData();
                    }))
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (builder)=>
                        ProductCreateScreen()
                )
            );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
