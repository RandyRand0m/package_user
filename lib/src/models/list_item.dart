import 'package:equatable/equatable.dart';

class ListItem {
  final int id;
  final String title; // Название
  final String trainer; // Тренер
  final String date; // Дата
  final String time; // Время
  final int participantsCount; // Количество участников
  final String status; // Статус

  ListItem({
    required this.id,
    required this.title,
    required this.trainer,
    required this.date,
    required this.time,
    required this.participantsCount,
    required this.status,
  });

  @override
  List<Object> get props => [id, title, trainer, date, time, participantsCount, status];
}