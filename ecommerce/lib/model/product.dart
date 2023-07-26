class Products {
  int? id;
  String? name;
  String? brand;
  String? price;
  double? rating;
  String? description;
  dynamic image;

  List<Map<String, dynamic>> tojson(List<dynamic> data) {
    print(data.length);
    List<Map<String, dynamic>> map =
        List.generate(data.length, (index) => Map<String, dynamic>());
    for (int i = 0; i < data.length; i++) {
      map[i]['name'] = data[i]['name'];
      map[i]['id'] = data[i]['id'];
      map[i]['brand'] = data[i]['brand'];
      map[i]['price'] = data[i]['price'];
      map[i]['rating'] = data[i]['rating'];
      map[i]['description'] = data[i]['description'];
      map[i]['image'] = data[i]['image_link'];
    }

    return map;
  }
}
