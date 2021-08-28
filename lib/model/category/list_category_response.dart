/// message : "success retreive data"
/// statusCode : 200
/// data : {"count":4,"rows":[{"id":1,"nama":"Makanan & Minuman","createdAt":"2021-07-22T03:31:41.000Z","updatedAt":"2021-07-22T03:31:41.000Z"},{"id":2,"nama":"Bumbu Dapur","createdAt":"2021-07-22T03:32:08.000Z","updatedAt":"2021-07-22T03:32:08.000Z"},{"id":3,"nama":"Kesehatan & Kecantikan","createdAt":"2021-07-24T08:16:55.000Z","updatedAt":"2021-07-24T08:16:55.000Z"},{"id":5,"nama":"Coba Update","createdAt":"2021-07-26T07:29:24.000Z","updatedAt":"2021-07-26T07:30:22.000Z"}]}

class ListCategoryResponse {
  String? _message;
  int? _statusCode;
  Data? _data;

  String? get message => _message;
  int? get statusCode => _statusCode;
  Data? get data => _data;

  ListCategoryResponse({
      String? message,
      int? statusCode,
      Data? data}){
    _message = message!;
    _statusCode = statusCode!;
    _data = data!;
}

  ListCategoryResponse.fromJson(dynamic json) {
    _message = json["message"];
    _statusCode = json["statusCode"];
    _data = (json["data"] != null ? Data.fromJson(json["data"]) : null)!;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = _message;
    map["statusCode"] = _statusCode;
    if (_data != null) {
      map["data"] = _data!.toJson();
    }
    return map;
  }

}

/// count : 4
/// rows : [{"id":1,"nama":"Makanan & Minuman","createdAt":"2021-07-22T03:31:41.000Z","updatedAt":"2021-07-22T03:31:41.000Z"},{"id":2,"nama":"Bumbu Dapur","createdAt":"2021-07-22T03:32:08.000Z","updatedAt":"2021-07-22T03:32:08.000Z"},{"id":3,"nama":"Kesehatan & Kecantikan","createdAt":"2021-07-24T08:16:55.000Z","updatedAt":"2021-07-24T08:16:55.000Z"},{"id":5,"nama":"Coba Update","createdAt":"2021-07-26T07:29:24.000Z","updatedAt":"2021-07-26T07:30:22.000Z"}]

class Data {
  int? _count;
  List<Rows?>? _rows;

  int? get count => _count!;
  List<Rows?>? get rows => _rows;

  Data({
      int? count,
      required List<Rows?> rows}){
    _count = count;
    _rows = rows;
}

  Data.fromJson(dynamic json) {
    _count = json["count"];
    if (json["rows"] != null) {
      _rows = [];
      json["rows"].forEach((v) {
        _rows!.add(Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["count"] = _count;
    if (_rows != null) {
      map["rows"] = _rows!.map((v) => v!.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// nama : "Makanan & Minuman"
/// createdAt : "2021-07-22T03:31:41.000Z"
/// updatedAt : "2021-07-22T03:31:41.000Z"

class Rows {
  int? _id;
  String? _nama;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id!;
  String? get nama => _nama!;
  String? get createdAt => _createdAt!;
  String? get updatedAt => _updatedAt!;

  Rows({
      int? id,
      String? nama,
      String? createdAt,
      String? updatedAt}){
    _id = id!;
    _nama = nama!;
    _createdAt = createdAt!;
    _updatedAt = updatedAt!;
}

  Rows.fromJson(dynamic json) {
    _id = json["id"];
    _nama = json["nama"];
    _createdAt = json["createdAt"];
    _updatedAt = json["updatedAt"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["nama"] = _nama;
    map["createdAt"] = _createdAt;
    map["updatedAt"] = _updatedAt;
    return map;
  }

}