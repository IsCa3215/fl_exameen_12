import 'package:flutter/material.dart';

class SwiperFoodLabel extends StatelessWidget {
  final String day;
  final String? label;

  const SwiperFoodLabel({
    super.key,
    required this.day,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF00B894).withAlpha((0.1 * 255).toInt()),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.05 * 255).toInt()),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    day,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00B894),
                    ),
                  ),
                  if (label != null)
                    Text(
                      label!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                ],
              ),
              const Icon(
                Icons.calendar_today,
                color: Color(0xFF00B894),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
