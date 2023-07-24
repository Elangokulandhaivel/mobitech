class Products {
  int? id;
  String? name;
  String? brand;
  String? price;
  double? rating;
  String? description;
  dynamic image;

  tojson(List<dynamic> data) {
    name = data[0]['name'];
    id = data[0]['id'];
    brand = data[0]['brand'];
    price = data[0]['price'];
    rating = data[0]['rating'];
    description = data[0]['description'];
    image = data[0]['image_link'];
  }
}
