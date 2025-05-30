import 'package:e_commerce/models/products_model.dart';
import 'package:flutter/material.dart';

class ProductsData {
  final data = [
    ProductsModel(
      title: 'Silk Blouse',
      description:
          'Premium 100% silk blouse with a timeless design. Features long sleeves, '
          'a regular fit, and elegant drape. Perfect for both office wear and evening occasions.',
      image: 'assets/images/products/silk_blouse.png',
      specifications: [
        {'Material': '100% Silk'},
        {'Sleeve': 'Long'},
        {'Fit': 'Regular'},
        {'Color Options': 'White, Pink, Blue Grey'},
        {'Care': 'Dry clean only'},
      ],
      reviewsQtd: 85,
      reviews: [
        {
          'profile_pic': 'assets/images/users/user1.jpeg',
          'user': 'John Doe',
          'ratting': 4.2,
          'comment':
              'The silk quality is exceptional - soft and breathable. '
              'Perfect for summer evenings. Runs slightly large.',
        },
        {
          'profile_pic': 'assets/images/users/user4.jpg',
          'user': 'Emily Smith',
          'ratting': 4.5,
          'comment':
              'Elegant drape and comfortable fit. '
              'Worth every penny for the luxurious feel.',
        },
        {
          'profile_pic': 'assets/images/users/user5.jpeg',
          'user': 'Sophia Lee',
          'ratting': 3.5,
          'comment':
              'Beautiful fabric but shipping took longer than expected. '
              'Size chart was accurate.',
        },
      ],
      seller: 'Chic Boutique',
      price: 79.99,
      colors: [Colors.white, Colors.pinkAccent, Colors.blueGrey],
      categories: ['Women\'s Fashion'],
      rate: 4.4,
      quantity: 1,
    ),
    ProductsModel(
      title: 'Premium Leather Handbag',
      description:
          'Handcrafted genuine leather handbag with vegetable tanning. '
          'Features an adjustable shoulder strap, 3 compartments including a padded laptop sleeve, '
          'and anti-theft zippers. Ages beautifully over time.',
      image: 'assets/images/products/leather_handbag.png',
      specifications: [
        {'Material': 'Full-grain Leather'},
        {'Strap': 'Adjustable (45-55 cm)'},
        {'Compartments': '3 (including laptop sleeve)'},
        {'Dimensions': '30 x 20 x 12 cm'},
        {'Weight': '1.2 kg'},
      ],
      reviewsQtd: 375,
      reviews: [
        {
          'profile_pic': 'assets/images/users/user5.jpeg',
          'user': 'Rachel Green',
          'ratting': 5.0,
          'comment':
              'The leather smells amazing and develops a beautiful patina. '
              'Fits my 15" laptop perfectly. My everyday essential!',
        },
        {
          'profile_pic': 'assets/images/users/user6.jpeg',
          'user': 'Monica Geller',
          'ratting': 4.5,
          'comment':
              'Excellent craftsmanship. The stitching is perfect. '
              'Only wish it came with a dust bag.',
        },
        {
          'profile_pic': 'assets/images/users/user7.jpeg',
          'user': 'Phoebe Buffay',
          'ratting': 4.0,
          'comment':
              'Love the vintage look! The leather is thick and durable. '
              'Strap could be more comfortable for all-day wear.',
        },
      ],
      seller: 'Urban Fashion',
      price: 129.90,
      colors: [Colors.brown, Colors.black, Colors.grey],
      categories: ['Jewellery'],
      rate: 4.8,
      quantity: 1,
    ),
    ProductsModel(
      title: 'Matte Lipstick Set (5 Shades)',
      description:
          'Vegan, long-wear matte lipstick set with nourishing ingredients. '
          'Provides full coverage with one swipe, non-drying formula enriched with '
          'avocado oil and vitamin E. Lasts up to 8 hours without feathering.',
      image: 'assets/images/products/matte_lipstick.png',
      specifications: [
        {'Finish': 'Velvet Matte'},
        {'Shades': '5 (Nude, Berry, Red, Pink, Coral)'},
        {'Weight': '3.5g each'},
        {'Ingredients': 'Vegan, cruelty-free'},
        {'Longevity': '8 hours'},
      ],
      reviewsQtd: 129,
      reviews: [
        {
          'profile_pic': 'assets/images/users/user7.jpeg',
          'user': 'Anna White',
          'ratting': 4.5,
          'comment':
              'The berry shade is my new favorite! Doesn\'t dry out my lips '
              'like other mattes. Pigmentation is incredible.',
        },
        {
          'profile_pic': 'assets/images/users/user6.jpeg',
          'user': 'Clara Jones',
          'ratting': 4.5,
          'comment':
              'Survives coffee and meals. The nude shade is perfect '
              'for everyday office wear. Minimal transfer.',
        },
        {
          'profile_pic': 'assets/images/users/user4.jpg',
          'user': 'Diana Ross',
          'ratting': 4.0,
          'comment':
              'Great color payoff but the coral shade is slightly '
              'different than pictured. Otherwise excellent quality.',
        },
      ],
      seller: 'Glow Beauty',
      price: 49.50,
      colors: [Colors.red, Colors.purple, Colors.pink, Colors.orange],
      categories: ['Beauty'],
      rate: 4.7,
      quantity: 1,
    ),
    ProductsModel(
      title: 'Slim Fit Stretch Jeans',
      description:
          'Modern slim-fit jeans with 2% elastane for comfort. '
          'Mid-rise waist, tapered leg, and reinforced stitching. '
          'Designed to maintain shape wash after wash. Stonewashed for softness.',
      image: 'assets/images/products/slim_jeans.png',
      specifications: [
        {'Material': '98% Cotton, 2% Elastane'},
        {'Fit': 'Slim (tapered leg)'},
        {'Rise': 'Mid-rise (25 cm)'},
        {'Closure': 'Button fly + zip'},
        {'Pockets': '5 (including coin pocket)'},
      ],
      reviewsQtd: 75,
      reviews: [
        {
          'profile_pic': 'assets/images/users/user7.jpeg',
          'user': 'Jake Park',
          'ratting': 4.0,
          'comment':
              'Perfect balance between slim and comfortable. '
              'The stretch makes them ideal for all-day wear. True to size.',
        },
        {
          'profile_pic': 'assets/images/users/user6.jpeg',
          'user': 'Tina Kim',
          'ratting': 4.5,
          'comment':
              'Love the indigo wash - fades beautifully. '
              'The cut is very flattering. My go-to jeans now!',
        },
        {
          'profile_pic': 'assets/images/users/user1.jpeg',
          'user': 'Sam Lee',
          'ratting': 3.5,
          'comment':
              'Good quality denim but runs slightly small in the waist. '
              'Recommend sizing up if between sizes.',
        },
      ],
      seller: 'Denim Co.',
      price: 69.99,
      colors: [Colors.indigo, Colors.black, Colors.blueGrey],
      categories: ['Men\'s Fashion'],
      rate: 4.5,
      quantity: 1,
    ),
    ProductsModel(
      title: 'Golden Ring',
      description:
          '18K gold plated ring with intricate floral design. '
          'Features a polished finish with rhodium plating to prevent tarnishing. '
          'Hypoallergenic and nickel-free, suitable for sensitive skin.',
      image: 'assets/images/products/golden_ring.png',
      specifications: [
        {'Material': '18K Gold Plated (2.5 microns)'},
        {'Stone': 'Cubic Zirconia (0.25ct)'},
        {'Width': '4mm'},
        {'Sizing': 'Adjustable (US 5-9)'},
        {'Care': 'Avoid water, chemicals, and perfumes'},
      ],
      reviewsQtd: 142,
      reviews: [
        {
          'profile_pic': 'assets/images/users/user5.jpeg',
          'user': 'Olivia Wilson',
          'ratting': 4.8,
          'comment':
              'Absolutely stunning craftsmanship! The detailing is exquisite. '
              'Worn daily for 3 months with no fading or discoloration.',
        },
        {
          'profile_pic': 'assets/images/users/user4.jpg',
          'user': 'Emma Thompson',
          'ratting': 4.0,
          'comment':
              'Beautiful design but slightly smaller than expected. '
              'The gold plating is thick and luxurious looking.',
        },
        {
          'profile_pic': 'assets/images/users/user6.jpeg',
          'user': 'Sophia Garcia',
          'ratting': 5.0,
          'comment':
              'Received countless compliments. The adjustable sizing is perfect '
              'as my fingers swell sometimes. Excellent value!',
        },
      ],
      seller: 'Luxury Jewelers',
      price: 89.99,
      colors: [Colors.amber, Colors.yellow, Colors.white],
      categories: ['Jewellery'],
      rate: 4.6,
      quantity: 1,
    ),
    ProductsModel(
      title: 'Black Social Shoes',
      description:
          'Premium leather oxford shoes with cushioned insoles. '
          'Features Goodyear welt construction for durability, anti-slip rubber soles, '
          'and breathable leather lining. Perfect for formal occasions and office wear.',
      image: 'assets/images/products/social_shoes.png',
      specifications: [
        {'Material': 'Full-grain Leather'},
        {'Sole': 'Anti-slip Rubber'},
        {'Construction': 'Goodyear Welt'},
        {'Closure': 'Lace-up'},
        {'Weight': '1.8 kg (pair)'},
      ],
      reviewsQtd: 210,
      reviews: [
        {
          'profile_pic': 'assets/images/users/user1.jpeg',
          'user': 'Michael Brown',
          'ratting': 4.7,
          'comment':
              'Extremely comfortable right out of the box. The arch support is '
              'perfect for all-day wear at conferences. Highly recommend!',
        },
        {
          'profile_pic': 'assets/images/users/user2.jpeg',
          'user': 'David Miller',
          'ratting': 4.5,
          'comment':
              'Classic design that pairs with all my suits. The leather is '
              'high quality and develops a nice patina over time.',
        },
        {
          'profile_pic': 'assets/images/users/user3.jpeg',
          'user': 'James Wilson',
          'ratting': 4.0,
          'comment':
              'Great shoes but require breaking in. After 2 weeks of wear, '
              'they became my most comfortable dress shoes.',
        },
      ],
      seller: 'Elite Footwear',
      price: 149.95,
      colors: [Colors.black, Colors.brown],
      categories: ['Shoes', 'Men\'s Fashion'],
      rate: 4.5,
      quantity: 1,
    ),
  ];
}
