import 'package:flutter/material.dart';
import 'package:indomarturki_app/bloc/category_bloc.dart';
import 'package:indomarturki_app/bloc/product_bloc.dart';
import 'package:indomarturki_app/model/category/list_category_response.dart';
import 'package:indomarturki_app/model/produk/produk_by_category_response.dart';
import 'package:indomarturki_app/model/produk/produk_enitity.dart';
import 'package:indomarturki_app/screen/product/widget/product_list_widget.dart';
import 'package:indomarturki_app/utils/widget/data_notfound_widget.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() {
    return _CategoryPageState();
  }
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    categoryBloc.findAllCategory();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: StreamBuilder<ListCategoryResponse>(
        stream: categoryBloc.listCategory.stream,
        builder: (context, AsyncSnapshot<ListCategoryResponse> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            if (snapshot.hasData) {
              return buildListViewBuilder(snapshot);
            } else {
              return DataNotFound();
            }
          }
        },
      ),
    );
  }

  Container buildListViewBuilder(AsyncSnapshot<ListCategoryResponse> snapshot) {
    return Container(
      child: ListView.builder(
        itemCount: snapshot.data!.data!.rows!.length,
        itemBuilder: (context, index) {
          Rows item = snapshot.data!.data!.rows![index]!;
          return ListTile(
            onTap: () async {
              await producsBloc.findProdukByCategoryId(
                  item.id!, {'page': '0', 'size': '100'});
              List<ProdukEntity> produk = producsBloc.productByCategory.value.data!.map((e) => ProdukEntity.fromJson(e.produk!.toJson())).toList();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductList(
                        produkList: produk,
                        title: item.nama!),
                  ));
            },
            title: Text(item.nama!),
            subtitle: Text(item.nama!),
          );
        },
      ),
    );
  }
}
