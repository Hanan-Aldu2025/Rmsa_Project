import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isTablet = size.width > 600;
    final double paddingH = isTablet ? 32.0 : 16.0;

    final List<Map<String, dynamic>> products = [
      {
        'title': 'Special Offer',
        'price': 4.50,
        'image': 'assets/images/oneboarding.jpg',
        'isMain': true,
      },
      {
        'title': 'Vanilla Latte',
        'price': 5.25,
        'image': 'assets/images/oneboarding.jpg',
        'isMain': false,
      },
      {
        'title': 'Caramel Macchiato',
        'price': 6.00,
        'image': 'assets/images/oneboarding.jpg',
        'isMain': false,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Ramsa Cafe",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: const [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 16),
          CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
          ),
          SizedBox(width: 12),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BranchSelector(),
              const SizedBox(height: 12),
              const SearchField(),
              const SizedBox(height: 20),
              const Text(
                "Explore",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              const CategoryList(),
              const SizedBox(height: 20),
              const Text(
                "Featured Drinks",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isTablet ? 3 : 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    final item = products[index];
                    return ProductCard(
                      title: item['title'],
                      price: item['price'],
                      imageUrl: item['image'],
                      isMain: item['isMain'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BranchSelector extends StatelessWidget {
  const BranchSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined, color: Colors.grey),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Downtown Branch',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.green,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: const InputDecoration.collapsed(
                hintText: "Search for coffee or treats...",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Coffee', 'Tea', 'Dessert'];

    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final bool selected = index == 0;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: selected ? const Color(0xFF4D1F13) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: selected ? Colors.transparent : Colors.grey.shade300,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  index == 0
                      ? Icons.layers
                      : index == 1
                      ? Icons.coffee_outlined
                      : index == 2
                      ? Icons.emoji_nature
                      : Icons.cake_outlined,
                  color: selected ? Colors.white : Colors.black87,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  categories[index],
                  style: TextStyle(
                    color: selected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String imageUrl;
  final bool isMain;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.isMain,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 الصورة + القلب
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 120,
                  width: double.infinity,
                ),
              ),
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.favorite_border, color: Colors.red),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "\$${price.toStringAsFixed(2)}",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: isMain
                ? SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4D1F13),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Special Offer",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "S",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "M",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "L",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4D1F13),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Add to Cart",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int selectedCategory = 0;

//   final List<String> categories = ['All', 'Coffee', 'Tea', 'Dessert'];

//   final List<Map<String, dynamic>> products = [
//     {
//       'title': 'Classic Espresso',
//       'price': 3.50,
//       'image': 'https://i.imgur.com/BoN9kdC.png',
//     },
//     {
//       'title': 'Vanilla Latte',
//       'price': 5.25,
//       'image': 'https://i.imgur.com/2yAFH4B.png',
//     },
//     {
//       'title': 'Vanilla Latte',
//       'price': 5.25,
//       'image': 'https://i.imgur.com/2yAFH4B.png',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final double paddingH = MediaQuery.of(context).size.width < 600
//         ? 16.0
//         : 32.0;

//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: const Text(
//           'Ramsa cafe',
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications_none, color: Colors.black),
//             onPressed: () {},
//           ),
//           const Padding(
//             padding: EdgeInsets.only(right: 12),
//             child: CircleAvatar(
//               radius: 16,
//               backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
//             ),
//           ),
//         ],
//       ),

//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: 12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // 🔹 Branch Selector
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 10,
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.location_on_outlined, color: Colors.grey),
//                     const SizedBox(width: 8),
//                     const Expanded(
//                       child: Text(
//                         'Downtown Branch',
//                         style: TextStyle(
//                           color: Colors.green,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.call, color: Colors.green),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 12),

//               // 🔹 Search bar
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 6,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.search, color: Colors.grey),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: TextField(
//                         decoration: const InputDecoration.collapsed(
//                           hintText: 'Search for coffee or treats...',
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 20),

//               const Text(
//                 'Explore',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//               ),

//               const SizedBox(height: 6),

//               // 🔹 Categories
//               SizedBox(
//                 height: 44,
//                 child: ListView.separated(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: categories.length,
//                   separatorBuilder: (_, __) => const SizedBox(width: 10),
//                   itemBuilder: (context, index) {
//                     final bool selected = selectedCategory == index;
//                     return GestureDetector(
//                       onTap: () => setState(() => selectedCategory = index),
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 14,
//                           vertical: 8,
//                         ),
//                         decoration: BoxDecoration(
//                           color: selected
//                               ? const Color(0xFF4D1F13)
//                               : Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all(
//                             color: selected
//                                 ? Colors.transparent
//                                 : Colors.grey.shade300,
//                           ),
//                         ),
//                         child: Row(
//                           children: [
//                             Icon(
//                               index == 0
//                                   ? Icons.layers
//                                   : index == 1
//                                   ? Icons.coffee_outlined
//                                   : index == 2
//                                   ? Icons.park_outlined
//                                   : Icons.cake_outlined,
//                               color: selected ? Colors.white : Colors.black87,
//                               size: 20,
//                             ),
//                             const SizedBox(width: 8),
//                             Text(
//                               categories[index],
//                               style: TextStyle(
//                                 color: selected ? Colors.white : Colors.black87,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),

//               const SizedBox(height: 18),

//               const Text(
//                 'Featured Drinks',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//               ),

//               const SizedBox(height: 12),

//               // 🔹 Grid of products
//               Expanded(
//                 child: GridView.builder(
//                   itemCount: products.length,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 12,
//                     crossAxisSpacing: 12,
//                     childAspectRatio: 0.72,
//                   ),
//                   itemBuilder: (context, index) {
//                     final item = products[index];
//                     return ProductCard(
//                       title: item['title'],
//                       price: item['price'],
//                       imageUrl: item['image'],
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),

//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.layers), label: 'Cart'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.inventory_2_outlined),
//             label: 'Orders',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.location_on_outlined),
//             label: 'Location',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_outline),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProductCard extends StatefulWidget {
//   final String title;
//   final double price;
//   final String imageUrl;

//   const ProductCard({
//     super.key,
//     required this.title,
//     required this.price,
//     required this.imageUrl,
//   });

//   @override
//   State<ProductCard> createState() => _ProductCardState();
// }

// class _ProductCardState extends State<ProductCard> {
//   bool liked = false;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // 🔹 Product Image + like button
//             Stack(
//               children: [
//                 AspectRatio(
//                   aspectRatio: 1.8,
//                   child: Image.network(
//                     widget.imageUrl,
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                   ),
//                 ),
//                 Positioned(
//                   top: 8,
//                   right: 8,
//                   child: GestureDetector(
//                     onTap: () => setState(() => liked = !liked),
//                     child: CircleAvatar(
//                       radius: 16,
//                       backgroundColor: Colors.white70,
//                       child: Icon(
//                         liked ? Icons.favorite : Icons.favorite_border,
//                         color: liked ? Colors.red : Colors.grey[700],
//                         size: 18,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             Padding(
//               padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
//               child: Text(
//                 widget.title,
//                 style: const TextStyle(fontWeight: FontWeight.w600),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: Text(
//                 "\$${widget.price.toStringAsFixed(2)}",
//                 style: TextStyle(color: Colors.grey[600]),
//               ),
//             ),

//             const Spacer(),

//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: OutlinedButton.icon(
//                       onPressed: () {},
//                       icon: const Icon(Icons.add, size: 18),
//                       label: const Text("Add to Cart"),
//                       style: OutlinedButton.styleFrom(
//                         backgroundColor: const Color(0xFF4D1F13),
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
