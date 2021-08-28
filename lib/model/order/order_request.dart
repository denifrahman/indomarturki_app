/// orderNumber : "string"
/// orderTotal : 0
/// orderDiskon : 0
/// orderTotalDiskon : 0
/// userId : 0
/// orderUserALamat : "string"
/// orderUserTelp : "string"
/// orderDetails : [{"name":"string","harga":0,"qty":0,"total":0,"orderId":0,"produkId":0}]

class OrderRequest {
  String? _orderNumber;
  dynamic? _orderTotal;
  dynamic? _orderDiskon;
  dynamic? _orderTotalDiskon;
  dynamic? _userId;
  String? _orderUserALamat;
  String? _orderUserTelp;
  List<OrderDetails>? _orderDetails;

  String? get orderNumber => _orderNumber;
  dynamic? get orderTotal => _orderTotal;
  dynamic? get orderDiskon => _orderDiskon;
  dynamic? get orderTotalDiskon => _orderTotalDiskon;
  dynamic? get userId => _userId;
  String? get orderUserALamat => _orderUserALamat;
  String? get orderUserTelp => _orderUserTelp;
  List<OrderDetails>? get orderDetails => _orderDetails;

  OrderRequest({
      String? orderNumber,
    dynamic? orderTotal,
      dynamic? orderDiskon,
    dynamic? orderTotalDiskon,
      dynamic? userId, 
      String? orderUserALamat, 
      String? orderUserTelp, 
      List<OrderDetails>? orderDetails}){
    _orderNumber = orderNumber;
    _orderTotal = orderTotal;
    _orderDiskon = orderDiskon;
    _orderTotalDiskon = orderTotalDiskon;
    _userId = userId;
    _orderUserALamat = orderUserALamat;
    _orderUserTelp = orderUserTelp;
    _orderDetails = orderDetails;
}

  OrderRequest.fromJson(dynamic json) {
    _orderNumber = json['orderNumber'];
    _orderTotal = json['orderTotal'];
    _orderDiskon = json['orderDiskon'];
    _orderTotalDiskon = json['orderTotalDiskon'];
    _userId = json['userId'];
    _orderUserALamat = json['orderUserALamat'];
    _orderUserTelp = json['orderUserTelp'];
    if (json['orderDetails'] != null) {
      _orderDetails = [];
      json['orderDetails'].forEach((v) {
        _orderDetails?.add(OrderDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['orderNumber'] = _orderNumber;
    map['orderTotal'] = _orderTotal;
    map['orderDiskon'] = _orderDiskon;
    map['orderTotalDiskon'] = _orderTotalDiskon;
    map['userId'] = _userId;
    map['orderUserALamat'] = _orderUserALamat;
    map['orderUserTelp'] = _orderUserTelp;
    if (_orderDetails != null) {
      map['orderDetails'] = _orderDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "string"
/// harga : 0
/// qty : 0
/// total : 0
/// orderId : 0
/// produkId : 0

class OrderDetails {
  String? _name;
  dynamic? _harga;
  dynamic? _qty;
  dynamic? _total;
  dynamic? _orderId;
  dynamic? _produkId;

  String? get name => _name;
  dynamic? get harga => _harga;
  dynamic? get qty => _qty;
  dynamic? get total => _total;
  dynamic? get orderId => _orderId;
  dynamic? get produkId => _produkId;

  OrderDetails({
      String? name, 
      dynamic? harga, 
      dynamic? qty, 
      dynamic? total, 
      dynamic? orderId, 
      dynamic? produkId}){
    _name = name;
    _harga = harga;
    _qty = qty;
    _total = total;
    _orderId = orderId;
    _produkId = produkId;
}

  OrderDetails.fromJson(dynamic json) {
    _name = json['name'];
    _harga = json['harga'];
    _qty = json['qty'];
    _total = json['total'];
    _orderId = json['orderId'];
    _produkId = json['produkId'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = _name;
    map['harga'] = _harga;
    map['qty'] = _qty;
    map['total'] = _total;
    map['orderId'] = _orderId;
    map['produkId'] = _produkId;
    return map;
  }

}