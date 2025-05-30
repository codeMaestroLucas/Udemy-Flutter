import 'package:e_commerce/constraints.dart';
import 'package:e_commerce/models/products_model.dart';
import 'package:e_commerce/screens/details/widgets/details_app_bar.dart';
import 'package:e_commerce/screens/details/widgets/details_bottom.dart';
import 'package:e_commerce/screens/details/widgets/details_image_slider.dart';
import 'package:e_commerce/screens/details/widgets/details_item.dart';
import 'package:e_commerce/screens/details/widgets/add_to_cart_widget.dart';
import 'package:e_commerce/widgets/slides_counter_widget.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final ProductsModel product;
  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorContent,

      // For add cart icon and quantity
      floatingActionButton: AddToCartWidget(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DetailsAppBar(product: widget.product,),

              const SizedBox(height: sizeElementsSeparator),
              DetailsImageSlider(
                onChange: (index) {
                  setState(() {
                    currentSlide = index;
                  });
                },
                image: widget.product.image,
              ),

              const SizedBox(height: 4),
              SlidesCounterWidget(currentSlide: currentSlide),

              // Details product
              const SizedBox(height: sizeElementsSeparator),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                  color: colorBg,
                ),
                padding: EdgeInsets.only(
                  top: 20,
                  right: 20,
                  bottom: 110,
                  left: 20,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    DetailsItem(product: widget.product),

                    const SizedBox(height: sizeElementsSeparator),
                    DetailsBottom(product: widget.product),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
