/// username : "username"
/// password : "pasword"
/// nama : "deni fatkhur rahman"
/// alamat : "Bronggalan sawah 1 no 48 Surabaya"
/// no_telp : "081241223"
/// google_id : "3748542054897325392"
/// role : "ADMIN"

class RegisterRequest {
  String? _username;
  String? _password;
  String? _nama;
  String? _alamat;
  String? _noTelp;
  String? _googleId;
  String? _role;

  String? get username => _username;
  String? get password => _password;
  String? get nama => _nama;
  String? get alamat => _alamat;
  String? get noTelp => _noTelp;
  String? get googleId => _googleId;
  String? get role => _role;

  RegisterRequest({
      String? username, 
      String? password, 
      String? nama, 
      String? alamat, 
      String? noTelp, 
      String? googleId, 
      String? role}){
    _username = username;
    _password = password;
    _nama = nama;
    _alamat = alamat;
    _noTelp = noTelp;
    _googleId = googleId;
    _role = role;
}

  RegisterRequest.fromJson(dynamic json) {
    _username = json['username'];
    _password = json['password'];
    _nama = json['nama'];
    _alamat = json['alamat'];
    _noTelp = json['no_telp'];
    _googleId = json['google_id'];
    _role = json['role'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['username'] = _username;
    map['password'] = _password;
    map['nama'] = _nama;
    map['alamat'] = _alamat;
    map['no_telp'] = _noTelp;
    map['google_id'] = _googleId;
    map['role'] = _role;
    return map;
  }

}