import 'package:flutter/material.dart';
import 'random_number.dart';

class MyContainer extends StatelessWidget {
  final Color color;
  final String title;
  final String description;
  final double value;
  final String imageUrl;

  const MyContainer({
    Key? key,
    required this.color,
    required this.title,
    required this.description,
    required this.value,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddCodePage()),
        );
      },
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Image.network(
                imageUrl,
                height: 80,
                width: 80,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Text(
                      description,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Spacer(),
                  Slider(
                    value: value,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return random();
  }
}
