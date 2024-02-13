import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_batch_2024_jan/models/shopping_model.dart';
import 'package:flutter_batch_2024_jan/providers/shopping_provider.dart';
import 'package:provider/provider.dart';

class ShoppingItems extends StatefulWidget {
  const ShoppingItems({super.key});

  @override
  State<ShoppingItems> createState() => _ShoppingItemsState();
}

class _ShoppingItemsState extends State<ShoppingItems> {
  late ShoppingProvider shoppingProvider;

  @override
  void initState() {
    shoppingProvider = Provider.of<ShoppingProvider>(context, listen: false);
    shoppingProvider.getShoppingItems();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping"),
      ),
      body: Consumer<ShoppingProvider>(
          builder: (context, shoppingProvider, child) {
        // return Center(
        //     child: Text(
        //   shoppingProvider.count.toString(),
        //   style: TextStyle(fontSize: 60),
        // ));
        return shoppingProvider.isLoading
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: shoppingProvider.shoppingModelList.length,
                itemBuilder: (context, index) {
                  ShoppingModel shoppingModel =
                      shoppingProvider.shoppingModelList[index];
                  return Card(
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: shoppingModel.image ?? "",
                          height: 100,
                        ),
                        ListTile(
                          title: Text(shoppingModel.title ?? ""),
                        ),
                      ],
                    ),
                  );
                });
      }),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   shoppingProvider.increaseCount();
      // }),
    );
  }
}
