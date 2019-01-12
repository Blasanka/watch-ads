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

  //if there is no property to map below variable we are adding empty text to avoid null
  Ad.fromJson(Map<String, dynamic> json)
      : title = json['title'] ?? '',
        price = json['price'] ?? '',
        imageUrl = json['imageUrl'] ?? 'https://uae.microless.com/cdn/no_image.jpg',//if image is null we can add default image
        location = json['location'] ?? '';

  Map<String, dynamic> toJson() => {
        'title': title ?? '',
        'price': price ?? '',
        'imageUrl': imageUrl ?? 'https://uae.microless.com/cdn/no_image.jpg',//if image is null we can add default image
        'location': location ?? ''
      };
}