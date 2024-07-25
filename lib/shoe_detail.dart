import 'package:flutter/material.dart';
import 'package:nike_application/shoe_list.dart';

class ShoeDetailPage extends StatefulWidget {
  final ShoeItem shoe;

  const ShoeDetailPage({Key? key, required this.shoe}) : super(key: key);

  @override
  _ShoeDetailPageState createState() => _ShoeDetailPageState();
}

class _ShoeDetailPageState extends State<ShoeDetailPage> {
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.shoe.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.shoe.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              ),
              const SizedBox(height: 20),
              Text(
                widget.shoe.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.shoe.price,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.shoe.category,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Select Size",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8.0,
                children: <Widget>[
                  ...[
                    'US 7',
                    'US 7.5',
                    'US 8',
                    'US 8.5',
                    'US 9',
                    'US 9.5',
                    'US 10',
                    'US 10.5',
                    'US 11',
                    'US 11.5',
                    'US 12',
                    'US 13'
                  ].map((size) {
                    return ChoiceChip(
                      label: Text(size),
                      selected: selectedSize == size,
                      onSelected: (bool selected) {
                        setState(() {
                          selectedSize = selected ? size : null;
                        });
                      },
                    );
                  }),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedSize != null) {
                      // Implement your logic here
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'Added ${widget.shoe.name} of size $selectedSize to the bag!'),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please select a size first!'),
                      ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Text("Add to Bag"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
