import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:indomarturki_app/model/home_produk_slide/home_produk_slide_model.dart'
    as product;
import 'package:indomarturki_app/model/produk/produk_by_category_response.dart';
import 'package:indomarturki_app/model/produk/produk_enitity.dart';
import 'package:indomarturki_app/screen/product/product_page.dart';
import 'package:intl/intl.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key, required this.produkList, required this.title})
      : super(key: key);

  final List<ProdukEntity?> produkList;
  final String title;

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat('.00', 'tr_TR');
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: produkList.length == 0 ? Center(child: Text('Produk ${title} tidak tersedia'),):Container(
          height: 240,
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: produkList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              var item = produkList[index];
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductPage(product: item),
                        ));
                  },
                  child: Container(
                    width: 280,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageSlideshow(
                            width: double.infinity,
                            height: 90,
                            initialPage: 0,
                            isLoop: true,
                            indicatorColor: Colors.blue,
                            indicatorBackgroundColor: Colors.grey,
                            children: produkList[index]!
                                .photos!
                                .map((item) => new Image.network(
                                      item.link!,
                                      fit: BoxFit.cover,
                                    ))
                                .toList(),
                            autoPlayInterval: 3000,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/logo.png',
                                  width: 30,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Indomarturki',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            child: Text(
                              produkList[index]!.nama!,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            child: Text(
                              "₺ ${numberFormat.format(produkList[index]!.harga!)}",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade800,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Center(
                                  child: Text(
                                'Beli',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                                textAlign: TextAlign.start,
                              )),
                            ),
                          )
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                    ),
                  ));
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
          ),
        ),
      ),
    );
  }
}
