// import 'package:flutter/material.dart';
// import 'package:nike_application/login_page.dart';
// import 'package:nike_application/shoe.dart';
// import 'package:nike_application/shoe_list.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert'; // For encoding and decoding JSON

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, this.email = ""});

//   final String email;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<List> likedShoes = [];
//   List<List> cartItems = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadPreferences();
//   }

//   Future<void> _loadPreferences() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       likedShoes = (jsonDecode(prefs.getString('likedShoes') ?? '[]') as List)
//           .map((item) => List<String>.from(item))
//           .toList();
//       cartItems = (jsonDecode(prefs.getString('cartItems') ?? '[]') as List)
//           .map((item) => List<String>.from(item))
//           .toList();
//     });
//   }

//   Future<void> _updatePreferences() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('likedShoes', jsonEncode(likedShoes));
//     await prefs.setString('cartItems', jsonEncode(cartItems));
//   }

//   //LOGOUT BUTTON
//   void _logout() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const MyLoginPage()),
//     );
//   }

//   //LIKE BUTTON
//   void _toggleLike(List shoe) {
//     setState(() {
//       if (likedShoes.contains(shoe)) {
//         likedShoes.remove(shoe);
//       } else {
//         likedShoes.add(shoe);
//       }
//       _updatePreferences();
//     });
//   }

//   // ADD TO CART
//   void _addToCart(List shoe) {
//     setState(() {
//       if (cartItems.contains(shoe)) {
//         cartItems.remove(shoe);
//       } else {
//         cartItems.add(shoe);
//       }
//       _updatePreferences();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Shoe nikeShoes = Shoe();
//     final MyImage nikeImages = MyImage();

