import 'package:flutter/material.dart';

//this is what you need to have for flexible grid
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

//this is where we fetching data from internet
import 'services/ad_service.dart';

//card widget that hold our ad data
import 'ad_card.dart';

//here is the flexible grid in FutureBuilder that map each and every item and add to a gridview with ad card
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
              return new Padding(
                padding: const EdgeInsets.all(4.0),
                //this is what you actually need
                child: new StaggeredGridView.count(
                  crossAxisCount: 4, // I only need two card horizontally
                  padding: const EdgeInsets.all(2.0),
                  children: snapshot.data.map<Widget>((item) {
                    //Do you need to go somewhere when you tap on this card, wrap using InkWell and add your route
                    return new AdCard(item);
                  }).toList(),

                  //Here is the place that we are getting flexible/ dynamic card for various images
                  staggeredTiles: snapshot.data
                      .map<StaggeredTile>((item) => StaggeredTile.fit(2))
                      .toList(),
                  mainAxisSpacing: 3.0,
                  crossAxisSpacing: 4.0, // add some space
                ),
              );
            } else {
              return Center(
                  child:
                      new CircularProgressIndicator()); // If there are no data show this
            }
          }),
    );
  }
}
