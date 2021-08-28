import 'package:flutter/material.dart';
import 'package:indomarturki_app/bloc/product_bloc.dart';
import 'package:indomarturki_app/model/produk/produk_enitity.dart';
import 'package:indomarturki_app/screen/product/widget/product_list_widget.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
  }

  String search = '';

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Container(
          height: 37,
          child: TextFormField(
            onChanged: (value) {
              setState(() {
                search = value;
              });
            },
            onEditingComplete: () {
              findProduk();
            },
            onSaved: (value) {
              findProduk();
            },
            enabled: true,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              hintText: 'Mau Beli apa hari ini?',
              hintStyle: TextStyle(fontSize: 12),
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  findProduk();
                },
              ),
              filled: true,
              fillColor: Colors.white,
              hoverColor: Colors.white,
              focusColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void findProduk() async {
    var param = {"q": search};
    await producsBloc.findProduk(param);
    List<ProdukEntity> produk = producsBloc
        .searchProdukResponse.value.data!.rows!
        .map((e) => ProdukEntity.fromJson(e.toJson()))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductList(produkList: produk, title: search),
        ));
  }
}
