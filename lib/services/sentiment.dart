import 'package:ebusticketing/services/networking.dart';


const apiKey = '12a3df7edea408f3c2c0aae5666e3745';
const url = 'https://api.openweathermap.org/data/2.5/weather';
class Sentiment{
  Future<dynamic> sentiment() async{
    NetworkHelper networkHelper = NetworkHelper('$url?q=kathmandu&appid=$apiKey&units=metric');
    var responseData = await networkHelper.getData();
//    print(responseData['main']['temp']);
//    print(responseData);
    return responseData;
  }
}



//https://api.openweathermap.org/data/2.5/weather?q=kathmandu&appid=12a3df7edea408f3c2c0aae5666e3745&units=metric