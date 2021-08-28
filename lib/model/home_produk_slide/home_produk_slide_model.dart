/// message : "success retreive data"
/// statusCode : 200
/// data : {"banner":[{"id":1,"link":"https://www.indomarturki.com/wp-content/uploads/2021/06/Poster-Open-Again-web.png","createdAt":"2021-08-25T05:25:50.000Z","updatedAt":"2021-08-25T05:25:50.000Z"},{"id":2,"link":"https://www.indomarturki.com/wp-content/uploads/2021/06/Poster-Belanja-Super-Hemat-web.png","createdAt":"2021-08-25T05:25:58.000Z","updatedAt":"2021-08-25T05:25:58.000Z"},{"id":3,"link":"https://www.indomarturki.com/wp-content/uploads/2021/06/Poster-Promo-web.png","createdAt":"2021-08-25T05:26:06.000Z","updatedAt":"2021-08-25T05:26:06.000Z"}],"category":{"count":9,"rows":[{"id":1,"nama":"Makanan & Minuman","createdAt":"2021-07-22T03:31:41.000Z","updatedAt":"2021-07-22T03:31:41.000Z","products":[{"id":57,"produk":{"id":2,"nama":"Sarden ABC","keterangan":"<p></p><p>test</p><p><br></p>","harga":4,"stok":10,"isActive":true,"createdAt":"2021-07-24T15:05:38.000Z","updatedAt":"2021-08-21T00:51:05.000Z","photos":[{"id":11,"link":"http://api.indomarturki.com/photos/841e.jpg","produkId":2,"createdAt":"2021-08-16T04:23:31.000Z","updatedAt":"2021-08-16T04:23:31.000Z"},{"id":12,"link":"http://api.indomarturki.com/photos/60f7.jpg","produkId":2,"createdAt":"2021-08-16T04:24:05.000Z","updatedAt":"2021-08-16T04:24:05.000Z"},{"id":14,"link":"http://api.indomarturki.com/photos/3410d.png","produkId":2,"createdAt":"2021-08-16T07:00:40.000Z","updatedAt":"2021-08-16T07:00:40.000Z"}]}},{"id":61,"produk":{"id":1,"nama":"Bumbu Nasi goreng pedas","keterangan":"<h1><img src=\"http://api.indomarturki.com/api/v1/photos/1f6d.png\" style=\"width: 512px;\"></h1><h1 style=\"text-align: center; \">Bumbu nasi goreng</h1><p><br></p><p><img style=\"width: 50%;\" src=\"http://api.indomarturki.com/api/v1/photos/8833.png\"></p><p>Tersedia di <b>Indomarturki</b><br><img style=\"width: 25%;\" src=\"http://api.indomarturki.com/api/v1/photos/ef29.png\"></p>","harga":6,"stok":10,"isActive":true,"createdAt":"2021-07-22T03:34:14.000Z","updatedAt":"2021-08-21T01:04:22.000Z","photos":[{"id":13,"link":"http://api.indomarturki.com/photos/ce22.jpg","produkId":1,"createdAt":"2021-08-16T04:26:37.000Z","updatedAt":"2021-08-16T04:26:37.000Z"},{"id":17,"link":"http://localhost:3000/photos/df30.jpg","produkId":1,"createdAt":"2021-08-21T01:04:23.000Z","updatedAt":"2021-08-21T01:04:23.000Z"}]}}]},{"id":2,"nama":"Bumbu Dapur","createdAt":"2021-07-22T03:32:08.000Z","updatedAt":"2021-07-22T03:32:08.000Z","products":[{"id":62,"produk":{"id":1,"nama":"Bumbu Nasi goreng pedas","keterangan":"<h1><img src=\"http://api.indomarturki.com/api/v1/photos/1f6d.png\" style=\"width: 512px;\"></h1><h1 style=\"text-align: center; \">Bumbu nasi goreng</h1><p><br></p><p><img style=\"width: 50%;\" src=\"http://api.indomarturki.com/api/v1/photos/8833.png\"></p><p>Tersedia di <b>Indomarturki</b><br><img style=\"width: 25%;\" src=\"http://api.indomarturki.com/api/v1/photos/ef29.png\"></p>","harga":6,"stok":10,"isActive":true,"createdAt":"2021-07-22T03:34:14.000Z","updatedAt":"2021-08-21T01:04:22.000Z","photos":[{"id":13,"link":"http://api.indomarturki.com/photos/ce22.jpg","produkId":1,"createdAt":"2021-08-16T04:26:37.000Z","updatedAt":"2021-08-16T04:26:37.000Z"},{"id":17,"link":"http://localhost:3000/photos/df30.jpg","produkId":1,"createdAt":"2021-08-21T01:04:23.000Z","updatedAt":"2021-08-21T01:04:23.000Z"}]}}]},{"id":3,"nama":"Kesehatan & Kecantikan","createdAt":"2021-07-24T08:16:55.000Z","updatedAt":"2021-07-24T08:16:55.000Z","products":[{"id":63,"produk":{"id":1,"nama":"Bumbu Nasi goreng pedas","keterangan":"<h1><img src=\"http://api.indomarturki.com/api/v1/photos/1f6d.png\" style=\"width: 512px;\"></h1><h1 style=\"text-align: center; \">Bumbu nasi goreng</h1><p><br></p><p><img style=\"width: 50%;\" src=\"http://api.indomarturki.com/api/v1/photos/8833.png\"></p><p>Tersedia di <b>Indomarturki</b><br><img style=\"width: 25%;\" src=\"http://api.indomarturki.com/api/v1/photos/ef29.png\"></p>","harga":6,"stok":10,"isActive":true,"createdAt":"2021-07-22T03:34:14.000Z","updatedAt":"2021-08-21T01:04:22.000Z","photos":[{"id":13,"link":"http://api.indomarturki.com/photos/ce22.jpg","produkId":1,"createdAt":"2021-08-16T04:26:37.000Z","updatedAt":"2021-08-16T04:26:37.000Z"},{"id":17,"link":"http://localhost:3000/photos/df30.jpg","produkId":1,"createdAt":"2021-08-21T01:04:23.000Z","updatedAt":"2021-08-21T01:04:23.000Z"}]}}]}]}}

