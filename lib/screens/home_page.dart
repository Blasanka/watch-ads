import 'package:flutter/material.dart';

//this is where we fetching data from internet
import 'package:so_test/services/ad_service.dart';

//Just to keep file readable I divided our gridview into a separate file
import 'package:so_test/widgets/ads_grid.dart';

//here is our home page/screen that fetches data using FutureBuilder and applying to our gridview
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Watch Ads"),
      ),
      body: FutureBuilder<List>(
          future: fetchAds(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return AdsGrid(snapshot.data);//ads grid is a widget in widgets directory
            } else {
              return Center(
                child: CircularProgressIndicator(),
              ); // If there are no data show this
            }
          }),
    );
  }
}