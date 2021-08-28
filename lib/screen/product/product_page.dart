import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:indomarturki_app/bloc/auth_bloc.dart';
import 'package:indomarturki_app/bloc/cart_bloc.dart';
import 'package:indomarturki_app/model/cart/cart_request.dart';
import 'package:indomarturki_app/model/home_produk_slide/home_produk_slide_model.dart';
import 'package:indomarturki_app/model/produk/produk_enitity.dart';
import 'package:indomarturki_app/screen/auth/register_page.dart';
import 'package:indomarturki_app/utils/widget/widgte_icon_cart.dart';
import 'package:intl/intl.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key? key, this.product}) : super(key: key);
  final ProdukEntity? product;

  @override
  _ProductPageState createState() {
    return _ProductPageState();
  }
}

class _ProductPageState extends State<ProductPage> {
  var f = NumberFormat('.00', 'tr_TR');

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
    print(widget.product!.toJson());
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product!.nama!),
          actions: [
            WidgetIconCart()
          ]
      ),
      body: SafeArea(
        child: Column(
          children: [
            ImageSlideshow(
              width: double.infinity,
              height: 200,
              isLoop: true,
              initialPage: 0,
              indicatorColor: Colors.blue,
              indicatorBackgroundColor: Colors.grey,
              children: widget.product!.photos!.map((e) {
                return Image.network(
                  e.link!,
                  fit: BoxFit.cover,
                );
              }).toList(),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product!.nama!,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'assets/logo.png',
                      width: 50,
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "₺ ${f.format(widget.product!.harga)}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Deskirpsi',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Divider(),
                            Html(
                              data: widget.product!.keterangan!,
                            )
                            // Text(parse(widget.product!.produk!.keterangan!).outerHtml)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<GoogleSignInAccount?>(
            stream: authBloc.currentUser.stream,
            builder: (context, AsyncSnapshot<GoogleSignInAccount?> snapshot) {
              authBloc.googleSignIn.isSignedIn().then((value) => print(value));
              return MaterialButton(
                onPressed: () async {
                  if (authBloc.googleSignIn.currentUser == null) {
                    bool? result = await authBloc.handleSign();
                    if (!result!) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          )).then((value) {
                        cartBloc.findCartByUserId(authBloc
                            .session.stream.value['data']['id']
                            .toString());
                      });
                    }else{
                      cartBloc.findCartByUserId(authBloc
                          .session.stream.value['data']['id']
                          .toString());
                    }
                  } else {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        int _qty = 1;
                        return StatefulBuilder(
                            builder: (BuildContext context, setState) {
                          return Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10))),
                            height: 120,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Masukkan Jumlah Pembelian'),
                                        Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  if (_qty > 1) {
                                                    setState(() {
                                                      _qty = _qty - 1;
                                                    });
                                                  }
                                                },
                                                icon: Icon(
                                                    CupertinoIcons.minus_circle,
                                                    color: Colors.red)),
                                            Text(_qty.toString()),
                                            IconButton(
                                                onPressed: () {
                                                  if (_qty >= 1) {
                                                    setState(() {
                                                      _qty = _qty + 1;
                                                    });
                                                  }
                                                },
                                                icon: Icon(
                                                  CupertinoIcons.add_circled,
                                                  color: Colors.green,
                                                )),
                                          ],
                                        ),
                                      ]),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: MaterialButton(
                                      onPressed: () async {
                                        CartRequest cart =
                                            CartRequest.fromJson({
                                          "name": widget.product!.nama,
                                          "harga":
                                              widget.product!.harga,
                                          "qty": _qty,
                                          "total":
                                              (widget.product!.harga! *
                                                  _qty),
                                          "userId": authBloc.session.stream
                                              .value['data']['id'],
                                          "produkId": widget.product!.id
                                        });
                                        await cartBloc.addTocart(cart, context);
                                        await cartBloc.findCartByUserId(authBloc
                                            .session.stream.value['data']['id']
                                            .toString());
                                      },
                                      color: Colors.blue.shade800,
                                      child: Text(
                                        'Tambah Keranjang',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                      },
                    );
                  }
                },
                color: Colors.blue.shade700,
                // ignore: unnecessary_null_comparison
                child: Text(
                  authBloc.googleSignIn.currentUser == null
                      ? 'Login Untuk Beli'
                      : "Tambah Keranjang",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }),
      ),
    );
  }
}
