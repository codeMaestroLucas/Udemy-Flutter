import 'package:e_commerce/constraints.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';

class CheckOutWidget extends StatefulWidget {
  const CheckOutWidget({super.key});

  @override
  State<CheckOutWidget> createState() => _CheckOutWidgetState();
}

class _CheckOutWidgetState extends State<CheckOutWidget> {
  final TextEditingController _discountController = TextEditingController();
  double discountPercent = 0.0;

  @override
  void dispose() {
    _discountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CartProvider provider = CartProvider.of(context);
    final double subtotal = provider.checkOutValue();
    final double discountValue = subtotal * discountPercent;
    final double total = subtotal - discountValue;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorBg,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),

      child: Column(
        children: [
          // Discount TextField
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: colorContent,
              borderRadius: BorderRadius.circular(50),
            ),

            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _discountController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Enter discount Code',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: colorLabel,
                      ),
                      suffixIcon: TextButton(
                        onPressed: () {
                          final code =
                              _discountController.text.trim().toUpperCase();

                          setState(() {
                            if (code == 'D10') {
                              discountPercent = 0.10;
                            } else if (code == 'D20') {
                              discountPercent = 0.20;
                            } else {
                              discountPercent = 0.0;
                            }
                          });
                        },

                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),

                          child: Text(
                            'Apply',
                            style: TextStyle(
                              color: colorPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: sizeElementsSeparator + 12),

          // Subtotal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text('Subtotal', style: txtSubTitle.copyWith(color: colorLabel)),
              Text(
                '\$${subtotal.toStringAsFixed(2)}',
                style: txtSubTitle.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
              const SizedBox(),
              Text(
                '- \$${discountValue.toStringAsFixed(2)}',
                style: txtSubTitle.copyWith(
                  fontSize: 12,
                  color:
                      discountValue == 0
                          ? Colors.red.withAlpha(50)
                          : Colors.red.withAlpha(200),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: sizeElementsSeparator),
          Divider(height: 1, color: Colors.grey.shade400),
          const SizedBox(height: sizeElementsSeparator),

          // Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                'Total',
                style: txtSubTitle.copyWith(
                  color: colorBlack,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text('\$${total.toStringAsFixed(2)}', style: txtHeading2),
            ],
          ),

          // Checkout Btn
          const SizedBox(height: sizeElementsSeparator),
          GestureDetector(
            onTap: () {},

            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: colorPrimary,
                borderRadius: BorderRadius.circular(50),
              ),

              child: Text(
                'Check out',
                textAlign: TextAlign.center,
                style: txtSubTitle.copyWith(
                  color: colorContent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
