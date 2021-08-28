import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:indomarturki_app/bloc/auth_bloc.dart';
import 'package:indomarturki_app/bloc/cart_bloc.dart';
import 'package:indomarturki_app/model/home_produk_slide/home_produk_slide_model.dart';
import 'package:indomarturki_app/screen/home/widget/product_carousel_widget.dart';
import 'package:indomarturki_app/screen/search/search_page.dart';
import 'package:indomarturki_app/utils/widget/widgte_icon_cart.dart';

import '../../bloc/home_bloc.dart';

// Uncomment if you use injector package.
// import 'package:my_app/framework/di/injector.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  CarouselController buttonCarouselController = CarouselController();
  int _current = 0;

  @override
  void initState() {
    authBloc.getSession();
    homeBloc.findProdukSlide();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final List<String> imgList = [
    'https://www.indomarturki.com/wp-content/uploads/2021/06/Poster-Open-Again-web.png',
    'https://www.indomarturki.com/wp-content/uploads/2021/06/Poster-Belanja-Super-Hemat-web.png',
    'https://www.indomarturki.com/wp-content/uploads/2021/06/Poster-Promo-web.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Container(
          height: 37,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ));
            },
            child: TextFormField(
              enabled: false,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 90,
                  ),
                  // child: Text(
                  //   'OrderPlizz',
                  //   style: GoogleFonts.adventPro(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.red),
                  // ),
                ),
                // isDense: true,
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                hintStyle: TextStyle(fontSize: 12),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.blueAccent.shade100,
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
                disabledBorder: OutlineInputBorder(
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
        actions: [WidgetIconCart()],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Material(
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: MediaQuery.of(context).size.width,
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        maxLines: 1,
                        softWrap: true,
                        text: TextSpan(
                          text: 'Selamat datang dan berbelanja',
                          style: DefaultTextStyle.of(context).style,
                          children: const <TextSpan>[
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_right,
                          size: 20,
                          color: Colors.blueAccent.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              StreamBuilder<HomeProdukSlideModel>(
                  stream: homeBloc.homeProdukSlde.stream,
                  builder:
                      (context, AsyncSnapshot<HomeProdukSlideModel> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        // child: CircularProgressIndicator(),
                      );
                    } else {
                      return Column(
                        children: [
                          CarouselSlider(
                            items: snapshot.data!.data!.banner!
                                .map((item) => Container(
                                      child: Center(
                                          child: Image.network(item.link!,
                                              fit: BoxFit.cover, width: 1000)),
                                    ))
                                .toList(),
                            carouselController: buttonCarouselController,
                            options: CarouselOptions(
                                autoPlay: true,
                                height: 160,
                                pageSnapping: true,
                                enlargeCenterPage: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                }),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: snapshot.data!.data!.banner!
                                .asMap()
                                .entries
                                .map((entry) {
                              return GestureDetector(
                                onTap: () => buttonCarouselController
                                    .animateToPage(entry.key),
                                child: Container(
                                  width: 6.0,
                                  height: 6.0,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.black)
                                          .withOpacity(_current == entry.key
                                              ? 0.9
                                              : 0.4)),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    }
                  }),

              // buildCategoryHorizontal(context),
              StreamBuilder<HomeProdukSlideModel>(
                  stream: homeBloc.homeProdukSlde.stream,
                  builder:
                      (context, AsyncSnapshot<HomeProdukSlideModel> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.data!.category!.rows!.length,
                        itemBuilder: (context, index) {
                          var item =
                              snapshot.data!.data!.category!.rows![index];
                          return ProductCarousel(
                            produkList: item.products!,
                            title: item.nama!,
                          );
                        },
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

// Widget buildCategoryHorizontal(BuildContext context) {
//   return StreamBuilder<ListCategoryResponse>(
//       stream: categoryBloc.listCategory.stream,
//       builder: (context, AsyncSnapshot<ListCategoryResponse> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Container(
//             child: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         } else {
//           if (snapshot.hasData) {
//             return Container(
//               height: 100,
//               width: MediaQuery.of(context).size.width,
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: snapshot.data!.data!.rows!.length,
//                 itemBuilder: (context, index) {
//                   var item = snapshot.data!.data!.rows![index];
//                   return Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 15, vertical: 5),
//                         child: Container(
//                           color: Colors.white,
//                           height: 50,
//                           width: 50,
//                           child: CircleAvatar(
//                             child: Image.network(data[index]['thumbnail']),
//                             backgroundColor: Colors.white,
//                           ),
//                         ),
//                       ),
//                       Container(
//                           width: 100,
//                           child: Center(
//                               child: Text(
//                             item!.nama!,
//                             textAlign: TextAlign.center,
//                           )))
//                     ],
//                   );
//                 },
//               ),
//             );
//           } else {
//             return DataNotFound();
//           }
//         }
//       });
// }
}
