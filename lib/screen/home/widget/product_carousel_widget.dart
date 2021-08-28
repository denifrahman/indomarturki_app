import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indomarturki_app/model/home_produk_slide/home_produk_slide_model.dart';
import 'package:indomarturki_app/model/produk/produk_enitity.dart';
import 'package:indomarturki_app/screen/product/product_page.dart';
import 'package:indomarturki_app/screen/product/widget/product_card_widget.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel(
      {Key? key, required this.produkList, required this.title})
      : super(key: key);

  final List<Products?> produkList;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: GoogleFonts.acme(fontSize: 18)),
              Icon(Icons.arrow_right)
            ],
          ),
          Container(
            height: 240,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: produkList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      ProdukEntity produkEntity =
                          new ProdukEntity.fromJson(produkList[index]!.produk!.toJson());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductPage(
                              product: produkEntity,
                            ),
                          ));
                    },
                    child: ProductCard(produkList: produkList[index]!));
              },
            ),
          ),
        ],
      ),
    );
  }
}
