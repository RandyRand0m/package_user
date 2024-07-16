import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/list_item.dart';

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<List<ListItem>> fetchListItems() async {
    final response = await http.get(Uri.parse('$baseUrl/test/group_training_object/0'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      List<ListItem> items = [];

      data.forEach((key, value) {
        if (value is Map<String, dynamic>) {
          value.forEach((time, activities) {
            if (activities is List) {
              for (var activity in activities) {
                items.add(ListItem.fromJson(activity));
              }
            }
          });
        }
      });

      print('Fetched items: ${items.length}');
      return items;
    } else {
      throw Exception('Failed to load list items');
    }
  }
}