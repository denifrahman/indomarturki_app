/// message : "success retreive data"
/// statusCode : 200
/// data : [{"id":4,"orderNumber":"ORDER1628586742796","orderTotal":12,"orderDiskon":0,"orderTotalDiskon":0,"userId":14,"orderUserALamat":"test alamat","orderUserTelp":"0813355685","createdAt":"2021-08-10T09:12:23.000Z","updatedAt":"2021-08-10T09:12:23.000Z","orderDetails":[{"id":4,"name":"Bumbu Nasi goreng pedas","harga":6,"qty":2,"total":12,"orderId":4,"produkId":1,"createdAt":"2021-08-10T09:12:26.000Z","updatedAt":"2021-08-10T09:12:26.000Z"}]},{"id":5,"orderNumber":"ORDER1628587047421","orderTotal":12,"orderDiskon":0,"orderTotalDiskon":0,"userId":14,"orderUserALamat":"test alamat","orderUserTelp":"0813355685","createdAt":"2021-08-10T09:17:27.000Z","updatedAt":"2021-08-10T09:17:27.000Z","orderDetails":[{"id":5,"name":"Bumbu Nasi goreng pedas","harga":6,"qty":2,"total":12,"orderId":5,"produkId":1,"createdAt":"2021-08-10T09:17:33.000Z","updatedAt":"2021-08-10T09:17:33.000Z"}]},{"id":6,"orderNumber":"ORDER1628587810086","orderTotal":12,"orderDiskon":0,"orderTotalDiskon":0,"userId":14,"orderUserALamat":"test alamat","orderUserTelp":"0813355685","createdAt":"2021-08-10T09:30:10.000Z","updatedAt":"2021-08-10T09:30:10.000Z","orderDetails":[{"id":6,"name":"Bumbu Nasi goreng pedas","harga":6,"qty":2,"total":12,"orderId":6,"produkId":1,"createdAt":"2021-08-10T09:30:13.000Z","updatedAt":"2021-08-10T09:30:13.000Z"}]},{"id":7,"orderNumber":"ORDER1628598403738","orderTotal":5.4,"orderDiskon":10,"orderTotalDiskon":0.6,"userId":14,"orderUserALamat":"test alamat","orderUserTelp":"0813355685","createdAt":"2021-08-10T12:26:45.000Z","updatedAt":"2021-08-10T12:26:45.000Z","orderDetails":[{"id":7,"name":"Bumbu Nasi goreng pedas","harga":6,"qty":1,"total":6,"orderId":7,"produkId":1,"createdAt":"2021-08-10T12:26:47.000Z","updatedAt":"2021-08-10T12:26:47.000Z"}]},{"id":8,"orderNumber":"ORDER1628600374828","orderTotal":12.6,"orderDiskon":1,"orderTotalDiskon":0,"userId":14,"orderUserALamat":"test alamat","orderUserTelp":"0813355685","createdAt":"2021-08-10T12:59:36.000Z","updatedAt":"2021-08-10T12:59:36.000Z","orderDetails":[{"id":8,"name":"Bumbu Nasi goreng pedas","harga":6,"qty":1,"total":6,"orderId":8,"produkId":1,"createdAt":"2021-08-10T12:59:37.000Z","updatedAt":"2021-08-10T12:59:37.000Z"},{"id":9,"name":"Sarden ABC","harga":4,"qty":2,"total":8,"orderId":8,"produkId":2,"createdAt":"2021-08-10T12:59:37.000Z","updatedAt":"2021-08-10T12:59:37.000Z"}]},{"id":9,"orderNumber":"ORDER1628605105425","orderTotal":18,"orderDiskon":2,"orderTotalDiskon":0,"userId":14,"orderUserALamat":"Bronggalan Sawah","orderUserTelp":"0813355685","createdAt":"2021-08-10T14:18:24.000Z","updatedAt":"2021-08-10T14:18:24.000Z","orderDetails":[{"id":10,"name":"Bumbu Nasi goreng pedas","harga":6,"qty":7,"total":12,"orderId":9,"produkId":1,"createdAt":"2021-08-10T14:18:27.000Z","updatedAt":"2021-08-10T14:18:27.000Z"},{"id":11,"name":"Sarden ABC","harga":4,"qty":2,"total":8,"orderId":9,"produkId":2,"createdAt":"2021-08-10T14:18:27.000Z","updatedAt":"2021-08-10T14:18:27.000Z"}]},{"id":10,"orderNumber":"ORDER1629617377996","orderTotal":8,"orderDiskon":0,"orderTotalDiskon":0,"userId":14,"orderUserALamat":"test alamat","orderUserTelp":"0813355685","createdAt":"2021-08-22T07:29:38.000Z","updatedAt":"2021-08-22T07:29:38.000Z","orderDetails":[{"id":12,"name":"Sarden ABC","harga":4,"qty":2,"total":8,"orderId":10,"produkId":2,"createdAt":"2021-08-22T07:29:39.000Z","updatedAt":"2021-08-22T07:29:39.000Z"}]}]

