import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_user/package_user.dart';

class MyCalendar extends StatefulWidget {
  final List<ListItem> listItems;

  const MyCalendar({super.key, required this.listItems});

  @override
  _MyCalendarState createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.utc(2024, 1, 1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2024, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = DateTime.utc(2024, 1, 1);
              _focusedDay = focusedDay;
            });

            Future.delayed(const Duration(milliseconds: 50), () {
              setState(() {
                _selectedDay = selectedDay;
              });
            });
          },
          calendarFormat: CalendarFormat.week,
          startingDayOfWeek: StartingDayOfWeek.monday,
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
          calendarStyle: const CalendarStyle(
            selectedDecoration: BoxDecoration(
              color: Color.fromARGB(255, 187, 94, 230),
              shape: BoxShape.circle,
            ),
            todayDecoration: BoxDecoration(
              color: Color.fromRGBO(204, 204, 204, 1),
              shape: BoxShape.circle,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: _buildScheduleForSelectedDay(),
        ),
      ],
    );
  }

  Widget _buildScheduleForSelectedDay() {
    if (_selectedDay == null) {
      return const Center(
        child: Text('Выберите день для просмотра расписания'),
      );
    }

    final daySchedule = widget.listItems
        .where((item) => isSameDay(DateTime.parse(item.date), _selectedDay!))
        .toList();

    if (daySchedule.isEmpty) {
      return const Center(
        child: Text('Нет расписания для выбранного дня'),
      );
    }

    return ListView.builder(
      itemCount: daySchedule.length,
      itemBuilder: (context, index) {
        return BlocProvider(
          create: (context) => ListItemCubit()..loadListItem(daySchedule[index]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListItemWidget(item: daySchedule[index]),
              NearestEntry(item: daySchedule[index]),
            ],
          ),
        );
      },
    );
  }
}