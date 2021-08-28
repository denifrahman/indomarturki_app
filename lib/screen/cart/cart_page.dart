import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indomarturki_app/bloc/auth_bloc.dart';
import 'package:indomarturki_app/bloc/cart_bloc.dart';
import 'package:indomarturki_app/model/cart/cart_request.dart';
import 'package:indomarturki_app/model/cart/cart_response.dart';
import 'package:indomarturki_app/model/kupon/kupon_response.dart' as kupon;
import 'package:indomarturki_app/screen/checkout/checkout_page.dart';
import 'package:intl/intl.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() {
    return _CartPageState();
  }
}

class _CartPageState extends State<CartPage> {
  var f = NumberFormat(".00", "tr_TR");

  kupon.KuponResponse kuponResponse = new kupon.KuponResponse();

  @override
  void initState() {
    authBloc.getSession();
    cartBloc.kupon.sink.add(kuponResponse);
    authBloc.kodeKupon.text = "";
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int total = 0;
    return StreamBuilder<CartResponse>(
        stream: cartBloc.cart.stream,
        builder: (context, AsyncSnapshot<CartResponse> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Cart'),
              ),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Scaffold(
                appBar: AppBar(
                  title: Text('Cart'),
                ),
                body: SafeArea(
                    child: ListView.builder(
                  itemCount: snapshot.data!.data!.rows!.length,
                  itemBuilder: (context, index) {
                    var item = snapshot.data!.data!.rows![index];
                    total += 100;
                    return ListTile(
                      title: Text(item.name!),
                      subtitle: Text("₺ ${f.format(item.harga!)}"),
                      trailing: Container(
                        child: Container(
                          width: 110,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    if (item.qty! > 1) {
                                      CartRequest body =
                                          new CartRequest.fromJson({
                                        "name": item.name,
                                        "harga": item.harga,
                                        "qty": (item.qty! - 1),
                                        "total":
                                            (item.harga! * (item.qty! - 1)),
                                        "userId": item.userId,
                                        "produkId": item.produkId
                                      });
                                      cartBloc.updateCart(item.id!, body);
                                    } else {
                                      cartBloc.removeCart(item.id!);
                                    }
                                  },
                                  icon: Icon(CupertinoIcons.minus_circle,
                                      color: Colors.red)),
                              Text(item.qty!.toString()),
                              IconButton(
                                  onPressed: () {
                                    if (item.qty! >= 1) {
                                      CartRequest body =
                                          new CartRequest.fromJson({
                                        "name": item.name,
                                        "harga": item.harga,
                                        "qty": (item.qty! + 1),
                                        "total":
                                            (item.harga! * (item.qty! + 1)),
                                        "userId": item.userId,
                                        "produkId": item.produkId
                                      });
                                      cartBloc.updateCart(item.id!, body);
                                    }
                                  },
                                  icon: Icon(
                                    CupertinoIcons.add_circled,
                                    color: Colors.green,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )),
                bottomSheet: Material(
                  elevation: 4,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 200,
                              child: TextFormField(
                                maxLines: 1,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.label),
                                  hintText: 'Masukkan kode kupon',
                                  labelText: 'Kode kupon',
                                ),
                                validator: (String? value) {
                                  return (value!.length < 1)
                                      ? 'Isikan alamat pengiriman'
                                      : null;
                                },
                                controller: authBloc.kodeKupon,
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                cartBloc.applyKupon(authBloc.kodeKupon.text);
                              },
                              child: Text(
                                'Apply Kode',
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.blue,
                            )
                          ],
                        ),
                        StreamBuilder<kupon.KuponResponse>(
                            stream: cartBloc.kupon.stream,
                            builder: (context,
                                AsyncSnapshot<kupon.KuponResponse> data) {
                              double diskon = 0;
                              if (data.hasData) {
                                if (data.data!.data != null) {
                                  diskon = hitungDiskon(snapshot.data!.data!);
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Diskon',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                            "${cartBloc.kupon.stream.value.data!.diskon}%",
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      buildBottom(snapshot, diskon)
                                    ],
                                  );
                                } else {
                                  return buildBottom(snapshot, diskon);
                                }
                              } else {
                                return buildBottom(snapshot, diskon);
                              }
                            }),
                      ],
                    ),
                  ),
                ));
          }
        });
  }

  totalHarga(Data cart) {
    double total = 0;
    cart.rows!.forEach((item) => total += item.total!);
    return total;
  }

  hitungDiskon(Data cart) {
    double diskon = 0;
    cart.rows!.forEach((item) => diskon += item.total! *
        cartBloc.kupon.stream.value.data!.diskon!.toDouble() /
        100);
    return diskon;
  }

  Widget buildBottom(snapshot, double diskon) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(
              "₺ ${f.format(totalHarga(snapshot.data!.data!) - diskon)}",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: MaterialButton(
            color: Colors.blue.shade800,
            disabledColor: Colors.blue.shade200,
            onPressed: cartBloc.cart.stream.value.data!.rows!.isEmpty
                ? null
                : () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Checkout(),
                        ));
                  },
            child: Text(
              'Checkout',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
