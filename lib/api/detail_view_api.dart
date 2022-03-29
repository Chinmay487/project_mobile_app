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
