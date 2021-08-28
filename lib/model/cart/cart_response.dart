/// message : "success retreive data"
/// statusCode : 200
/// data : {"count":1,"rows":[{"id":1,"name":"Bumbu Nasi goreng pedas","harga":6,"qty":2,"total":12,"userId":14,"produkId":1,"createdAt":"2021-08-10T08:20:06.000Z","updatedAt":"2021-08-10T08:20:06.000Z"}]}

class CartResponse {
  String? _message;
  int? _statusCode;
  Data? _data;

  String? get message => _message;
  int? get statusCode => _statusCode;
  Data? get data => _data;

  CartResponse({
      String? message, 
      int? statusCode, 
      Data? data}){
    _message = message;
    _statusCode = statusCode;
    _data = data;
}

  CartResponse.fromJson(dynamic json) {
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

/// count : 1
/// rows : [{"id":1,"name":"Bumbu Nasi goreng pedas","harga":6,"qty":2,"total":12,"userId":14,"produkId":1,"createdAt":"2021-08-10T08:20:06.000Z","updatedAt":"2021-08-10T08:20:06.000Z"}]

class Data {
  int? _count;
  List<Rows>? _rows;

  int? get count => _count;
  List<Rows>? get rows => _rows;

  Data({
      int? count, 
      List<Rows>? rows}){
    _count = count;
    _rows = rows;
}

  Data.fromJson(dynamic json) {
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
/// name : "Bumbu Nasi goreng pedas"
/// harga : 6
/// qty : 2
/// total : 12
/// userId : 14
/// produkId : 1
/// createdAt : "2021-08-10T08:20:06.000Z"
/// updatedAt : "2021-08-10T08:20:06.000Z"

class Rows {
  int? _id;
  String? _name;
  int? _harga;
  int? _qty;
  int? _total;
  int? _userId;
  int? _produkId;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  int? get harga => _harga;
  int? get qty => _qty;
  int? get total => _total;
  int? get userId => _userId;
  int? get produkId => _produkId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Rows({
      int? id, 
      String? name, 
      int? harga, 
      int? qty, 
      int? total, 
      int? userId, 
      int? produkId, 
      String? createdAt, 
      String? updatedAt}){
    _id = id;
    _name = name;
    _harga = harga;
    _qty = qty;
    _total = total;
    _userId = userId;
    _produkId = produkId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Rows.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _harga = json['harga'];
    _qty = json['qty'];
    _total = json['total'];
    _userId = json['userId'];
    _produkId = json['produkId'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['harga'] = _harga;
    map['qty'] = _qty;
    map['total'] = _total;
    map['userId'] = _userId;
    map['produkId'] = _produkId;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}