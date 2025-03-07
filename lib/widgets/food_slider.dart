import 'package:flutter/material.dart';

class food extends StatelessWidget {
  const food({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: 300,
                height: 300,
                color: Colors.red,
              ),
              Container(
                width: 300,
                height: 300,
                color: Colors.yellow,
              ),
              Container(
                width: 300,
                height: 300,
                color: Colors.green,
              ),
            ],
          )
        ],
      ),
    );
  }
}
