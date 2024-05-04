import 'package:flutter/material.dart';
import 'package:my_app/products/productDetails.dart';

class ProductsWidget extends StatelessWidget {
  final List<dynamic> products;

  ProductsWidget(this.products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Center(
        child: products.isEmpty
            ? CircularProgressIndicator() // Display a loading indicator while fetching data
            : ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(product),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Product Image
                            Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.grey[300], // Placeholder color
                              ),
                              child: product['ImageUrl'] != null
                                  ? Image.network(
                                      product['ImageUrl'],
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      'https://picsum.photos/200/300', // Random image from Lorem Picsum
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            SizedBox(width: 16.0),
                            // Product Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product['ProductName'] ?? '',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    product['Description'] ?? '',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey[600]),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Price: ${product['Price']}',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
