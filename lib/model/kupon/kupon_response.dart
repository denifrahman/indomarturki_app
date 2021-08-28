/// message : "success retreive data"
/// statusCode : 200
/// data : {"id":3,"nama":"Diskon 10%","diskon":10,"kode":"diskon10","aktifSampai":"2021-08-31T00:00:00.000Z","createdAt":"2021-07-24T07:47:56.000Z","updatedAt":"2021-07-29T00:42:09.000Z"}

class KuponResponse {
  String? _message;
  int? _statusCode;
  Data? _data;

  String? get message => _message;
  int? get statusCode => _statusCode;
  Data? get data => _data;

  KuponResponse({
      String? message, 
      int? statusCode, 
      Data? data}){
    _message = message;
    _statusCode = statusCode;
    _data = data;
}

  KuponResponse.fromJson(dynamic json) {
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

/// id : 3
/// nama : "Diskon 10%"
/// diskon : 10
/// kode : "diskon10"
/// aktifSampai : "2021-08-31T00:00:00.000Z"
/// createdAt : "2021-07-24T07:47:56.000Z"
/// updatedAt : "2021-07-29T00:42:09.000Z"

class Data {
  int? _id;
  String? _nama;
  int? _diskon;
  String? _kode;
  String? _aktifSampai;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get nama => _nama;
  int? get diskon => _diskon;
  String? get kode => _kode;
  String? get aktifSampai => _aktifSampai;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Data({
      int? id, 
      String? nama, 
      int? diskon, 
      String? kode, 
      String? aktifSampai, 
      String? createdAt, 
      String? updatedAt}){
    _id = id;
    _nama = nama;
    _diskon = diskon;
    _kode = kode;
    _aktifSampai = aktifSampai;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _nama = json['nama'];
    _diskon = json['diskon'];
    _kode = json['kode'];
    _aktifSampai = json['aktifSampai'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['nama'] = _nama;
    map['diskon'] = _diskon;
    map['kode'] = _kode;
    map['aktifSampai'] = _aktifSampai;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}