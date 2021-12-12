import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:foodlistapp/models/Food.dart';

class FoodApi {
  static Future<List<Food>> getFood() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', 'feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      'x-rapidapi-host': 'yummly2.p.rapidapi.com',
      'x-rapidapi-key': '2c98e3da30msh329997d42fad2c0p1c1085jsn907a8b34d2b6',
      'useQueryString': "true"
    });

    Map data = jsonDecode(response.body);
    List _temporary = [];

    for (var i in data['feed']) {
      _temporary.add(i['content']['details']);
    }

    return Food.foodsFromSnapshot(_temporary);
  }
}
