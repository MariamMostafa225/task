import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {"name": "Sandal", "icon": Icons.shopping_bag},
    {"name": "Watch", "icon": Icons.watch},
    {"name": "Bag", "icon": Icons.work},
    {"name": "Shoes", "icon": Icons.directions_run},
    {"name": "Heels", "icon": Icons.woman},
    {"name": "Backpack", "icon": Icons.backpack},
    {"name": "Accessories", "icon": Icons.star},
  ];

  final List<Map<String, String>> products = [
    {"image": "images/heel.png"},
    {"image": "images/watch1.png"},
    {"image": "images/backpack.png"},
    {"image": "images/watch2.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      // 🔹 AppBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        title: const Text(
          "DP Shop",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Stack(
            children: const [
              Icon(Icons.shopping_bag_outlined, color: Colors.black),
              Positioned(
                right: 0,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: Text(
                    "3",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 15),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔹 Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search here...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.camera_alt_outlined),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Categories Title
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            // 🔹 Categories (Scrollable Horizontal)
            SizedBox(
              height: 70,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (_, i) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 5),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          categories[i]["icon"],
                          size: 20,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          categories[i]["name"],
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Best Selling
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Best Selling",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            // 🔹 Products Grid
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (_, i) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🔹 Image + Discount + Favorite
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                              child: Image.asset(
                                products[i]["image"]!,
                                height: 140,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),

                            Positioned(
                              left: 10,
                              top: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  "-50%",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),

                            const Positioned(
                              right: 10,
                              top: 10,
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Product Title",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Write description of product",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "\$55",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.shopping_cart_outlined),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> categories = [
//   {"name": "Sandal", "icon": Icons.shopping_bag},
//   {"name": "Watch", "icon": Icons.watch},
//   {"name": "Bag", "icon": Icons.work},
//   {"name": "Shoes", "icon": Icons.directions_run},
//   {"name": "Heels", "icon": Icons.woman},
//   {"name": "Backpack", "icon": Icons.backpack},
//   {"name": "Accessories", "icon": Icons.star},
// ];

//   final List<Map<String, String>> products = [
//     {"image": "images/heel.png"},
//     {"image": "images/watch1.png"},
//     {"image": "images/backpack.png"},
//     {"image": "images/watch2.png"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF5F6FA),

//       // 🔹 AppBar
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: Icon(Icons.menu, color: Colors.black),
//         title: Text(
//           "DP Shop",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         actions: [
//           Stack(
//             children: [
//               Icon(Icons.shopping_bag_outlined, color: Colors.black),
//               Positioned(
//                 right: 0,
//                 child: CircleAvatar(
//                   radius: 8,
//                   backgroundColor: Colors.red,
//                   child: Text("3",
//                       style: TextStyle(fontSize: 10, color: Colors.white)),
//                 ),
//               )
//             ],
//           ),
//           SizedBox(width: 15)
//         ],
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [

//             // 🔹 Search Bar
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: "Search here...",
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                   Icon(Icons.camera_alt_outlined)
//                 ],
//               ),
//             ),

//             SizedBox(height: 20),

//             // 🔹 Categories Title
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "Categories",
//                 style: TextStyle(
//                     fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),

//             SizedBox(height: 10),

//             // 🔹 Categories List
//             SizedBox(
//               height: 60,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: categories.length,
//                 itemBuilder: (_, i) {
//                   return Container(
//                     margin: EdgeInsets.only(right: 10),
//                     padding: EdgeInsets.symmetric(horizontal: 15),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Row(
//                       children: [
//                         Text(categories[i]["icon"]!, style: TextStyle(fontSize: 18)),
//                         SizedBox(width: 5),
//                         Text(categories[i]["name"]!),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),

//             SizedBox(height: 20),

//             // 🔹 Best Selling
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "Best Selling",
//                 style: TextStyle(
//                     fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),

//             SizedBox(height: 10),

//             // 🔹 Products Grid
//             Expanded(
//               child: GridView.builder(
//                 itemCount: products.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 15,
//                   crossAxisSpacing: 15,
//                   childAspectRatio: 0.7,
//                 ),
//                 itemBuilder: (_, i) {
//                   return Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [

//                         // 🔹 Image + Discount + Favorite
//                         Stack(
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//                               child: Image.asset(
//                                 products[i]["image"]!,
//                                 height: 120,
//                                 width: double.infinity,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),

//                             Positioned(
//                               left: 10,
//                               top: 10,
//                               child: Container(
//                                 padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
//                                 decoration: BoxDecoration(
//                                   color: Colors.blue,
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Text("-50%", style: TextStyle(color: Colors.white, fontSize: 12)),
//                               ),
//                             ),

//                             Positioned(
//                               right: 10,
//                               top: 10,
//                               child: Icon(Icons.favorite_border, color: Colors.red),
//                             ),
//                           ],
//                         ),

//                         SizedBox(height: 10),

//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Product Title",
//                                   style: TextStyle(fontWeight: FontWeight.bold)),

//                               SizedBox(height: 5),

//                               Text(
//                                 "Write description of product",
//                                 style: TextStyle(fontSize: 12, color: Colors.grey),
//                               ),

//                               SizedBox(height: 10),

//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("\$55",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold)),

//                                   Icon(Icons.shopping_cart_outlined)
//                                 ],
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