//     return PopScope(
//       canPop: false,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           automaticallyImplyLeading: true,
//           title: Row(
//             children: [
//               Image.asset(
//                 'assets/nike.png', // Make sure to add your Nike logo image to the assets folder
//                 height: 50,
//               ),
//               const Spacer(),
//               IconButton(
//                 icon: const Icon(Icons.search, color: Colors.black),
//                 onPressed: () {},
//               ),
//               IconButton(
//                 icon: const Icon(Icons.shopping_cart, color: Colors.black),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => MyAddCart(
//                               cartItems: cartItems,
//                               images: nikeImages.images,
//                             )),
//                   );
//                 },
//               ),
//               IconButton(
//                 icon: const Icon(Icons.logout, color: Colors.black),
//                 onPressed: _logout,
//               ),
//             ],
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 20),
//               const Text(
//                 'Men\'s Jordan Shoes',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.filter_list, color: Colors.black),
//                     onPressed: () {
//                       // Handle filter action
//                     },
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Expanded(
//                 child: MyShoeList(
//                   shoes: nikeShoes.shoes,
//                   images: nikeImages.images,
//                   onLike: _toggleLike,
//                   onAddToCart: _addToCart,
//                   likedShoes: likedShoes,
//                   cartItems: cartItems,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         drawer: Drawer(
//           child: ListView(
//             children: [
//               SizedBox(
//                 height: 80,
//                 child: DrawerHeader(
//                   child: ListTile(
//                     leading: const Padding(
//                       padding: EdgeInsets.fromLTRB(0, 0, 1, 0),
//                       child: CircleAvatar(
//                         backgroundImage: NetworkImage(
//                             'https://scontent.fmnl24-1.fna.fbcdn.net/v/t1.6435-1/188875613_3933423093393159_5758743602276423364_n.jpg?stp=dst-jpg_s200x200&_nc_cat=107&ccb=1-7&_nc_sid=e4545e&_nc_ohc=S-KidRUPqPEQ7kNvgHKoD9Z&_nc_ht=scontent.fmnl24-1.fna&oh=00_AYDBDDc04gGte4TH0pgDbV2LA-y7XrfWIkPZUr3XjzFXlA&oe=66A61DA0'),
//                       ),
//                     ),
//                     title: const Text(
//                       "Vincent Benedict Barquilla",
//                       style:
//                           TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
//                     ),
//                     trailing: const Text(
//                       "Active",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//                     ),
//                     onTap: () {},
//                   ),
//                 ),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.person),
//                 title: const Text("Profile"),
//                 onTap: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => const MyProfile()),
//                   );
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.favorite),
//                 title: const Text("Likes"),
//                 onTap: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => MyLikes(
//                               likedShoes: likedShoes,
//                               images: nikeImages.images,
//                             )),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'login_page.dart';
import 'shoe.dart';
import 'shoe_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.email = ""});

  final String email;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ShoeItem> likedShoes = [];
  List<ShoeItem> cartItems = [];

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      likedShoes = (jsonDecode(prefs.getString('likedShoes') ?? '[]') as List)
          .map((item) => ShoeItem.fromJson(item))
          .toList();
      cartItems = (jsonDecode(prefs.getString('cartItems') ?? '[]') as List)
          .map((item) => ShoeItem.fromJson(item))
          .toList();
    });
  }

  Future<void> _updatePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'likedShoes',
      jsonEncode(likedShoes.map((shoe) => shoe.toJson()).toList()),
    );
    await prefs.setString(
      'cartItems',
      jsonEncode(cartItems.map((shoe) => shoe.toJson()).toList()),
    );
  }

  void _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Clear account-specific preferences
    await prefs.remove('email');
    await prefs.remove('isLoggedIn');

    // Navigate to the login page
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const MyLoginPage(),
      ),
      (Route<dynamic> route) => false, // Remove all previous routes
    );
  }

  void _clearAccountPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Clear account-specific preferences
    await prefs.remove('email');
    await prefs.remove('isLoggedIn');

    // Navigate to the login page
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const MyLoginPage(),
      ),
      (Route<dynamic> route) => false, // Remove all previous routes
    );
  }

  void _toggleLike(ShoeItem shoe) {
    setState(() {
      if (likedShoes.contains(shoe)) {
        likedShoes.remove(shoe);
      } else if (!cartItems.contains(shoe)) {
        likedShoes.add(shoe);
      }
      _updatePreferences();
    });
  }

  void _addToCart(ShoeItem shoe) {
    setState(() {
      if (cartItems.contains(shoe)) {
        cartItems.remove(shoe);
      } else if (!likedShoes.contains(shoe)) {
        cartItems.add(shoe);
      }
      _updatePreferences();
    });
  }

  void _removeFromCart(ShoeItem shoe) {
    setState(() {
      cartItems.remove(shoe);
      _updatePreferences();
    });
  }

  void _unlike(ShoeItem shoe) {
    setState(() {
      likedShoes.remove(shoe);
      _updatePreferences();
    });
  }

  Future<void> _navigateToLikes() async {
    final updatedLikedShoes = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyLikes(
          likedShoes: likedShoes,
        ),
      ),
    );

    if (updatedLikedShoes != null) {
      setState(() {
        likedShoes = updatedLikedShoes;
      });
      _updatePreferences();
    }
  }

  Future<void> _navigateToAddCart() async {
    final updatedCartItems = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyAddCart(
          cartItems: cartItems,
        ),
      ),
    );

    if (updatedCartItems != null) {
      setState(() {
        cartItems = updatedCartItems;
      });
      _updatePreferences();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              'assets/nike.png', // Ensure this path is correct
              height: 50,
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.red),
              onPressed: _navigateToLikes,
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.black),
              onPressed: _navigateToAddCart,
            ),
            IconButton(
              icon: const Icon(Icons.logout, color: Colors.black),
              onPressed: () => _logout(context),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Men\'s Jordan Shoes',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.filter_list, color: Colors.black),
                  onPressed: () {
                    // Handle filter action
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: MyShoeList(
                shoes: shoeData.shoes,
                onLike: _toggleLike,
                onAddToCart: _addToCart,
                likedShoes: likedShoes,
                cartItems: cartItems,
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 80,
              child: DrawerHeader(
                child: ListTile(
                  leading: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 1, 0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://scontent.fmnl24-1.fna.fbcdn.net/v/t1.6435-1/188875613_3933423093393159_5758743602276423364_n.jpg?stp=dst-jpg_s200x200&_nc_cat=107&ccb=1-7&_nc_sid=e4545e&_nc_ohc=S-KidRUPqPEQ7kNvgHKoD9Z&_nc_ht=scontent.fmnl24-1.fna&oh=00_AYDBDDc04gGte4TH0pgDbV2LA-y7XrfWIkPZUr3XjzFXlA&oe=66A61DA0'),
                    ),
                  ),
                  title: const Text(
                    "Vincent Benedict Barquilla",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  trailing: const Text(
                    "Active",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  onTap: () {},
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyProfile()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text("Likes"),
              onTap: _navigateToLikes,
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text("Add to Cart"),
              onTap: _navigateToAddCart,
            ),
          ],
        ),
      ),
    );
  }
}

