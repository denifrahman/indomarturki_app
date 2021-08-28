import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:indomarturki_app/bloc/cart_bloc.dart';
import 'package:indomarturki_app/model/cart/cart_response.dart';
import 'package:indomarturki_app/screen/cart/cart_page.dart';

class WidgetIconCart extends StatelessWidget {
  const WidgetIconCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<CartResponse>(
          stream: cartBloc.cart.stream,
          builder: (context, AsyncSnapshot<CartResponse> snapshot) {
            if (!snapshot.hasData) {
              return Badge(
                badgeColor: Colors.grey,
                badgeContent: Text(
                  '0',
                  style: TextStyle(color: Colors.white),
                ),
                position: BadgePosition(top: 0, end: 1),
                child: IconButton(
                    icon: Icon(
                      Icons.shopping_basket,
                      size: 20,
                      color: Colors.blueAccent.shade700,
                    ),
                    onPressed: null),
              );
            } else {
              if (snapshot.data!.data == null) {
                return Badge(
                  badgeColor: Colors.grey,
                  badgeContent: Text(
                    '0',
                    style: TextStyle(color: Colors.white),
                  ),
                  position: BadgePosition(top: 0, end: 1),
                  child: IconButton(
                      icon: Icon(
                        Icons.shopping_basket,
                        size: 20,
                        color: Colors.grey,
                      ),
                      onPressed: null),
                );
              } else {
                return Badge(
                  badgeColor: Colors.red,
                  badgeContent: Text(
                    snapshot.data!.data!.count!.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  position: BadgePosition(top: 0, end: 1),
                  child: IconButton(
                      icon: Icon(
                        Icons.shopping_basket,
                        size: 20,
                        color: Colors.blue.shade700,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartPage(),
                            ));
                      }),
                );
              }
            }
          }),
    );
  }
}
