import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_batch_2024_jan/models/shopping_model.dart';
import 'package:flutter_batch_2024_jan/providers/shopping_provider.dart';
import 'package:provider/provider.dart';

class ShoppingItemsScreen extends StatefulWidget {
  const ShoppingItemsScreen({super.key});

  @override
  State<ShoppingItemsScreen> createState() => _ShoppingItemsScreenState();
}

class _ShoppingItemsScreenState extends State<ShoppingItemsScreen> {
  late ShoppingProvider shoppingProvider;

  @override
  void initState() {
    shoppingProvider = Provider.of<ShoppingProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 1), () {
        shoppingProvider.getShoppingItems();
      });
    });

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
        title: const Text("Shopping"),
        actions: [
          Stack(
            children: [
              const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Consumer<ShoppingProvider>(
                    builder: (context, shoppingProvider, child) {
                  return CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Center(
                        child: Text(
                      "${shoppingProvider.cartItems.length}",
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    )),
                  );
                }),
              )
            ],
          ),
          const SizedBox(
            width: 10,
          )
        ],
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
                          trailing: InkWell(
                              onTap: () {
                                if (!shoppingProvider
                                    .isProductAdded(shoppingModel)) {
                                  shoppingProvider
                                      .removeFromCart(shoppingModel);
                                } else {
                                  shoppingProvider.addToCart(shoppingModel);
                                }
                              },
                              child:
                                  shoppingProvider.isProductAdded(shoppingModel)
                                      ? const Text("Add to cart")
                                      : const Text("Remove from cart")),
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
