import 'package:flutter/material.dart';

import '../models/coffee.dart';

class CoffeeListTile extends StatelessWidget {
  final Coffee coffee;
  final Icon icon;
  final void Function()? onPressed;
  const CoffeeListTile({super.key, required this.coffee, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 16.0
        ),
        child: ListTile(
          title: Text(
            coffee.name,
            style: const TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w600
            ),
          ),
          subtitle: Text(
              "\$${coffee.price}",
            style: const TextStyle(
                color: Colors.brown
            ),
          ),
          leading: Image.asset(coffee.imgPath),
          trailing: IconButton(
            icon: icon,
            onPressed: onPressed
          )
        ),
      ),
    );
  }
}