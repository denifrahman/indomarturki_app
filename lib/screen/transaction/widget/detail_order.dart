import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indomarturki_app/bloc/auth_bloc.dart';
import 'package:indomarturki_app/bloc/cart_bloc.dart';
import 'package:indomarturki_app/model/cart/cart_response.dart';
import 'package:indomarturki_app/model/order/order_by_user_id_response.dart'
    as OrderList;
import 'package:intl/intl.dart';

class DetailOrder extends StatefulWidget {
  DetailOrder({Key? key, required this.item, required this.total, required this.diskon}) : super(key: key);
  final List<OrderList.OrderDetails>? item;
  final total;
  final diskon;

  @override
  _DetailOrderState createState() {
    return _DetailOrderState();
  }
}

class _DetailOrderState extends State<DetailOrder> {
  var f = NumberFormat(".00", "tr_TR");

  @override
  void initState() {
    if (authBloc.session.stream.hasValue) {
      cartBloc.findCartByUserId(
          authBloc.session.stream.value['data']['id'].toString());
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int total = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: widget.item!.length,
        itemBuilder: (context, index) {
          var item = widget.item![index];
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
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.minus_circle,
                            color: Colors.grey)),
                    Text(item.qty!.toString()),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.add_circled,
                          color: Colors.grey,
                        )),
                  ],
                ),
              ),
            ),
          );
        },
      )),
      bottomSheet: Material(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.all(10),
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Diskon', style: TextStyle(fontSize: 16),),
                  Text('₺ '+widget.diskon.toString(), style: TextStyle(fontSize: 16, color: Colors.red))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  Text('₺ '+widget.total.toString(), style: TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold))
                ],
              ),
            ],
          ),
        ),
      ),
    );
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
}
