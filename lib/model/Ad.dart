class Ad {
  final String title;
  final String price;
  final String imageUrl;
  final String location;

  const Ad({
    this.title,
    this.price,
    this.imageUrl,
    this.location,
  });

  Ad.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        price = json['price'],
        imageUrl = json['imageUrl'],
        location = json['location'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'price': price,
        'imageUrl': imageUrl,
        'location': location
      };
}