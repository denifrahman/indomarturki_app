/// data : {"id":13,"username":"username","password":"$2b$10$kD2NEm/pWF09sC/RMFTt4.fW2CrlojYXv1p9A4afVG5eN5nQfpq9e","nama":"deni fatkhur rahman","alamat":"Bronggalan sawah 1 no 48 Surabaya","no_telp":"081241223","google_id":"3748542054897325392","role":"ADMIN","updatedAt":"2021-08-09T07:28:38.835Z","createdAt":"2021-08-09T07:28:38.835Z"}
/// statusCode : 201
/// message : "success created data"

class RegisterResponse {
  Data? _data;
  int? _statusCode;
  String? _message;

  Data? get data => _data;
  int? get statusCode => _statusCode;
  String? get message => _message;

  RegisterResponse({
      Data? data, 
      int? statusCode, 
      String? message}){
    _data = data;
    _statusCode = statusCode;
    _message = message;
}

  RegisterResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _statusCode = json['statusCode'];
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['statusCode'] = _statusCode;
    map['message'] = _message;
    return map;
  }

}

/// id : 13
/// username : "username"
/// password : "$2b$10$kD2NEm/pWF09sC/RMFTt4.fW2CrlojYXv1p9A4afVG5eN5nQfpq9e"
/// nama : "deni fatkhur rahman"
/// alamat : "Bronggalan sawah 1 no 48 Surabaya"
/// no_telp : "081241223"
/// google_id : "3748542054897325392"
/// role : "ADMIN"
/// updatedAt : "2021-08-09T07:28:38.835Z"
/// createdAt : "2021-08-09T07:28:38.835Z"

class Data {
  int? _id;
  String? _username;
  String? _password;
  String? _nama;
  String? _alamat;
  String? _noTelp;
  String? _googleId;
  String? _role;
  String? _updatedAt;
  String? _createdAt;

  int? get id => _id;
  String? get username => _username;
  String? get password => _password;
  String? get nama => _nama;
  String? get alamat => _alamat;
  String? get noTelp => _noTelp;
  String? get googleId => _googleId;
  String? get role => _role;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;

  Data({
      int? id, 
      String? username, 
      String? password, 
      String? nama, 
      String? alamat, 
      String? noTelp, 
      String? googleId, 
      String? role, 
      String? updatedAt, 
      String? createdAt}){
    _id = id;
    _username = username;
    _password = password;
    _nama = nama;
    _alamat = alamat;
    _noTelp = noTelp;
    _googleId = googleId;
    _role = role;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _password = json['password'];
    _nama = json['nama'];
    _alamat = json['alamat'];
    _noTelp = json['no_telp'];
    _googleId = json['google_id'];
    _role = json['role'];
    _updatedAt = json['updatedAt'];
    _createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['password'] = _password;
    map['nama'] = _nama;
    map['alamat'] = _alamat;
    map['no_telp'] = _noTelp;
    map['google_id'] = _googleId;
    map['role'] = _role;
    map['updatedAt'] = _updatedAt;
    map['createdAt'] = _createdAt;
    return map;
  }

}