//below two imports for fetching data from somewhere on the internet
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:so_test/model/Ad.dart';

//this is should be somewhere else but to keep things simple for you,
Future<List<Ad>> fetchAds() async {
  //the link you want to data from, goes inside get method
  final response = await http.get('https://blasanka.github.io/watch-ads/lib/data/ads.json');
    
  List<Ad> ads = [];
  if (response.statusCode == 200) {
    json.decode(response.body).forEach((data) {
      ads.add(Ad.fromJson(data));
    });
  }
  return ads;
}
