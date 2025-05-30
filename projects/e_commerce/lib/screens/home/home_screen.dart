import 'package:e_commerce/constraints.dart';
import 'package:e_commerce/data/products_data.dart';
import 'package:e_commerce/models/products_model.dart';
import 'package:e_commerce/screens/home/widgets/categories_widget.dart';
import 'package:e_commerce/screens/home/widgets/home_app_bar_widget.dart';
import 'package:e_commerce/screens/home/widgets/home_image_slider.dart';
import 'package:e_commerce/screens/home/widgets/products_widget.dart';
import 'package:e_commerce/screens/home/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  late List<ProductsModel> filteredProducts;
  String? selectedCategory;
  int currentSlide = 0;

  @override
  void initState() {
    super.initState();
    filteredProducts = ProductsData().data;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Filter products based on category selection (null means no category filter)
  void filterProducts(String? category) {
    setState(() {
      selectedCategory = category;
      
      // First apply category filter if exists
      final categoryFiltered = category == null
          ? ProductsData().data
          : ProductsData().data.where((p) => p.categories.contains(category)).toList();
      
      // Then apply search filter if exists
      if (_searchController.text.isNotEmpty) {
        final query = _searchController.text.toLowerCase().trim();
        filteredProducts = categoryFiltered.where((product) {
          return product.title.toLowerCase().contains(query) ||
                 product.description.toLowerCase().contains(query);
        }).toList();
      } else {
        filteredProducts = categoryFiltered;
      }
    });
  }

  /// Filter products based on search query
  void _applySearchFilter(String query) {
    setState(() {
      query = query.toLowerCase().trim();
      
      // First get products filtered by category (if any)
      final categoryFiltered = selectedCategory == null
          ? ProductsData().data
          : ProductsData().data.where((p) => p.categories.contains(selectedCategory!)).toList();
      
      // Then apply search filter
      if (query.isEmpty) {
        filteredProducts = categoryFiltered;
      } else {
        filteredProducts = categoryFiltered.where((product) {
          return product.title.toLowerCase().contains(query) ||
                 product.description.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(paddingScreens),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 24),
              const HomeAppBarWidget(),

              const SizedBox(height: sizeElementsSeparator),
              SearchBarWidget(
                controller: _searchController,
                onChanged: _applySearchFilter,
              ),

              const SizedBox(height: sizeElementsSeparator),
              HomeImageSlider(
                onChange: (value) => setState(() => currentSlide = value),
                currentSlide: currentSlide,
              ),

              const SizedBox(height: sizeElementsSeparator),
              CategoriesWidget(
                onCategorySelected: filterProducts,
                selectedCategory: selectedCategory,
              ),

              // Products that are showned in the screen
              const SizedBox(height: sizeElementsSeparator),
              _buildHeader(),
              _buildProductGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(
          selectedCategory != null ? selectedCategory! : 'Special for you',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        if (selectedCategory != null || _searchController.text.isNotEmpty)
          GestureDetector(
            onTap: () {
              _searchController.clear();
              filterProducts(null); // Clear all filters
            },
            child: Text(
              'Clear filters',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildProductGrid() {
    if (filteredProducts.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),

        child: Center(
          child: Column(
            children: [
              Icon(Icons.search_off, size: 50, color: Colors.grey.shade400),

              const SizedBox(height: 16),
              Text(
                'No products found',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
              
              const SizedBox(height: 8),
              Text(
                'Try different search or filter',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
      );
    }

    return GridView.builder(
      itemCount: filteredProducts.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        mainAxisExtent: 250,
      ),
      itemBuilder: (context, index) {
        return ProductsWidget(product: filteredProducts[index]);
      },
    );
  }
}