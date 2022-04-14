import "../links.dart";
import "package:http/http.dart";
import "dart:convert";


Future<dynamic> getPaymentStatus({String? idToken,String? status}) async{
  Uri url = Uri.parse("$NETWORK_URL/auth/payment/$status");
  Response response = await post(url, body: {"idToken": idToken});
  if(response.statusCode == 200){
    var data = jsonDecode(response.body);
    return data;
  }
  return null;
}