// import 'package:my_app/model/Allcategories.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ApiService {
//   static Future<List<Classification>> fetchData() async {
//     final response =
//         await http.get(Uri.parse('http://127.0.0.1:8000/api/AllCategoresApi'));

//     if (response.statusCode == 200) {
//       List<dynamic> jsonResponse = json.decode(response.body);

//       return jsonResponse.map((data) => Classification.fromJson(data)).toList();
//     } else {
//       throw Exception('Faild to load data');
//     }
//   }
// }
