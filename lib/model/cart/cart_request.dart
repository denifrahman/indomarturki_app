/// name : "Bumbu sajiku"
/// harga : 100000
/// qty : 1
/// total : 100000
/// userId : 1
/// produkId : 1

class CartRequest {
  String? _name;
  int? _harga;
  int? _qty;
  int? _total;
  int? _userId;
  int? _produkId;

  String? get name => _name;
  int? get harga => _harga;
  int? get qty => _qty;
  int? get total => _total;
  int? get userId => _userId;
  int? get produkId => _produkId;

  CartRequest({
      String? name, 
      int? harga, 
      int? qty, 
      int? total, 
      int? userId, 
      int? produkId}){
    _name = name;
    _harga = harga;
    _qty = qty;
    _total = total;
    _userId = userId;
    _produkId = produkId;
}

  CartRequest.fromJson(dynamic json) {
    _name = json['name'];
    _harga = json['harga'];
    _qty = json['qty'];
    _total = json['total'];
    _userId = json['userId'];
    _produkId = json['produkId'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = _name;
    map['harga'] = _harga;
    map['qty'] = _qty;
    map['total'] = _total;
    map['userId'] = _userId;
    map['produkId'] = _produkId;
    return map;
  }

}