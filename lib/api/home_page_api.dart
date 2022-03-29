import "../links.dart";
import "package:http/http.dart";
import "dart:convert";

Future<dynamic> getHomePageCategories({String? category}) async {
  Uri url = Uri.parse("${NETWORK_URL}/client/fetch/${category!}");
  Response response = await get(url);
  if(response.statusCode == 200){
    var data = jsonDecode(response.body);
    return data;
  }
  return null;
}

