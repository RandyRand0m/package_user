import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/list_item.dart';

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<List<ListItem>> fetchListItems() async {
    final response =
        await http.get(Uri.parse('$baseUrl/test/group_training_object/1'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      List<ListItem> items = [];

      data.forEach((key, value) {
        for (var itemData in value) {
          items.add(ListItem.fromJson(itemData));
        }
      });

      return items;
    } else {
      throw Exception('Failed to load list items');
    }
  }
}
