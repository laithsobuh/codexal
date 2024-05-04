import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/model/Allcategories.dart';
import 'package:my_app/products/ProductsWidget.dart';

class HomeScreen extends StatefulWidget {
  final String user;
  final String email;

  HomeScreen(this.user,this.email);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Classification> classifications = [];
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/AllCategoresApi'));
    if (response.statusCode == 200) {
      setState(() {
        classifications = (json.decode(response.body) as List)
            .map((data) => Classification.fromJson(data))
            .toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
    final responseProducts =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/AllproductsApi'));
    if (responseProducts.statusCode == 200) {
      setState(() {
        products = json.decode(responseProducts.body);
      });
    } else {
      throw Exception('Failed to load product data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classifications'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(widget.user), // Displaying user
              accountEmail: Text(
                  widget.email), // You can replace it with actual email if available
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            for (var classification in classifications)
              ExpansionTile(
                title: Text(classification.classificationName),
                children: [
                  for (var group in classification.categoryGroups)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Text(
                            group.categoriesGroupName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Column(
                          children: group.categories.map((category) {
                            return ListTile(
                              title: Text(category.categoryName),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                ],
              ),
          ],
        ),
      ),
      body: ProductsWidget(products)
    );
  }
}
