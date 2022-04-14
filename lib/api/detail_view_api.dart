import "../links.dart";
import "package:http/http.dart";
import "dart:convert";

Future<dynamic> getProductDetail({String? category, String? uniqueKey}) async {
  Uri url = Uri.parse("$NETWORK_URL/client/detail/$category/$uniqueKey");
  Response response = await get(url);
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data;
  }
  return null;
}

Future<dynamic> getProductReviews({String? category, String? uniqueKey}) async {
  Uri url = Uri.parse("$NETWORK_URL/client/viewreview/$category/$uniqueKey");
  Response response = await get(url);
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data;
  }
  return null;
}

Future<dynamic> addProductToCart(
    {dynamic idToken,
    String? category,
    String? productKey,
    int? quantity,
    int? price}) async {
  Uri url = Uri.parse("$NETWORK_URL/client/update_cart");
  dynamic data = {
    "idToken": idToken,
    "category": category,
    "product_id": productKey,
    "quantity": quantity.toString(),
    "price": price.toString(),
    "add": true.toString(),
    "index": "-1",
    "is_qty": false.toString(),
  };
  Response response = await post(url, body: data);

  return response.body;
}

Future<void> submitReview(
    {String? idToken,
    String? category,
    String? id,
    String? title,
    String? description,
    double? rating}) async {
  Uri url = Uri.parse("$NETWORK_URL/client/review");
  dynamic rate = rating?.toInt();
  dynamic info = {
    "idToken" : idToken,
    "category" : category,
    "title" : title,
    "description" : description,
    "rating" : rate.toString(),
    "id" : id,
  };
  Response response = await post(url,body: info);
  print(response);
}