class HomeProdukSlideModel {
  String? _message;
  int? _statusCode;
  Data? _data;

  String? get message => _message;
  int? get statusCode => _statusCode;
  Data? get data => _data;

  HomeProdukSlideModel({
      String? message, 
      int? statusCode, 
      Data? data}){
    _message = message;
    _statusCode = statusCode;
    _data = data;
}

  HomeProdukSlideModel.fromJson(dynamic json) {
    _message = json['message'];
    _statusCode = json['statusCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['message'] = _message;
    map['statusCode'] = _statusCode;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// banner : [{"id":1,"link":"https://www.indomarturki.com/wp-content/uploads/2021/06/Poster-Open-Again-web.png","createdAt":"2021-08-25T05:25:50.000Z","updatedAt":"2021-08-25T05:25:50.000Z"},{"id":2,"link":"https://www.indomarturki.com/wp-content/uploads/2021/06/Poster-Belanja-Super-Hemat-web.png","createdAt":"2021-08-25T05:25:58.000Z","updatedAt":"2021-08-25T05:25:58.000Z"},{"id":3,"link":"https://www.indomarturki.com/wp-content/uploads/2021/06/Poster-Promo-web.png","createdAt":"2021-08-25T05:26:06.000Z","updatedAt":"2021-08-25T05:26:06.000Z"}]
/// category : {"count":9,"rows":[{"id":1,"nama":"Makanan & Minuman","createdAt":"2021-07-22T03:31:41.000Z","updatedAt":"2021-07-22T03:31:41.000Z","products":[{"id":57,"produk":{"id":2,"nama":"Sarden ABC","keterangan":"<p></p><p>test</p><p><br></p>","harga":4,"stok":10,"isActive":true,"createdAt":"2021-07-24T15:05:38.000Z","updatedAt":"2021-08-21T00:51:05.000Z","photos":[{"id":11,"link":"http://api.indomarturki.com/photos/841e.jpg","produkId":2,"createdAt":"2021-08-16T04:23:31.000Z","updatedAt":"2021-08-16T04:23:31.000Z"},{"id":12,"link":"http://api.indomarturki.com/photos/60f7.jpg","produkId":2,"createdAt":"2021-08-16T04:24:05.000Z","updatedAt":"2021-08-16T04:24:05.000Z"},{"id":14,"link":"http://api.indomarturki.com/photos/3410d.png","produkId":2,"createdAt":"2021-08-16T07:00:40.000Z","updatedAt":"2021-08-16T07:00:40.000Z"}]}},{"id":61,"produk":{"id":1,"nama":"Bumbu Nasi goreng pedas","keterangan":"<h1><img src=\"http://api.indomarturki.com/api/v1/photos/1f6d.png\" style=\"width: 512px;\"></h1><h1 style=\"text-align: center; \">Bumbu nasi goreng</h1><p><br></p><p><img style=\"width: 50%;\" src=\"http://api.indomarturki.com/api/v1/photos/8833.png\"></p><p>Tersedia di <b>Indomarturki</b><br><img style=\"width: 25%;\" src=\"http://api.indomarturki.com/api/v1/photos/ef29.png\"></p>","harga":6,"stok":10,"isActive":true,"createdAt":"2021-07-22T03:34:14.000Z","updatedAt":"2021-08-21T01:04:22.000Z","photos":[{"id":13,"link":"http://api.indomarturki.com/photos/ce22.jpg","produkId":1,"createdAt":"2021-08-16T04:26:37.000Z","updatedAt":"2021-08-16T04:26:37.000Z"},{"id":17,"link":"http://localhost:3000/photos/df30.jpg","produkId":1,"createdAt":"2021-08-21T01:04:23.000Z","updatedAt":"2021-08-21T01:04:23.000Z"}]}}]},{"id":2,"nama":"Bumbu Dapur","createdAt":"2021-07-22T03:32:08.000Z","updatedAt":"2021-07-22T03:32:08.000Z","products":[{"id":62,"produk":{"id":1,"nama":"Bumbu Nasi goreng pedas","keterangan":"<h1><img src=\"http://api.indomarturki.com/api/v1/photos/1f6d.png\" style=\"width: 512px;\"></h1><h1 style=\"text-align: center; \">Bumbu nasi goreng</h1><p><br></p><p><img style=\"width: 50%;\" src=\"http://api.indomarturki.com/api/v1/photos/8833.png\"></p><p>Tersedia di <b>Indomarturki</b><br><img style=\"width: 25%;\" src=\"http://api.indomarturki.com/api/v1/photos/ef29.png\"></p>","harga":6,"stok":10,"isActive":true,"createdAt":"2021-07-22T03:34:14.000Z","updatedAt":"2021-08-21T01:04:22.000Z","photos":[{"id":13,"link":"http://api.indomarturki.com/photos/ce22.jpg","produkId":1,"createdAt":"2021-08-16T04:26:37.000Z","updatedAt":"2021-08-16T04:26:37.000Z"},{"id":17,"link":"http://localhost:3000/photos/df30.jpg","produkId":1,"createdAt":"2021-08-21T01:04:23.000Z","updatedAt":"2021-08-21T01:04:23.000Z"}]}}]},{"id":3,"nama":"Kesehatan & Kecantikan","createdAt":"2021-07-24T08:16:55.000Z","updatedAt":"2021-07-24T08:16:55.000Z","products":[{"id":63,"produk":{"id":1,"nama":"Bumbu Nasi goreng pedas","keterangan":"<h1><img src=\"http://api.indomarturki.com/api/v1/photos/1f6d.png\" style=\"width: 512px;\"></h1><h1 style=\"text-align: center; \">Bumbu nasi goreng</h1><p><br></p><p><img style=\"width: 50%;\" src=\"http://api.indomarturki.com/api/v1/photos/8833.png\"></p><p>Tersedia di <b>Indomarturki</b><br><img style=\"width: 25%;\" src=\"http://api.indomarturki.com/api/v1/photos/ef29.png\"></p>","harga":6,"stok":10,"isActive":true,"createdAt":"2021-07-22T03:34:14.000Z","updatedAt":"2021-08-21T01:04:22.000Z","photos":[{"id":13,"link":"http://api.indomarturki.com/photos/ce22.jpg","produkId":1,"createdAt":"2021-08-16T04:26:37.000Z","updatedAt":"2021-08-16T04:26:37.000Z"},{"id":17,"link":"http://localhost:3000/photos/df30.jpg","produkId":1,"createdAt":"2021-08-21T01:04:23.000Z","updatedAt":"2021-08-21T01:04:23.000Z"}]}}]}]}

class Data {
  List<Banner>? _banner;
  Category? _category;

  List<Banner>? get banner => _banner;
  Category? get category => _category;

  Data({
      List<Banner>? banner, 
      Category? category}){
    _banner = banner;
    _category = category;
}

  Data.fromJson(dynamic json) {
    if (json['banner'] != null) {
      _banner = [];
      json['banner'].forEach((v) {
        _banner?.add(Banner.fromJson(v));
      });
    }
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_banner != null) {
      map['banner'] = _banner?.map((v) => v.toJson()).toList();
    }
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    return map;
  }

}

/// count : 9
/// rows : [{"id":1,"nama":"Makanan & Minuman","createdAt":"2021-07-22T03:31:41.000Z","updatedAt":"2021-07-22T03:31:41.000Z","products":[{"id":57,"produk":{"id":2,"nama":"Sarden ABC","keterangan":"<p></p><p>test</p><p><br></p>","harga":4,"stok":10,"isActive":true,"createdAt":"2021-07-24T15:05:38.000Z","updatedAt":"2021-08-21T00:51:05.000Z","photos":[{"id":11,"link":"http://api.indomarturki.com/photos/841e.jpg","produkId":2,"createdAt":"2021-08-16T04:23:31.000Z","updatedAt":"2021-08-16T04:23:31.000Z"},{"id":12,"link":"http://api.indomarturki.com/photos/60f7.jpg","produkId":2,"createdAt":"2021-08-16T04:24:05.000Z","updatedAt":"2021-08-16T04:24:05.000Z"},{"id":14,"link":"http://api.indomarturki.com/photos/3410d.png","produkId":2,"createdAt":"2021-08-16T07:00:40.000Z","updatedAt":"2021-08-16T07:00:40.000Z"}]}},{"id":61,"produk":{"id":1,"nama":"Bumbu Nasi goreng pedas","keterangan":"<h1><img src=\"http://api.indomarturki.com/api/v1/photos/1f6d.png\" style=\"width: 512px;\"></h1><h1 style=\"text-align: center; \">Bumbu nasi goreng</h1><p><br></p><p><img style=\"width: 50%;\" src=\"http://api.indomarturki.com/api/v1/photos/8833.png\"></p><p>Tersedia di <b>Indomarturki</b><br><img style=\"width: 25%;\" src=\"http://api.indomarturki.com/api/v1/photos/ef29.png\"></p>","harga":6,"stok":10,"isActive":true,"createdAt":"2021-07-22T03:34:14.000Z","updatedAt":"2021-08-21T01:04:22.000Z","photos":[{"id":13,"link":"http://api.indomarturki.com/photos/ce22.jpg","produkId":1,"createdAt":"2021-08-16T04:26:37.000Z","updatedAt":"2021-08-16T04:26:37.000Z"},{"id":17,"link":"http://localhost:3000/photos/df30.jpg","produkId":1,"createdAt":"2021-08-21T01:04:23.000Z","updatedAt":"2021-08-21T01:04:23.000Z"}]}}]},{"id":2,"nama":"Bumbu Dapur","createdAt":"2021-07-22T03:32:08.000Z","updatedAt":"2021-07-22T03:32:08.000Z","products":[{"id":62,"produk":{"id":1,"nama":"Bumbu Nasi goreng pedas","keterangan":"<h1><img src=\"http://api.indomarturki.com/api/v1/photos/1f6d.png\" style=\"width: 512px;\"></h1><h1 style=\"text-align: center; \">Bumbu nasi goreng</h1><p><br></p><p><img style=\"width: 50%;\" src=\"http://api.indomarturki.com/api/v1/photos/8833.png\"></p><p>Tersedia di <b>Indomarturki</b><br><img style=\"width: 25%;\" src=\"http://api.indomarturki.com/api/v1/photos/ef29.png\"></p>","harga":6,"stok":10,"isActive":true,"createdAt":"2021-07-22T03:34:14.000Z","updatedAt":"2021-08-21T01:04:22.000Z","photos":[{"id":13,"link":"http://api.indomarturki.com/photos/ce22.jpg","produkId":1,"createdAt":"2021-08-16T04:26:37.000Z","updatedAt":"2021-08-16T04:26:37.000Z"},{"id":17,"link":"http://localhost:3000/photos/df30.jpg","produkId":1,"createdAt":"2021-08-21T01:04:23.000Z","updatedAt":"2021-08-21T01:04:23.000Z"}]}}]},{"id":3,"nama":"Kesehatan & Kecantikan","createdAt":"2021-07-24T08:16:55.000Z","updatedAt":"2021-07-24T08:16:55.000Z","products":[{"id":63,"produk":{"id":1,"nama":"Bumbu Nasi goreng pedas","keterangan":"<h1><img src=\"http://api.indomarturki.com/api/v1/photos/1f6d.png\" style=\"width: 512px;\"></h1><h1 style=\"text-align: center; \">Bumbu nasi goreng</h1><p><br></p><p><img style=\"width: 50%;\" src=\"http://api.indomarturki.com/api/v1/photos/8833.png\"></p><p>Tersedia di <b>Indomarturki</b><br><img style=\"width: 25%;\" src=\"http://api.indomarturki.com/api/v1/photos/ef29.png\"></p>","harga":6,"stok":10,"isActive":true,"createdAt":"2021-07-22T03:34:14.000Z","updatedAt":"2021-08-21T01:04:22.000Z","photos":[{"id":13,"link":"http://api.indomarturki.com/photos/ce22.jpg","produkId":1,"createdAt":"2021-08-16T04:26:37.000Z","updatedAt":"2021-08-16T04:26:37.000Z"},{"id":17,"link":"http://localhost:3000/photos/df30.jpg","produkId":1,"createdAt":"2021-08-21T01:04:23.000Z","updatedAt":"2021-08-21T01:04:23.000Z"}]}}]}]

class Category {
  int? _count;
  List<Rows>? _rows;

  int? get count => _count;
  List<Rows>? get rows => _rows;

  Category({
      int? count, 
      List<Rows>? rows}){
    _count = count;
    _rows = rows;
}

  Category.fromJson(dynamic json) {
    _count = json['count'];
    if (json['rows'] != null) {
      _rows = [];
      json['rows'].forEach((v) {
        _rows?.add(Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['count'] = _count;
    if (_rows != null) {
      map['rows'] = _rows?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// nama : "Makanan & Minuman"
/// createdAt : "2021-07-22T03:31:41.000Z"
/// updatedAt : "2021-07-22T03:31:41.000Z"
/// products : [{"id":57,"produk":{"id":2,"nama":"Sarden ABC","keterangan":"<p></p><p>test</p><p><br></p>","harga":4,"stok":10,"isActive":true,"createdAt":"2021-07-24T15:05:38.000Z","updatedAt":"2021-08-21T00:51:05.000Z","photos":[{"id":11,"link":"http://api.indomarturki.com/photos/841e.jpg","produkId":2,"createdAt":"2021-08-16T04:23:31.000Z","updatedAt":"2021-08-16T04:23:31.000Z"},{"id":12,"link":"http://api.indomarturki.com/photos/60f7.jpg","produkId":2,"createdAt":"2021-08-16T04:24:05.000Z","updatedAt":"2021-08-16T04:24:05.000Z"},{"id":14,"link":"http://api.indomarturki.com/photos/3410d.png","produkId":2,"createdAt":"2021-08-16T07:00:40.000Z","updatedAt":"2021-08-16T07:00:40.000Z"}]}},{"id":61,"produk":{"id":1,"nama":"Bumbu Nasi goreng pedas","keterangan":"<h1><img src=\"http://api.indomarturki.com/api/v1/photos/1f6d.png\" style=\"width: 512px;\"></h1><h1 style=\"text-align: center; \">Bumbu nasi goreng</h1><p><br></p><p><img style=\"width: 50%;\" src=\"http://api.indomarturki.com/api/v1/photos/8833.png\"></p><p>Tersedia di <b>Indomarturki</b><br><img style=\"width: 25%;\" src=\"http://api.indomarturki.com/api/v1/photos/ef29.png\"></p>","harga":6,"stok":10,"isActive":true,"createdAt":"2021-07-22T03:34:14.000Z","updatedAt":"2021-08-21T01:04:22.000Z","photos":[{"id":13,"link":"http://api.indomarturki.com/photos/ce22.jpg","produkId":1,"createdAt":"2021-08-16T04:26:37.000Z","updatedAt":"2021-08-16T04:26:37.000Z"},{"id":17,"link":"http://localhost:3000/photos/df30.jpg","produkId":1,"createdAt":"2021-08-21T01:04:23.000Z","updatedAt":"2021-08-21T01:04:23.000Z"}]}}]

class Rows {
  int? _id;
  String? _nama;
  String? _createdAt;
  String? _updatedAt;
  List<Products>? _products;

  int? get id => _id;
  String? get nama => _nama;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<Products>? get products => _products;

  Rows({
      int? id, 
      String? nama, 
      String? createdAt, 
      String? updatedAt, 
      List<Products>? products}){
    _id = id;
    _nama = nama;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _products = products;
}

  Rows.fromJson(dynamic json) {
    _id = json['id'];
    _nama = json['nama'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['nama'] = _nama;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 57
/// produk : {"id":2,"nama":"Sarden ABC","keterangan":"<p></p><p>test</p><p><br></p>","harga":4,"stok":10,"isActive":true,"createdAt":"2021-07-24T15:05:38.000Z","updatedAt":"2021-08-21T00:51:05.000Z","photos":[{"id":11,"link":"http://api.indomarturki.com/photos/841e.jpg","produkId":2,"createdAt":"2021-08-16T04:23:31.000Z","updatedAt":"2021-08-16T04:23:31.000Z"},{"id":12,"link":"http://api.indomarturki.com/photos/60f7.jpg","produkId":2,"createdAt":"2021-08-16T04:24:05.000Z","updatedAt":"2021-08-16T04:24:05.000Z"},{"id":14,"link":"http://api.indomarturki.com/photos/3410d.png","produkId":2,"createdAt":"2021-08-16T07:00:40.000Z","updatedAt":"2021-08-16T07:00:40.000Z"}]}

class Products {
  int? _id;
  Produk? _produk;

  int? get id => _id;
  Produk? get produk => _produk;

  Products({
      int? id, 
      Produk? produk}){
    _id = id;
    _produk = produk;
}

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _produk = json['produk'] != null ? Produk.fromJson(json['produk']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    if (_produk != null) {
      map['produk'] = _produk?.toJson();
    }
    return map;
  }

}

/// id : 2
/// nama : "Sarden ABC"
/// keterangan : "<p></p><p>test</p><p><br></p>"
/// harga : 4
/// stok : 10
/// isActive : true
/// createdAt : "2021-07-24T15:05:38.000Z"
/// updatedAt : "2021-08-21T00:51:05.000Z"
/// photos : [{"id":11,"link":"http://api.indomarturki.com/photos/841e.jpg","produkId":2,"createdAt":"2021-08-16T04:23:31.000Z","updatedAt":"2021-08-16T04:23:31.000Z"},{"id":12,"link":"http://api.indomarturki.com/photos/60f7.jpg","produkId":2,"createdAt":"2021-08-16T04:24:05.000Z","updatedAt":"2021-08-16T04:24:05.000Z"},{"id":14,"link":"http://api.indomarturki.com/photos/3410d.png","produkId":2,"createdAt":"2021-08-16T07:00:40.000Z","updatedAt":"2021-08-16T07:00:40.000Z"}]

class Produk {
  int? _id;
  String? _nama;
  String? _keterangan;
  int? _harga;
  int? _stok;
  bool? _isActive;
  String? _createdAt;
  String? _updatedAt;
  List<Photos>? _photos;

  int? get id => _id;
  String? get nama => _nama;
  String? get keterangan => _keterangan;
  int? get harga => _harga;
  int? get stok => _stok;
  bool? get isActive => _isActive;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<Photos>? get photos => _photos;

  Produk({
      int? id, 
      String? nama, 
      String? keterangan, 
      int? harga, 
      int? stok, 
      bool? isActive, 
      String? createdAt, 
      String? updatedAt, 
      List<Photos>? photos}){
    _id = id;
    _nama = nama;
    _keterangan = keterangan;
    _harga = harga;
    _stok = stok;
    _isActive = isActive;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _photos = photos;
}

  Produk.fromJson(dynamic json) {
    _id = json['id'];
    _nama = json['nama'];
    _keterangan = json['keterangan'];
    _harga = json['harga'];
    _stok = json['stok'];
    _isActive = json['isActive'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    if (json['photos'] != null) {
      _photos = [];
      json['photos'].forEach((v) {
        _photos?.add(Photos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['nama'] = _nama;
    map['keterangan'] = _keterangan;
    map['harga'] = _harga;
    map['stok'] = _stok;
    map['isActive'] = _isActive;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    if (_photos != null) {
      map['photos'] = _photos?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 11
/// link : "http://api.indomarturki.com/photos/841e.jpg"
/// produkId : 2
/// createdAt : "2021-08-16T04:23:31.000Z"
/// updatedAt : "2021-08-16T04:23:31.000Z"

class Photos {
  int? _id;
  String? _link;
  int? _produkId;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get link => _link;
  int? get produkId => _produkId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Photos({
      int? id, 
      String? link, 
      int? produkId, 
      String? createdAt, 
      String? updatedAt}){
    _id = id;
    _link = link;
    _produkId = produkId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Photos.fromJson(dynamic json) {
    _id = json['id'];
    _link = json['link'];
    _produkId = json['produkId'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['link'] = _link;
    map['produkId'] = _produkId;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}

/// id : 1
/// link : "https://www.indomarturki.com/wp-content/uploads/2021/06/Poster-Open-Again-web.png"
/// createdAt : "2021-08-25T05:25:50.000Z"
/// updatedAt : "2021-08-25T05:25:50.000Z"

class Banner {
  int? _id;
  String? _link;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get link => _link;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Banner({
      int? id, 
      String? link, 
      String? createdAt, 
      String? updatedAt}){
    _id = id;
    _link = link;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Banner.fromJson(dynamic json) {
    _id = json['id'];
    _link = json['link'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['link'] = _link;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}