class OrderByUserIdResponse {
  String? _message;
  dynamic? _statusCode;
  List<Data>? _data;

  String? get message => _message;
  dynamic? get statusCode => _statusCode;
  List<Data>? get data => _data;

  OrderByUserIdResponse({
      String? message, 
      dynamic? statusCode, 
      List<Data>? data}){
    _message = message;
    _statusCode = statusCode;
    _data = data;
}

  OrderByUserIdResponse.fromJson(dynamic json) {
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

/// id : 4
/// orderNumber : "ORDER1628586742796"
/// orderTotal : 12
/// orderDiskon : 0
/// orderTotalDiskon : 0
/// userId : 14
/// orderUserALamat : "test alamat"
/// orderUserTelp : "0813355685"
/// createdAt : "2021-08-10T09:12:23.000Z"
/// updatedAt : "2021-08-10T09:12:23.000Z"
/// orderDetails : [{"id":4,"name":"Bumbu Nasi goreng pedas","harga":6,"qty":2,"total":12,"orderId":4,"produkId":1,"createdAt":"2021-08-10T09:12:26.000Z","updatedAt":"2021-08-10T09:12:26.000Z"}]

class Data {
  dynamic? _id;
  String? _orderNumber;
  dynamic? _orderTotal;
  dynamic? _orderDiskon;
  dynamic? _orderTotalDiskon;
  dynamic? _userId;
  String? _orderUserALamat;
  String? _orderUserTelp;
  String? _createdAt;
  String? _updatedAt;
  List<OrderDetails>? _orderDetails;

  dynamic? get id => _id;
  String? get orderNumber => _orderNumber;
  dynamic? get orderTotal => _orderTotal;
  dynamic? get orderDiskon => _orderDiskon;
  dynamic? get orderTotalDiskon => _orderTotalDiskon;
  dynamic? get userId => _userId;
  String? get orderUserALamat => _orderUserALamat;
  String? get orderUserTelp => _orderUserTelp;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<OrderDetails>? get orderDetails => _orderDetails;

  Data({
      dynamic? id, 
      String? orderNumber, 
      dynamic? orderTotal, 
      dynamic? orderDiskon, 
      dynamic? orderTotalDiskon, 
      dynamic? userId, 
      String? orderUserALamat, 
      String? orderUserTelp, 
      String? createdAt, 
      String? updatedAt, 
      List<OrderDetails>? orderDetails}){
    _id = id;
    _orderNumber = orderNumber;
    _orderTotal = orderTotal;
    _orderDiskon = orderDiskon;
    _orderTotalDiskon = orderTotalDiskon;
    _userId = userId;
    _orderUserALamat = orderUserALamat;
    _orderUserTelp = orderUserTelp;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _orderDetails = orderDetails;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _orderNumber = json['orderNumber'];
    _orderTotal = json['orderTotal'];
    _orderDiskon = json['orderDiskon'];
    _orderTotalDiskon = json['orderTotalDiskon'];
    _userId = json['userId'];
    _orderUserALamat = json['orderUserALamat'];
    _orderUserTelp = json['orderUserTelp'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    if (json['orderDetails'] != null) {
      _orderDetails = [];
      json['orderDetails'].forEach((v) {
        _orderDetails?.add(OrderDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['orderNumber'] = _orderNumber;
    map['orderTotal'] = _orderTotal;
    map['orderDiskon'] = _orderDiskon;
    map['orderTotalDiskon'] = _orderTotalDiskon;
    map['userId'] = _userId;
    map['orderUserALamat'] = _orderUserALamat;
    map['orderUserTelp'] = _orderUserTelp;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    if (_orderDetails != null) {
      map['orderDetails'] = _orderDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 4
/// name : "Bumbu Nasi goreng pedas"
/// harga : 6
/// qty : 2
/// total : 12
/// orderId : 4
/// produkId : 1
/// createdAt : "2021-08-10T09:12:26.000Z"
/// updatedAt : "2021-08-10T09:12:26.000Z"

class OrderDetails {
  dynamic? _id;
  String? _name;
  dynamic? _harga;
  dynamic? _qty;
  dynamic? _total;
  dynamic? _orderId;
  dynamic? _produkId;
  String? _createdAt;
  String? _updatedAt;

  dynamic? get id => _id;
  String? get name => _name;
  dynamic? get harga => _harga;
  dynamic? get qty => _qty;
  dynamic? get total => _total;
  dynamic? get orderId => _orderId;
  dynamic? get produkId => _produkId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  OrderDetails({
      dynamic? id, 
      String? name, 
      dynamic? harga, 
      dynamic? qty, 
      dynamic? total, 
      dynamic? orderId, 
      dynamic? produkId, 
      String? createdAt, 
      String? updatedAt}){
    _id = id;
    _name = name;
    _harga = harga;
    _qty = qty;
    _total = total;
    _orderId = orderId;
    _produkId = produkId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  OrderDetails.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _harga = json['harga'];
    _qty = json['qty'];
    _total = json['total'];
    _orderId = json['orderId'];
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
    map['orderId'] = _orderId;
    map['produkId'] = _produkId;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}