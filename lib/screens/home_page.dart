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
            if (snapshot.hasError)
              return Center(child: Text("Ops! something went wrong."));
            if (snapshot.hasData) {
              //ads grid is a widget in widgets directory
              return AdsGrid(snapshot.data);
            } else {
              // If there are no data show this
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
