import 'package:coffee_shop_app/components/coffee_tile.dart';
import 'package:coffee_shop_app/const.dart';
import 'package:coffee_shop_app/models/coffee.dart';
import 'package:coffee_shop_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  // REMOVE ITEM FROM CART 
  void removeItemFromCart(Coffee coffee) => Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);


  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: kBackgroundColor,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      // HEADING
                      const Text(
                        'Your Cart',
                        style: TextStyle(fontSize: 20.0),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      // LISTS OF COFFEE
                      Expanded(
                        child: ListView.builder(
                          itemCount: value.getUserCart.length,
                          itemBuilder: (context, index) {
                            // GET EACH COFFEE
                            Coffee eachCoffee = value.getUserCart[index];

                            // COFFEE LIST TILES
                            return CoffeeListTile(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.brown,
                              ),
                              coffee: eachCoffee,
                              onPressed: () => removeItemFromCart(eachCoffee),
                            );
                        }),
                      ),

                      // PAY BUTTON
                      ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 35,
                            vertical: 25
                          )
                        ), 
                        child: const Text(
                            'Pay Now',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
