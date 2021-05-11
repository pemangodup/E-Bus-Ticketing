import 'dart:convert';
import 'package:http/http.dart' as http;


class NetworkHelper{

  NetworkHelper(this.url);
  final String url;

  Future getData() async{
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    }else{
      print(response.statusCode);
    }
  }

  Future<dynamic> postData() async{
    Map data={'sentence':'he is good'};
    final response=await http.post("$url:5000/sentiment",body: data);
    print(response);
    return response;
  }
}

//http://192.168.1.64

