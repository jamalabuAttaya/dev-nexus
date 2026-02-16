import 'package:flutter/material.dart';
import '../../data/models/course_model.dart';

class CourseCard extends StatelessWidget {
  final CourseModel item;

  const CourseCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: const EdgeInsets.only(bottom: 16), 
      child: Card(
        elevation: 3, 
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), 
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: item.thumbnail.isNotEmpty
                  ? Image.network(
                      item.thumbnail,
                      height: 160,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 160,
                        color: Colors.grey[200],
                        child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                      ),
                    )
                  : Container(
                      height: 160,
                      color: Colors.grey[200],
                      child: const Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                    ),
            ),
            
            
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF2C3E50),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}