import 'package:coffee_shop_app/models/coffee.dart';
import 'package:flutter/foundation.dart';

class CoffeeShop extends ChangeNotifier {

  // COFFEE LISTS
  final List<Coffee> _coffeeLists = [
    Coffee(name: 'Espresso', price: "4.30", imgPath: 'images/espresso.png'),
    Coffee(name: 'Latte', price: "4.00", imgPath: 'images/latte.png'),
    Coffee(name: 'Ice Coffee', price: "5.00", imgPath: 'images/ice-coffee.png'),
    Coffee(name: 'Bubble Tea', price: "4.60", imgPath: 'images/bubble-tea.png')
  ];


  // USER CART
  final List<Coffee> _userCart = [];


  // GET COFFEE LISTS
  List<Coffee> get getCoffeeLists => _coffeeLists;

  // GET USER CART
  List<Coffee> get getUserCart => _userCart;


  // ADD ITEM TO CART
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  } 

  // REMOVE ITEM FROM CART 
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  } 
}