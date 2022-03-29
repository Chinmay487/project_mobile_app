import "../links.dart";
import "package:http/http.dart";
import "dart:convert";

Future<dynamic> getProductList({String? category, int? pageNumber}) async {
  Uri url = Uri.parse("$NETWORK_URL/client/category/$category/$pageNumber");
  Response response = await get(url);
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data;
  }
  return null;
}