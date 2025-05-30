import 'package:e_commerce/data/categories_data.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final Function(String?) onCategorySelected;
  final String? selectedCategory;

  const CategoriesWidget({
    super.key,
    required this.onCategorySelected,
    this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    final categories = CategoriesData().data;

    return SizedBox(
      height: 100,

      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = categories[index].title == selectedCategory;
          
          return GestureDetector(
            onTap: () {
              // Toggle selection - if already selected, pass null to clear filter
              onCategorySelected(isSelected ? null : categories[index].title);
            },

            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: isSelected
                        ? Border.all(color: Colors.blue, width: 2)
                        : null,
                    image: DecorationImage(
                      image: AssetImage(categories[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 4),
                Text(
                  categories[index].title,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.blue : Colors.black,
                  ),
                ),
              ],
            ),
          );
        },
        
        separatorBuilder: (context, index) => const SizedBox(width: 8),
      ),
    );
  }
}