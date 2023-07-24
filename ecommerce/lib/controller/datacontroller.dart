import "dart:convert";

import "package:ecommerce/model/product.dart";
import "package:http/http.dart" as http;

void main() {
  Datafetch().fetchProducts();
}

class Datafetch {
  Future fetchProducts() async {
    try {
      var url = Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline',
      );
      var data = await http.get(url);

      if (data.statusCode != 200) {
        return "not fetched";
      }
      print(jsonDecode(data.body));
      if (data == null) {
        return "nothing";
      }
      return Products().tojson(jsonDecode(data.body));
    } catch (e) {
      print(e.toString());
    }
  }
}
