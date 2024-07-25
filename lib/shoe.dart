import 'package:flutter/material.dart';
import 'package:nike_application/shoe_list.dart';
import 'package:nike_application/shoe_detail.dart'; // Import the new detail page

class MyShoeList extends StatefulWidget {
  const MyShoeList({
    super.key,
    required this.shoes,
    required this.onLike,
    required this.onAddToCart,
    required this.likedShoes,
    required this.cartItems,
  });

  final List<ShoeItem> shoes;
  final Function(ShoeItem) onLike;
  final Function(ShoeItem) onAddToCart;
  final List<ShoeItem> likedShoes;
  final List<ShoeItem> cartItems;

  @override
  State<MyShoeList> createState() => _MyShoeListState();
}

class _MyShoeListState extends State<MyShoeList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: widget.shoes.length,
      itemBuilder: (context, index) {
        final shoe = widget.shoes[index];
        bool isLiked = widget.likedShoes.contains(shoe);
        bool isInCart = widget.cartItems.contains(shoe);
        return Card(
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Navigate to the ShoeDetailPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShoeDetailPage(shoe: shoe),
                      ),
                    );
                  },
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
                          icon: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: isLiked ? Colors.red : null,
                          ),
                          onPressed: () => widget.onLike(shoe),
                        ),
                      ),
                      Positioned(
                        top: 25,
                        child: IconButton(
                          icon: Icon(
                            isInCart
                                ? Icons.shopping_cart
                                : Icons.shopping_cart_outlined,
                            color: isInCart ? Colors.blue : null,
                          ),
                          onPressed: () => widget.onAddToCart(shoe),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  shoe.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  shoe.price,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  shoe.category,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[700]),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
            ],
          ),
        );
      },
    );
  }
}
