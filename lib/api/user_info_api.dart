import 'package:flutter/cupertino.dart';

import "../links.dart";
import "package:http/http.dart";
import "dart:convert";

Future<dynamic> getUserCart(idToken) async {
  Uri url = Uri.parse("$NETWORK_URL/auth/info");
  Response response = await post(url, body: {"idToken": idToken});
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data;
  }
  return null;
}

Future<dynamic> getUserCartInfo(idToken) async {
  Uri url = Uri.parse("$NETWORK_URL/client/get_cart");
  Response response = await post(url, body: {"idToken": idToken});
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data;
  }
  return null;
}

Future<dynamic> updateProductQuantity(
    {String? idToken,
    String? category,
    int? quantity,
    int? price,
    int? index,
    String? uniqueKey}) async {
  Uri url = Uri.parse("$NETWORK_URL/client/update_cart");
  dynamic data = {
    "product_id": uniqueKey,
    "category": category,
    "quantity": "$quantity",
    "add": false.toString(),
    "index": "$index",
    "is_qty": true.toString(),
    "idToken": idToken,
    "price": "$price",
  };
  // print("Update  Product Quantity : $data");
  Response response = await post(url, body: data);
  if (response.statusCode == 200) {
    var responseData = jsonDecode(response.body);
    return responseData;
  }
  return null;
}

Future<dynamic> getAmount({String? idToken}) async {
  Uri url = Uri.parse("$NETWORK_URL/client/bill");
  dynamic data = {
    "idToken": idToken,
  };
  Response response = await post(url, body: data);
  if (response.statusCode == 200) {
    var responseData = jsonDecode(response.body);
    return responseData;
  }
  return null;
}

Future<void> removeFromCart({int? index, String? idToken, int? price}) async {
  Uri url = Uri.parse("$NETWORK_URL/client/update_cart");
  dynamic data = {
    "product_id": "",
    "quantity": "",
    "add": false.toString(),
    "index": index.toString(),
    "is_qty": false.toString(),
    "idToken": idToken,
    "price": price.toString(),
    "category": "",
  };
  Response response = await post(url, body: data);
}

Future<void> removeAddress({String? idToken, int? index}) async {
  Uri url = Uri.parse("$NETWORK_URL/auth/update_address");
  dynamic data = {
    "address": '',
    "idToken": idToken,
    "add": false.toString(),
    "index": "$index",
    "isMobile":"0"
  };
  Response res = await post(url, body: data);
  print(res);
}

Future<void> addNewAddress(
    {String? idToken,
    String? line1,
    String? line2,
    String? city,
    String? district,
    String? state,
    String? pin}) async {
  Uri url = Uri.parse("$NETWORK_URL/auth/update_address");
  // Map<dynamic,dynamic> address = <String,String>{
  //   "line1": line1!,
  //   "line2": line2!,
  //   "city": city!,
  //   "district": district!,
  //   "state": state!,
  //   "pin": pin!,
  // };
  dynamic data = {
    "idToken": idToken!,
    "add": true.toString(),
    "index": "",
    "isMobile":"1",
    "line1": line1,
    "line2": "$line2",
    "city": "$city",
    "district": "$district",
    "state": "$state",
    "pin": "$pin",
  } ;

  Response response = await post(url,body:data);
  if(response.statusCode == 200){
    var responseData = jsonDecode(response.body);
    print(responseData);
  }
}
