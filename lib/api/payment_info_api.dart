import "../links.dart";
import "package:http/http.dart";
import "dart:convert";

Future<dynamic> getPaymentKeys({String? idToken}) async{
    Uri url = Uri.parse("${NETWORK_URL}/payment/keys");
    Response response = await post(url,body:{"idToken":idToken});
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return data;
    }
    return null;
}

Future<void> paymentSuccess({String? idToken,String? paymentId,int? addressIndex}) async{
  print("sending to server");
  Uri url = Uri.parse("${NETWORK_URL}/payment/success");
  dynamic data = {
    "idToken" : idToken,
    "payment_id" : paymentId,
    "shipping_address" : "$addressIndex"
  };
  Response response = await post(url,body:data);
  print(response);
}

