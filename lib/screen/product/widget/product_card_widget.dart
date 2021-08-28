import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:indomarturki_app/model/home_produk_slide/home_produk_slide_model.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.produkList,
  }) : super(key: key);
  final Products produkList;

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat('.00','tr_TR');
    return Container(
      width: 180,
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
              children: produkList.produk!.photos!.map((item) => new Image.network(item.link!, fit: BoxFit.cover,)).toList(),

              autoPlayInterval: 3000,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/logo.png', width: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Indomarturki',
                    style: TextStyle(fontSize: 10, color: Colors.red),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Text(
                produkList.produk!.nama!,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Text(
                "₺ ${numberFormat.format(produkList.produk!.harga!)}",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.blue.shade800,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Center(
                    child: Text(
                  'Beli',
                  style: TextStyle(fontSize: 14, color: Colors.white),
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
    );
  }

}
