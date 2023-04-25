import 'package:coffee_shop_app/components/coffee_tile.dart';
import 'package:coffee_shop_app/components/menu_drawer.dart';
import 'package:coffee_shop_app/const.dart';
import 'package:coffee_shop_app/models/coffee.dart';
import 'package:coffee_shop_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  // ADD ITEM FROM CART 
  void addItemToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
    showDialog(
      context: context,
      builder: (context) { Future.delayed(const Duration(milliseconds: 800), () {
        Navigator.of(context).pop(true);
      });
        return const AlertDialog(
          backgroundColor: Colors.brown,
          title: Text('Successfully added to cart!',
          style: TextStyle(
            color: Colors.white
          ),),
        );
      }
    );
  } 

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.brown),
            backgroundColor: kBackgroundColor,
            elevation: 0,
          ),
          drawer: const MenuDrawer(),
          backgroundColor: kBackgroundColor,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      // HEADING
                      Row(
                        children: const [
                          Image(
                            image: AssetImage('Images/coffee-shop.png'),
                            // width: 45,
                            // height: 45,
                          ),
                          SizedBox(width: 15.0,),
                          Text(
                            'How would you like your coffee?',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.brown,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      // LISTS OF COFFEE
                      Expanded(
                        child: ListView.builder(
                          itemCount: value.getCoffeeLists.length,
                          itemBuilder: (context, index) {
                            // GET EACH COFFEE
                            Coffee eachCoffee = value.getCoffeeLists[index];

                            // COFFEE LIST TILES
                            return CoffeeListTile(
                              coffee: eachCoffee,
                              icon: const Icon(
                                Icons.add,
                                color: Colors.brown,
                              ),
                              onPressed: () => addItemToCart(eachCoffee),
                            );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
