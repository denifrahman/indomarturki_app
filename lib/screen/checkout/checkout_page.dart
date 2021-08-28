import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:indomarturki_app/bloc/auth_bloc.dart';
import 'package:indomarturki_app/bloc/cart_bloc.dart';
import 'package:indomarturki_app/bloc/checkout_bloc.dart';
import 'package:indomarturki_app/model/cart/cart_response.dart';
import 'package:indomarturki_app/model/kupon/kupon_response.dart' as kupon;
import 'package:indomarturki_app/model/order/order_request.dart';
import 'package:intl/intl.dart';

class Checkout extends StatefulWidget {
  Checkout({Key? key}) : super(key: key);

  @override
  _CheckoutState createState() {
    return _CheckoutState();
  }
}

class _CheckoutState extends State<Checkout> {
  GlobalKey<FormState> _formKey = GlobalKey();
  var f = NumberFormat(".00", "tr_TR");

  @override
  void initState() {
    authBloc.getSession();
    
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                title: Text('Checkout'),
              ),
              body: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  onWillPop: _onWillPop,
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: 'Isikan nama penerima',
                            labelText: 'Nama Penerima *',
                          ),
                          validator: (String? value) {
                            return (value!.length < 1)
                                ? 'Silahkan isi nama penerima'
                                : null;
                          },
                          controller: authBloc.nama,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: const InputDecoration(
                            icon: Icon(CupertinoIcons.phone_circle_fill),
                            hintText: 'Isikan no telpon penerima / whatsapp',
                            labelText: 'Phone / Whatsapp *',
                          ),
                          validator: (String? value) {
                            return (value!.length < 1)
                                ? 'Isikan no telpon penerima / whatsapp'
                                : null;
                          },
                          controller: authBloc.noTelp,
                        ),
                        TextFormField(
                          maxLines: 3,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.location_on),
                            hintText: 'Isikan alamat pengiriman',
                            labelText: 'Alamat pengiriman *',
                          ),
                          validator: (String? value) {
                            return (value!.length < 1)
                                ? 'Isikan alamat pengiriman'
                                : null;
                          },
                          controller: authBloc.alamat,
                        )
                      ],
                    ),
                  ),
                ),
              )),
              bottomSheet: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Column(
                  children: [
                    StreamBuilder<kupon.KuponResponse>(
                        stream: cartBloc.kupon.stream,
                        builder:
                            (context, AsyncSnapshot<kupon.KuponResponse> data) {
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
            );
          }
        });
  }

  Future<bool> _onWillPop() async {
    // if (currentTab == 0) {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: Text('Anda yakin!'),
            content: Text('ingin keluar dari halaman checkout ?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () async {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  int totalHarga(Data cart) {
    int count = 0;
    cart.rows!.forEach((item) => count += item.total!);
    return count;
  }

  hitungDiskon(Data cart) {
    double diskon = 0;
    cart.rows!.forEach((item) => diskon += item.total! *
        cartBloc.kupon.stream.value.data!.diskon!.toDouble() /
        100);
    return diskon;
  }

  listOrderDetail(Data cart) {
    var data = [];
    cartBloc.cart.stream.value.data!.rows!.forEach((element) {
      data.add(element.toJson());
    });
    return data;
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
            onPressed: () {
              final FormState form = _formKey.currentState!;
              if (_formKey.currentState!.validate()) {
                int persenDikon = 0;
                var total = (totalHarga(cartBloc.cart.stream.value.data!));
                print(diskon);
                var orderNumber = new DateTime.now();
                OrderRequest orderRequest = new OrderRequest.fromJson({
                  "orderNumber": "ORDER${orderNumber.millisecondsSinceEpoch}",
                  "orderTotal": totalHarga(cartBloc.cart.stream.value.data!) - diskon,
                  "orderDiskon": diskon,
                  "orderTotalDiskon": 0,
                  "userId": authBloc.session.stream.value['data']['id'],
                  "orderUserALamat": authBloc.alamat.text,
                  "orderUserTelp": authBloc.noTelp.text,
                  "orderDetails":
                      listOrderDetail(cartBloc.cart.stream.value.data!)
                });
                checkoutBloc.order(orderRequest, context);
              }
            },
            child: Text(
              'Order Now',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
