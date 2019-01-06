//below two imports for fetching data from somewhere on the internet
import 'dart:convert';
import 'package:http/http.dart' as http;

//this is should be somewhere else but to keep things simple for you,
Future<List> fetchAds() async {
  final response = await http.get('https://github.com/blasanka/watch-ads/ads.json');
    
  if (response.statusCode == 200) return json.decode(response.body);
  return [];
}
