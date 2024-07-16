import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/list_item.dart';

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<List<ListItem>> fetchListItems() async {
    final response = await http.get(Uri.parse('$baseUrl/test/group_training_object/2'));

    if (response.statusCode == 200) {
      // Декодируем тело ответа с явной указкой на кодировку UTF-8
      final Map<String, dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      List<ListItem> items = [];
      data.forEach((time, activities) {
        for (var activity in activities) {
          items.add(ListItem(
            gtoId: activity['gto_id'],
            dayOfWeek: activity['day_of_week'],
            date: activity['data'],
            timeStart: activity['timeStart'],
            name: activity['name'],
            coachName: activity['coach_name'],
            trainerPhotoUrl: '', // Добавьте это поле в ваш JSON или установите значение по умолчанию
            duration: activity['duration'],
            status: true, // Установите это значение на основе вашей логики
          ));
        }
      });
      return items;
    } else {
      throw Exception('Failed to load list items');
    }
  }
}