import 'package:e_commerce/constraints.dart';
import 'package:e_commerce/models/products_model.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/screens/cart/check_out_widget.dart';
import 'package:e_commerce/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorContent,
      body: SafeArea(

        child: Column(
          children: [
            // Header with Back Button and Title
            Padding(
              padding: const EdgeInsets.all(8.0),

              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NavBar()),
                      );
                    },

                    style: IconButton.styleFrom(
                      backgroundColor: colorBg,
                      padding: const EdgeInsets.all(8),
                    ),
                    icon: Icon(size: sizeIcon - 10, Icons.arrow_back_ios),
                  ),
                  Expanded(
                    child: Center(child: Text('My Cart', style: txtHeading2)),
                  ),
                ],
              ),
            ),

            // Cart List
            Expanded(
              flex: 3,
              child: Consumer<CartProvider>(
                builder: (context, provider, _) {
                  final cartList = provider.cart;

                  if (cartList.isEmpty) {
                    return SingleChildScrollView(
                      //* Allows the widget to overflow without displaying warnings
                      physics: NeverScrollableScrollPhysics(),

                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            Image.asset(
                              'assets/images/empty_cart.png',
                              color: Colors.red,
                              height: 250,
                            ),

                            const SizedBox(height: 16),
                            Text(
                              'Your cart is empty',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: cartList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return _cartProduct(context, provider, cartList, index);
                    },
                  );
                },
              ),
            ),
            // CheckOut
            CheckOutWidget(),
          ],
        ),
      ),
    );
  }

  Widget _cartProduct(
    BuildContext context,
    CartProvider provider,
    List<ProductsModel> cartList,
    int index,
  ) {
    final cartItem = cartList[index];

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),

          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: colorBg,
              borderRadius: BorderRadius.circular(20),
            ),

            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(12),

                  child: Image.asset(cartItem.image),
                ),

                const SizedBox(width: 8),
                SizedBox(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        cartItem.title,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        cartItem.categories.join(
                          ', ',
                        ),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: colorLabel,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 8),
                      Text(
                        '\$${cartItem.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        Positioned(
          top: 32,
          right: 32,

          child: Column(
            children: [
              // Delete Button
              IconButton(
                onPressed: () {
                  provider.removeProductByIndex(index);
                },
                icon: Icon(Icons.delete, color: Colors.red, size: sizeIcon - 4),
              ),

              // Quantity Buttons
              const SizedBox(height: 12),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: colorContent,
                  border: Border.all(color: Colors.grey.shade400, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () => provider.decrementProductQtd(index),
                      child: const Icon(Icons.remove, size: 18),
                    ),

                    const SizedBox(width: 12),
                    Text(
                      cartItem.quantity.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () => provider.incrementProductQtd(index),
                      child: const Icon(Icons.add, size: 18),
                    ),

                    const SizedBox(width: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
