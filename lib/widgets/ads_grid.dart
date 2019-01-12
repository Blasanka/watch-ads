//I wanted to show you the Staggered GridView, so i separate it to another class to improve readability, nothing else
import 'package:flutter/material.dart';

//this is what you need to have for flexible grid
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

//card widget that hold our ad data
import 'package:so_test/widgets/ad_card.dart';

//here is the flexible grid that uses in FutureBuilder, we are mapping each and every item and add to a gridview with ad card
class AdsGrid extends StatelessWidget {
  AdsGrid(this.data);

  final data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      //this is what you actually need
      child: StaggeredGridView.count(
        crossAxisCount: 4, // I only need two card horizontally
        padding: const EdgeInsets.all(2.0),
        children: data.map<Widget>((item) {
          //Do you need to go somewhere when you tap on this card, wrap using InkWell and add your route
          return AdCard(item);
        }).toList(),

        //Here is the place that we are getting flexible/ dynamic card for various images
        staggeredTiles:
            data.map<StaggeredTile>((item) => StaggeredTile.fit(2)).toList(),
        mainAxisSpacing: 3.0,
        crossAxisSpacing: 4.0, // add some space
      ),
    );
  }
}
