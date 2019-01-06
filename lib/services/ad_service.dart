//below two imports for fetching data from somewhere on the internet
import 'dart:convert';
import 'package:http/http.dart' as http;

//this is should be somewhere else but to keep things simple for you,
Future<List> fetchAds() async {
  //the link you want to data from, goes inside get method
  final response = await http.get('https://blasanka.github.io/watch-ads/lib/data/ads.json');
    
  if (response.statusCode == 200) return json.decode(response.body);
  return [];
}
