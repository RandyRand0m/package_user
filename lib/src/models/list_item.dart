import 'package:equatable/equatable.dart';

class ListItem {
  final int gtoId;
  final String dayOfWeek;
  final String date;
  final String timeStart;
  final String name;
  final String coachName;
  final String trainerPhotoUrl;
  final int duration;
  final bool status;

  ListItem({
    required this.gtoId,
    required this.dayOfWeek,
    required this.date,
    required this.timeStart,
    required this.name,
    required this.coachName,
    required this.trainerPhotoUrl,
    required this.duration,
    required this.status,
  });

  factory ListItem.fromJson(Map<String, dynamic> json) {
    return ListItem(
      gtoId: json['gto_id'],
      dayOfWeek: json['day_of_week'],
      date: json['data'],
      timeStart: json['timeStart'],
      name: json['name'],
      coachName: json['coach_name'],
      trainerPhotoUrl: json['trainer_photo_url'] ?? '',
      duration: json['duration'],
      status: true,
    );
  }
  

  String get endTime {
    final startTime = DateTime.parse(date).add(Duration(hours: int.parse(timeStart.split(":")[0]), minutes: int.parse(timeStart.split(":")[1])));
    final endTime = startTime.add(Duration(minutes: duration));
    return '${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}';
  }

  ListItem copyWith({
    int? gtoId,
    String? dayOfWeek,
    String? date,
    String? timeStart,
    String? name,
    String? coachName,
    String? trainerPhotoUrl,
    int? duration,
    bool? status,
  }) {
    return ListItem(
      gtoId: gtoId ?? this.gtoId,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      date: date ?? this.date,
      timeStart: timeStart ?? this.timeStart,
      name: name ?? this.name,
      coachName: coachName ?? this.coachName,
      trainerPhotoUrl: trainerPhotoUrl ?? this.trainerPhotoUrl,
      duration: duration ?? this.duration,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        gtoId,
        dayOfWeek,
        date,
        timeStart,
        name,
        coachName,
        trainerPhotoUrl,
        duration,
        status,
      ];
}

// import 'package:equatable/equatable.dart';

// class ListItem extends Equatable {
//   final int gtoId; 
//   final String dayOfWeek; // День недели
//   final String date; // Дата
//   final String timeStart; // Время начала
//   final String name; // Название
//   final String coachName;
//   final String trainerPhotoUrl; // URL фотографии // Имя тренера
//   final int duration; // Продолжительность
//   final bool status; 

//   ListItem({
//     required this.gtoId,
//     required this.dayOfWeek,
//     required this.date,
//     required this.timeStart,
//     required this.name,
//     required this.coachName,
//     required this.trainerPhotoUrl,
//     required this.duration,
//     this.status = false,
//   });

//   @override
//   List<Object> get props => [gtoId, dayOfWeek, date, timeStart, name, coachName, duration, status];

// }

// extension ListItemExtension on ListItem {
//   ListItem copyWith({
//     int? gtoId,
//     String? dayOfWeek,
//     String? date,
//     String? timeStart,
//     String? name,
//     String? coachName,
//     String? trainerPhotoUrl,
//     int? duration,
//     bool? isEnrolled,
//   }) {
//     return ListItem(
//       gtoId: gtoId ?? this.gtoId,
//       dayOfWeek: dayOfWeek ?? this.dayOfWeek,
//       date: date ?? this.date,
//       timeStart: timeStart ?? this.timeStart,
//       name: name ?? this.name,
//       coachName: coachName ?? this.coachName,
//       trainerPhotoUrl: trainerPhotoUrl ?? this.trainerPhotoUrl,
//       duration: duration ?? this.duration,
//       status: isEnrolled ?? this.status,
//     );
//   }
//   String get endTime {
//     final startTime = DateTime.parse('$date $timeStart');
//     final endTime = startTime.add(Duration(minutes: duration));
//     return '${_formatTime(startTime)} - ${_formatTime(endTime)}';
//   }

//   String _formatTime(DateTime time) {
//     return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
//   }

//   @override
//   List<Object> get props => [gtoId, dayOfWeek, date, timeStart, name, coachName, trainerPhotoUrl, duration, status];
// }
