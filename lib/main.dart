import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Food App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ItemListScreen(),
    );
  }
}

class Item {
  final String name;
  final String imageUrl;
  final String description;
  final double price;
  final double rating;
  final int stock;

  Item({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.rating,
    required this.stock,
  });
}

class ItemListScreen extends StatelessWidget {
  final List<Item> items = [
    Item(
      name: 'Burger',
      imageUrl: 'https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      description: 'A delicious beef burger with lettuce, tomato, and cheese.',
      price: 5.99,
      rating: 4.5,
      stock: 20,
    ),
    Item(
      name: 'Pizza',
      imageUrl: 'https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg',
      description: 'Cheesy pizza with pepperoni and a crispy crust.',
      price: 8.99,
      rating: 4.7,
      stock: 15,
    ),
    Item(
      name: 'Fries',
      imageUrl: 'https://images.pexels.com/photos/1583884/pexels-photo-1583884.jpeg',
      description: 'Crispy golden french fries with a side of ketchup.',
      price: 2.99,
      rating: 4.3,
      stock: 30,
    ),
    Item(
      name: 'Hot Dog',
      imageUrl: 'https://images.pexels.com/photos/357746/pexels-photo-357746.jpeg',
      description: 'Juicy hot dog with mustard, ketchup, and onions.',
      price: 3.99,
      rating: 4.4,
      stock: 25,
    ),
    Item(
      name: 'Ice Cream',
      imageUrl: 'https://images.pexels.com/photos/1352245/pexels-photo-1352245.jpeg?auto=compress&cs=tinysrgb&w=400',
      description: 'Creamy vanilla ice cream with chocolate sauce.',
      price: 1.99,
      rating: 4.8,
      stock: 40,
    ),
    Item(
      name: 'Milkshake',
      imageUrl: 'https://images.pexels.com/photos/103566/pexels-photo-103566.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      description: 'Thick and creamy chocolate milkshake.',
      price: 4.99,
      rating: 4.6,
      stock: 20,
    ),
    Item(
      name: 'Fried Chicken',
      imageUrl: 'https://images.pexels.com/photos/1352270/pexels-photo-1352270.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      description: 'Crispy fried chicken with a side of coleslaw.',
      price: 7.99,
      rating: 4.5,
      stock: 18,
    ),
    Item(
      name: 'Tacos',
      imageUrl: 'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg',
      description: 'Spicy beef tacos with lettuce, cheese, and salsa.',
      price: 3.99,
      rating: 4.7,
      stock: 22,
    ),
    Item(
      name: 'Salad',
      imageUrl: 'https://images.pexels.com/photos/1213710/pexels-photo-1213710.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      description: 'Fresh garden salad with a variety of vegetables.',
      price: 5.49,
      rating: 4.2,
      stock: 28,
    ),
    Item(
      name: 'Sandwich',
      imageUrl: 'https://images.pexels.com/photos/4491395/pexels-photo-4491395.jpeg?auto=compress&cs=tinysrgb&w=400',
      description: 'Ham and cheese sandwich with lettuce and tomato.',
      price: 4.49,
      rating: 4.4,
      stock: 25,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fast Food Menu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemDetailScreen(item: items[index])),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(items[index].imageUrl),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        items[index].name,
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '\$${items[index].price.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Rating: ${items[index].rating}',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: Text(
                        'Stock: ${items[index].stock}',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ItemDetailScreen extends StatefulWidget {
  final Item item;

  ItemDetailScreen({required this.item});

  @override
  _ItemDetailScreenState createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  String _status = "Inactive";
  int _quantity = 1;

  void _toggleStatus() {
    setState(() {
      _status = _status == "Inactive" ? "Active" : "Inactive";
    });
  }

  void _addToCart() {
    // Handle adding to cart logic
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Added ${widget.item.name} to cart!'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.item.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.name,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.item.description,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Price: \$${widget.item.price.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Rating: ${widget.item.rating}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Stock: ${widget.item.stock}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Status: $_status',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _toggleStatus,
                    child: Text('Toggle Status'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Quantity:',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 10),
                  DropdownButton<int>(
                    value: _quantity,
                    items: List.generate(10, (index) => index + 1)
                        .map((e) => DropdownMenuItem<int>(
                              value: e,
                              child: Text(e.toString()),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _quantity = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _addToCart,
                  child: Text('Add to Cart'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
