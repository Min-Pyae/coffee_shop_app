import 'package:coffee_shop_app/const.dart';
import 'package:coffee_shop_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  image: AssetImage('Images/coffee-shop.png'),
                  fit: BoxFit.contain,
                  width: 100,
                  height: 100,
              ),

              const SizedBox(
                height: 30,
              ),

              const Text(
                  'Chris\'s Coffee Shop',
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              const Text(
                'How do you like your coffee?',
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 18.0
                ),
              ),

              const SizedBox(
                height: 50,
              ),

              // LOGIN BUTTON
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 75,
                        vertical: 25
                    )
                ),
                child: const Text(
                  'Enter Shop',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
