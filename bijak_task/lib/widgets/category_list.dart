import 'package:bijak_task/widgets/categoryItem.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  CategoryList({super.key});

  // Example list of fruit categories with images (replace with your data)
  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Apples',
      'image':
          'https://img.freepik.com/premium-vector/apple-fruit-mascot-design-character-isolated-white-background_508290-1289.jpg'
    },
    {
      'name': 'Bananas',
      'image':
          'https://www.shutterstock.com/image-photo/bunch-bananas-isolated-on-white-600nw-1722111529.jpg'
    },
    {
      'name': 'Oranges',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Orange-Fruit-Pieces.jpg/1200px-Orange-Fruit-Pieces.jpg'
    },
    {
      'name': 'Grapes',
      'image':
          'https://img.freepik.com/free-psd/grape-fruits-isolated-transparent-background_191095-14703.jpg?size=338&ext=jpg&ga=GA1.1.1546980028.1719619200&semt=sph'
    },
    {
      'name': 'Berries',
      'image':
          'https://media.istockphoto.com/id/182187173/photo/isolated-berries.jpg?s=612x612&w=0&k=20&c=iBBvIdL39XuHATGIlNkKn6nAHfE_BTWkHiOs49IWlFU='
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(),
          child: Text(
            'Fruit Categories',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((category) {
              return CategoryItem(
                name: category['name'],
                image: category['image'],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
