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
  
  //Время окончания занятия
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
  // ignore: override_on_non_overriding_member
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