/// message : "success retreive data"
/// statusCode : 200
/// data : {"id":1,"username":"admin","password":"$2b$10$3yo1rM/C.EQD2pmTWrUXGOrru8DptlgxEiMH8413ZGHFdgBiln6ri","nama":"deni","alamat":"surabaya","no_telp":"081","role":"ADMIN","createdAt":"2021-07-22T00:00:00.000Z","updatedAt":"2021-07-22T00:00:00.000Z"}

class UsernameCheckExistResponse {
  String? _message;
  int? _statusCode;
  Data? _data;

  String? get message => _message;
  int? get statusCode => _statusCode;
  Data? get data => _data;

  UsernameCheckExistResponse({
      String? message, 
      int? statusCode, 
      Data? data}){
    _message = message;
    _statusCode = statusCode;
    _data = data;
}

  UsernameCheckExistResponse.fromJson(dynamic json) {
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

/// id : 1
/// username : "admin"
/// password : "$2b$10$3yo1rM/C.EQD2pmTWrUXGOrru8DptlgxEiMH8413ZGHFdgBiln6ri"
/// nama : "deni"
/// alamat : "surabaya"
/// no_telp : "081"
/// role : "ADMIN"
/// createdAt : "2021-07-22T00:00:00.000Z"
/// updatedAt : "2021-07-22T00:00:00.000Z"

class Data {
  int? _id;
  String? _username;
  String? _password;
  String? _nama;
  String? _alamat;
  String? _noTelp;
  String? _role;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get username => _username;
  String? get password => _password;
  String? get nama => _nama;
  String? get alamat => _alamat;
  String? get noTelp => _noTelp;
  String? get role => _role;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Data({
      int? id, 
      String? username, 
      String? password, 
      String? nama, 
      String? alamat, 
      String? noTelp, 
      String? role, 
      String? createdAt, 
      String? updatedAt}){
    _id = id;
    _username = username;
    _password = password;
    _nama = nama;
    _alamat = alamat;
    _noTelp = noTelp;
    _role = role;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _password = json['password'];
    _nama = json['nama'];
    _alamat = json['alamat'];
    _noTelp = json['no_telp'];
    _role = json['role'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['password'] = _password;
    map['nama'] = _nama;
    map['alamat'] = _alamat;
    map['no_telp'] = _noTelp;
    map['role'] = _role;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}