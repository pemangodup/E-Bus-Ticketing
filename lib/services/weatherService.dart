import 'dart:convert';
import 'package:http/http.dart' as http;



class Networking{
  final String url;
  Networking(this.url);

  Future getData() async{
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      String data = response.body;
      var decodedData = jsonDecode(data);
      print('Total: ${decodedData.length}');
      return decodedData[0]['Confirmed'];
    }else{
      String errorMessage = "error";
      return errorMessage;
    }
  }
}



