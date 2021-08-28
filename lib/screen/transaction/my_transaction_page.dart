import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:indomarturki_app/bloc/auth_bloc.dart';
import 'package:indomarturki_app/bloc/checkout_bloc.dart';
import 'package:indomarturki_app/model/order/order_by_user_id_response.dart';
import 'package:indomarturki_app/screen/auth/register_page.dart';
import 'package:indomarturki_app/screen/transaction/widget/detail_order.dart';
import 'package:indomarturki_app/utils/widget/data_notfound_widget.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class MyTransaction extends StatefulWidget {
  MyTransaction({Key? key}) : super(key: key);

  @override
  _MyTransactionState createState() {
    return _MyTransactionState();
  }
}

class _MyTransactionState extends State<MyTransaction> {
  var f = NumberFormat("", "tr_TR");
  var d = DateFormat("dd/MM/yyyy");

  @override
  void initState() {
    if (authBloc.session.stream.value['data'] != null) {
      checkoutBloc
          .findOrderByUserId(authBloc.session.stream.value['data']['id']);
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GoogleSignInAccount?>(
        stream: authBloc.currentUser.stream,
        builder: (context, AsyncSnapshot<GoogleSignInAccount?> snapshot) {
          if (authBloc.googleSignIn.currentUser == null) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Masuk'),
              ),
              body: Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/logo.png',
                        width: 200,
                      ),
                      SizedBox(height: 50),
                      _signInButton(),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('My Transaction'),
              ),
              body: SafeArea(
                child: StreamBuilder<OrderByUserIdResponse>(
                  stream: checkoutBloc.orderUserResponse.stream,
                  builder: (context, AsyncSnapshot<OrderByUserIdResponse> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.data != null) {
                        return ListView.builder(
                          itemCount: snapshot.data!.data!.length,
                          itemBuilder: (context, index) {
                            var item = snapshot.data!.data![index];
                            return ListTile(
                              onTap: (){
                                print(item.orderDetails);
                                Navigator.push(context, CupertinoPageRoute(builder: (context) => DetailOrder(item:item.orderDetails,total: item.orderTotal, diskon:item.orderDiskon),));
                              },
                                title: Text("${item.orderNumber.toString()}"),
                                subtitle: Row(
                                  children: [
                                    Text(
                                      "₺ ${f.format(item.orderTotal)}",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        "${d.format(DateTime.parse(item.createdAt!))}"),
                                  ],
                                ),
                                trailing: InkWell(
                                  onTap: () async {
                                    var text = "${authBloc.session.stream.value['data']['nama']}\n\nOrder List :\n${item.orderDetails!.map((e) => e.name.toString() +" qty " + e.qty.toString() + ' * ₺' + e.harga.toString() +" = ₺"+ e.total.toString()).join('\n')} \n\n\nDiskon ₺ ${item.orderDiskon.toString()} \nTotal ₺ ${item.orderTotal.toString()}";
                                    final link = WhatsAppUnilink(
                                      phoneNumber: '+905522599888',
                                      text: text,
                                    );
                                    await launch('$link');
                                  },
                                  child: Column(
                                    children: [
                                      Icon(CupertinoIcons.phone_circle, color:Colors.green),
                                      Text('Send Wa')
                                    ],
                                  ),
                                ));
                          },
                        );
                      } else {
                        return DataNotFound();
                      }
                    } else {
                      return DataNotFound();
                    }
                  },
                ),
              ),
            );
          }
        });

  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () async {
        bool? result = await authBloc.handleSign();
        if (!result!) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterPage(),
              ));
        }
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/google_logo.png", height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