// PROFILE PAGE
class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              'assets/nike.png', // Make sure to add your Nike logo image to the assets folder
              height: 50,
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  'https://scontent.fmnl24-1.fna.fbcdn.net/v/t1.6435-1/188875613_3933423093393159_5758743602276423364_n.jpg?stp=dst-jpg_s200x200&_nc_cat=107&ccb=1-7&_nc_sid=e4545e&_nc_ohc=S-KidRUPqPEQ7kNvgHKoD9Z&_nc_ht=scontent.fmnl24-1.fna&oh=00_AYDBDDc04gGte4TH0pgDbV2LA-y7XrfWIkPZUr3XjzFXlA&oe=66A61DA0'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                "Vincent Benedict B. Barquilla",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//LIKES PAGE
// class MyLikes extends StatefulWidget {
//   const MyLikes({super.key, required this.likedShoes, required this.images});

//   final List<List> likedShoes;
//   final List<String> images;

//   @override
//   State<MyLikes> createState() => _MyLikesState();
// }

// class _MyLikesState extends State<MyLikes> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Row(
//           children: [
//             Image.asset(
//               'assets/nike.png',
//               height: 50,
//             ),
//           ],
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => const MyHomePage()),
//             );
//           },
//         ),
//       ),
//       body: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemCount: widget.likedShoes.length,
//         itemBuilder: (context, index) {
//           return Card(
//             elevation: 2,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Stack(
//                     children: [
//                       Positioned.fill(
//                         child: Image.network(
//                           widget.images[index],
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     widget.likedShoes[index][0],
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Text(
//                     '${widget.likedShoes[index][1]}',
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 3,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
//                   child: Text(
//                     '${widget.likedShoes[index][2]}',
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class MyLikes extends StatefulWidget {
  const MyLikes({super.key, required this.likedShoes});

  final List<ShoeItem> likedShoes;

  @override
  State<MyLikes> createState() => _MyLikesState();
}

class _MyLikesState extends State<MyLikes> {
  void _unlike(ShoeItem shoe) {
    setState(() {
      widget.likedShoes.remove(shoe);
      // Update preferences
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Row(
          children: [
            Image.asset(
              'assets/nike.png', // Make sure to add your Nike logo image to the assets folder
              height: 50,
            ),
            const Text(
              "Liked Item",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Return the list
          },
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: widget.likedShoes.length,
        itemBuilder: (context, index) {
          final shoe = widget.likedShoes[index];
          return Card(
            elevation: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          shoe.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 1,
                        child: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _unlike(shoe),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    shoe.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    shoe.price,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 3),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    shoe.category,
                    style: const TextStyle(fontWeight: FontWeight.bold),
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

class MyAddCart extends StatefulWidget {
  final List<ShoeItem> cartItems;
  const MyAddCart({super.key, required this.cartItems});

  @override
  State<MyAddCart> createState() => _MyAddCartState();
}

class _MyAddCartState extends State<MyAddCart> {
  void _removeFromCart(ShoeItem shoe) {
    setState(() {
      widget.cartItems.remove(shoe);
      // Update preferences
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              'assets/nike.png', // Make sure to add your Nike logo image to the assets folder
              height: 50,
            ),
            const Text(
              "Cart Items",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Return the list
          },
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final shoe = widget.cartItems[index];
          return Card(
            elevation: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          shoe.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 1,
                        child: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _removeFromCart(shoe),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    shoe.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    shoe.price,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 3),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    shoe.category,
                    style: const TextStyle(fontWeight: FontWeight.bold),
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

//ADD TO CART PAGE

// class MyAddCart extends StatelessWidget {
//   const MyAddCart({super.key, required this.cartItems, required this.images});

//   final List<List> cartItems;
//   final List<String> images;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         title: Row(
//           children: [
//             Image.asset(
//               'assets/nike.png',
//               height: 50,
//             ),
//             const Text(
//               "Your Add to Carts",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => const MyHomePage()),
//             );
//           },
//         ),
//       ),
//       body: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemCount: cartItems.length,
//         itemBuilder: (context, index) {
//           return Card(
//             elevation: 2,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Stack(
//                     children: [
//                       Positioned.fill(
//                         child: Image.network(
//                           images[index],
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     cartItems[index][0],
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Text(
//                     '${cartItems[index][1]}',
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 3,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
//                   child: Text(
//                     '${cartItems[index][2]}',
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
