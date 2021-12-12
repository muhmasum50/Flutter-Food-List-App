import 'package:flutter/material.dart';
import 'package:foodlistapp/pages/widgets/FoodCard.dart';
import 'package:foodlistapp/models/Food.dart';
import 'package:foodlistapp/api/FoodApi.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Food> _foods;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getFoods();
  }

  Future<void> getFoods() async {
    _foods = await FoodApi.getFood();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text("Food Menu's")
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _foods.length,
                itemBuilder: (context, index) {
                  return FoodCard(
                      title: _foods[index].name,
                      cookTime: _foods[index].totalTime,
                      rating: _foods[index].rating.toString(),
                      thumbnailUrl: _foods[index].image);
                },
              ));
  }
}
