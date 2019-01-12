import 'package:flutter/material.dart';
import 'package:so_test/model/Ad.dart';

//This is actually not need to be a StatefulWidget but in case, I have it
class AdCard extends StatefulWidget {
  AdCard(this.ad);

  // getting an ad from the grid view through contructor
  final Ad ad;

  _AdCardState createState() => _AdCardState();
}

class _AdCardState extends State<AdCard> {
  //to keep things readable
  Ad _ad;

  void initState() {
    setState(() {
      _ad = widget.ad;
    });

    super.initState();
  }

  //if json file contains imageUrl propery but empty value, still we have to provide a image url to Image.network
  Widget getImagewidget() => (_ad.imageUrl == '')
      ? Image.network('https://uae.microless.com/cdn/no_image.jpg')
      : Image.network(_ad.imageUrl);

  //if there are no title we dont need to show empty space on the card.
  Widget getTitleWidget() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
        child: (_ad.title != '')
            ? Text(_ad.title, style: TextStyle(fontWeight: FontWeight.w500))
            : SizedBox(),
      );

  //Same as above reason, if no price
  Widget getPriceWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
      child: (_ad.price != '') ? Text('\$ ${_ad.price}') : SizedBox(),
    );
  }

  //Same as above reason, if no location
  Widget getLocationWidget() {
    return (_ad.location != '')
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size: 14.0,
                ),
                SizedBox(
                  width: 3.0,
                ),
                Expanded(
                  //Expanded to wrap up the text in Row widge, to avoid text overflowing in small devices.
                  child: Text(_ad.location),
                )
              ],
            ),
          )
        : SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getImagewidget(),
          getTitleWidget(),
          getPriceWidget(),
          getLocationWidget()
        ],
      ),
    );
  }
}
