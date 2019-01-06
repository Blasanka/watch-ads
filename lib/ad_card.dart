import 'package:flutter/material.dart';

//This is actually not need to be a StatefulWidget but in case, I have it
class AdCard extends StatefulWidget {
  AdCard(this.ad);

  final ad;

  _AdCardState createState() => _AdCardState();
}

class _AdCardState extends State<AdCard> {
  //to keep things readable
  var _ad;
  String _imageUrl;
  String _title;
  String _price;
  String _location;

  void initState() { 
    setState(() {
      _ad = widget.ad;
      //if values are not null only we need to show them
      _imageUrl = (_ad['imageUrl'] != "") ? _ad['imageUrl'] : 'https://uae.microless.com/cdn/no_image.jpg';
      _title = (_ad['title'] != "") ? _ad['title'] : '';
      _price = (_ad['price'] != "") ? _ad['price'] : '';
      _location = (_ad['location'] != "") ? _ad['location'] : '';
    });

    super.initState();
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
            Image.network(_imageUrl),
            Text(_title),
            Text('\$ $_price'),
            Text(_location),
          ],
        ),
    );
  }
}