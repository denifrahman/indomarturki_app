/// message : "success retreive data"
/// statusCode : 200
/// data : [{"id":32,"produkId":1,"categoryId":1,"createdAt":"2021-07-24T08:18:14.000Z","updatedAt":"2021-07-24T08:18:14.000Z","produk":{"id":1,"nama":"Bumbu Nasi goreng pedas","keterangan":"<h1><img src=\"http://api.indomarturki.com/api/v1/photos/1f6d.png\" style=\"width: 512px;\"></h1><h1 style=\"text-align: center; \">Bumbu nasi goreng</h1><p><br></p><p><img style=\"width: 50%;\" src=\"http://api.indomarturki.com/api/v1/photos/8833.png\"></p><p>Tersedia di <b>Indomarturki</b><br><img style=\"width: 25%;\" src=\"http://api.indomarturki.com/api/v1/photos/ef29.png\"></p>","harga":6,"stok":10,"isActive":true,"createdAt":"2021-07-22T03:34:14.000Z","updatedAt":"2021-07-24T08:18:09.000Z","photos":[{"id":3,"link":"http://api.indomarturki.com/api/v1/photos/4133.png","produkId":1,"createdAt":"2021-07-22T03:51:39.000Z","updatedAt":"2021-07-22T03:51:39.000Z"},{"id":5,"link":"http://api.indomarturki.com/api/v1/photos/5deb.png","produkId":1,"createdAt":"2021-07-22T05:21:54.000Z","updatedAt":"2021-07-22T05:21:54.000Z"}]}},{"id":39,"produkId":2,"categoryId":1,"createdAt":"2021-07-26T08:21:20.000Z","updatedAt":"2021-07-26T08:21:20.000Z","produk":{"id":2,"nama":"Sarden ABC","keterangan":"-","harga":4,"stok":10,"isActive":true,"createdAt":"2021-07-24T15:05:38.000Z","updatedAt":"2021-07-26T08:21:19.000Z","photos":[{"id":7,"link":"http://api.indomarturki.com/api/v1/photos/3d12.png","produkId":2,"createdAt":"2021-07-24T15:32:38.000Z","updatedAt":"2021-07-24T15:32:38.000Z"}]}}]

class ProdukByCategoryResponse {
  String? _message;
  int? _statusCode;
  List<Data>? _data;

  String? get message => _message;
  int? get statusCode => _statusCode;
  List<Data>? get data => _data;

  ProdukByCategoryResponse({
      String? message,
      int? statusCode,
      List<Data>? data}){
    _message = message;
    _statusCode = statusCode;
    _data = data;
}

  ProdukByCategoryResponse.fromJson(dynamic json) {
    _message = json['message'];
    _statusCode = json['statusCode'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['message'] = _message;
    map['statusCode'] = _statusCode;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 32
/// produkId : 1
/// categoryId : 1
/// createdAt : "2021-07-24T08:18:14.000Z"
/// updatedAt : "2021-07-24T08:18:14.000Z"
/// produk : {"id":1,"nama":"Bumbu Nasi goreng pedas","keterangan":"<h1><img src=\"http://api.indomarturki.com/api/v1/photos/1f6d.png\" style=\"width: 512px;\"></h1><h1 style=\"text-align: center; \">Bumbu nasi goreng</h1><p><br></p><p><img style=\"width: 50%;\" src=\"http://api.indomarturki.com/api/v1/photos/8833.png\"></p><p>Tersedia di <b>Indomarturki</b><br><img style=\"width: 25%;\" src=\"http://api.indomarturki.com/api/v1/photos/ef29.png\"></p>","harga":6,"stok":10,"isActive":true,"createdAt":"2021-07-22T03:34:14.000Z","updatedAt":"2021-07-24T08:18:09.000Z","photos":[{"id":3,"link":"http://api.indomarturki.com/api/v1/photos/4133.png","produkId":1,"createdAt":"2021-07-22T03:51:39.000Z","updatedAt":"2021-07-22T03:51:39.000Z"},{"id":5,"link":"http://api.indomarturki.com/api/v1/photos/5deb.png","produkId":1,"createdAt":"2021-07-22T05:21:54.000Z","updatedAt":"2021-07-22T05:21:54.000Z"}]}

class Data {
  int? _id;
  int? _produkId;
  int? _categoryId;
  String? _createdAt;
  String? _updatedAt;
  Produk? _produk;

  int? get id => _id;
  int? get produkId => _produkId;
  int? get categoryId => _categoryId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Produk? get produk => _produk;

  Data({
      int? id,
      int? produkId,
      int? categoryId,
      String? createdAt,
      String? updatedAt,
      Produk? produk}){
    _id = id;
    _produkId = produkId;
    _categoryId = categoryId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _produk = produk;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _produkId = json['produkId'];
    _categoryId = json['categoryId'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _produk = json['produk'] != null ? Produk.fromJson(json['produk']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['produkId'] = _produkId;
    map['categoryId'] = _categoryId;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    if (_produk != null) {
      map['produk'] = _produk?.toJson();
    }
    return map;
  }

}

/// id : 1
/// nama : "Bumbu Nasi goreng pedas"
/// keterangan : "<h1><img src=\"http://api.indomarturki.com/api/v1/photos/1f6d.png\" style=\"width: 512px;\"></h1><h1 style=\"text-align: center; \">Bumbu nasi goreng</h1><p><br></p><p><img style=\"width: 50%;\" src=\"http://api.indomarturki.com/api/v1/photos/8833.png\"></p><p>Tersedia di <b>Indomarturki</b><br><img style=\"width: 25%;\" src=\"http://api.indomarturki.com/api/v1/photos/ef29.png\"></p>"
/// harga : 6
/// stok : 10
/// isActive : true
/// createdAt : "2021-07-22T03:34:14.000Z"
/// updatedAt : "2021-07-24T08:18:09.000Z"
/// photos : [{"id":3,"link":"http://api.indomarturki.com/api/v1/photos/4133.png","produkId":1,"createdAt":"2021-07-22T03:51:39.000Z","updatedAt":"2021-07-22T03:51:39.000Z"},{"id":5,"link":"http://api.indomarturki.com/api/v1/photos/5deb.png","produkId":1,"createdAt":"2021-07-22T05:21:54.000Z","updatedAt":"2021-07-22T05:21:54.000Z"}]

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

/// id : 3
/// link : "http://api.indomarturki.com/api/v1/photos/4133.png"
/// produkId : 1
/// createdAt : "2021-07-22T03:51:39.000Z"
/// updatedAt : "2021-07-22T03:51:39.000Z"

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