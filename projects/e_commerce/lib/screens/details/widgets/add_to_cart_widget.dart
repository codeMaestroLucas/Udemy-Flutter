import 'package:e_commerce/constraints.dart';
import 'package:e_commerce/models/products_model.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';

class AddToCartWidget extends StatefulWidget {
  final ProductsModel product;
  const AddToCartWidget({super.key, required this.product});

  @override
  State<AddToCartWidget> createState() => _AddToCartWidgetState();
}

class _AddToCartWidgetState extends State<AddToCartWidget> {
  int productQtdToAdd = 1;
  bool addBtnDisabled = false; // Disables when the product qtd == 0

  /// Function used to disble the Less (-) option when the product quantity selected < 1
  void _updateAddBtnState() {
    setState(() {
      addBtnDisabled = productQtdToAdd < 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),

      // Qtd Counter Container
      child: Container(
        height: 85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: colorBlack,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            _quantityController(),

            GestureDetector(
              // Prevent to send a product when the quantity is < 1
              onTap:
                  addBtnDisabled
                      ? null
                      : () {
                        provider.addToCart(widget.product, productQtdToAdd);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: colorBlack,
                            closeIconColor: colorPrimary,
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 16,
                            ),
                            behavior: SnackBarBehavior.floating,
                            elevation: 5,
                            content: Text(
                              'Successfully added!',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: colorContent,
                              ),
                            ),
                            duration: Duration(seconds: 1),
                            showCloseIcon: true,
                          ),
                        );
                      },

              child: Opacity(
                opacity: addBtnDisabled ? 0.6 : 1.0,

                child: Container(
                  height: 54,
                  decoration: BoxDecoration(
                    color: colorPrimary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20),

                  child: Text(
                    'Add to cart',
                    style: TextStyle(
                      color: colorContent,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _quantityController() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: colorContent, width: 2),
        borderRadius: BorderRadius.circular(50),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          // Less Icon
          IconButton(
            onPressed: () {
              setState(() {
                if (productQtdToAdd > 0) {
                  productQtdToAdd--;
                }
              });

              _updateAddBtnState();
            },

            icon: Icon(Icons.remove, size: sizeIcon),
            color: colorContent,
          ),

          const SizedBox(width: 6),
          Text(
            productQtdToAdd.toString().padLeft(2, '0'),
            style: const TextStyle(
              color: colorContent,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Pluss Icon
          const SizedBox(width: 6),
          IconButton(
            onPressed: () {
              setState(() {
                productQtdToAdd++;
              });

              _updateAddBtnState();
            },

            icon: Icon(Icons.add, size: sizeIcon),
            color: colorContent,
          ),
        ],
      ),
    );
  }
}
