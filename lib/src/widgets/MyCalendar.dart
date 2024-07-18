import 'package:flutter/material.dart';
import 'package:package_user/package_user.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyCalendar extends StatefulWidget {
  final ApiService apiService;

  const MyCalendar({super.key, required this.apiService});

  @override
  _MyCalendarState createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  List<ListItem> _listItems = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchListItems();
  }

  Future<void> _fetchListItems() async {
    try {
      final items = await widget.apiService.fetchListItems();
      setState(() {
        _listItems = items;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Не удалось загрузить элементы списка: $e');
    }
  }

  String _getRussianWeekday(int weekday) {
    switch (weekday) {
      case 1:
        return 'Пн';
      case 2:
        return 'Вт';
      case 3:
        return 'Ср';
      case 4:
        return 'Чт';
      case 5:
        return 'Пт';
      case 6:
        return 'Сб';
      case 7:
        return 'Вс';
      default:
        return '';
    }
  }

  String _getRussianMonth(int month) {
    switch (month) {
      case 1:
        return 'Январь';
      case 2:
        return 'Февраль';
      case 3:
        return 'Март';
      case 4:
        return 'Апрель';
      case 5:
        return 'Май';
      case 6:
        return 'Июнь';
      case 7:
        return 'Июль';
      case 8:
        return 'Август';
      case 9:
        return 'Сентябрь';
      case 10:
        return 'Октябрь';
      case 11:
        return 'Ноябрь';
      case 12:
        return 'Декабрь';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          rowHeight: 70.0,
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
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            titleTextFormatter: (date, locale) {
              return '${_getRussianMonth(date.month)} ${date.year}';
            },
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(color: Colors.transparent),
            weekendStyle: TextStyle(color: Colors.transparent),
            dowTextFormatter: (date, locale) {
              return _getRussianWeekday(date.weekday);
            },
          ),
          //Не выбранный день
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, date, _) {
              bool isWeekend = date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
              return SizedBox(
                width: 41,
                height: 65,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 218, 208, 227),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${_getRussianWeekday(date.weekday)}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: isWeekend ? Colors.black.withOpacity(0.4) : Colors.black),
                      ),
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 218, 208, 227),
                        ),
                        child: Center(
                          child: Text(
                            '${date.day}',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: isWeekend ? Colors.black.withOpacity(0.4) : Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            //Сегодняшний день
            todayBuilder: (context, date, _) {
              bool isWeekend = date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
              return SizedBox(
                width: 41,
                height: 65,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 214, 181, 255),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${_getRussianWeekday(date.weekday)}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: isWeekend ? Colors.black.withOpacity(0.4) : Colors.black),
                      ),
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 214, 181, 255)
                        ),
                        child: Center(
                          child: Text(
                            '${date.day}',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: isWeekend ? Colors.black.withOpacity(0.4) : Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            //выбранный день
            selectedBuilder: (context, date, _) {
              bool isWeekend = date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
              return SizedBox(
                width: 41,
                height: 65,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 186, 135, 252),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${_getRussianWeekday(date.weekday)}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: isWeekend ? Colors.black.withOpacity(0.4) : Colors.black),
                      ),
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 214, 181, 255)
                        ),
                        child: Center(
                          child: Text(
                            '${date.day}',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: isWeekend ? Colors.black.withOpacity(0.4) : Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8.0),
        _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Expanded(
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

    final daySchedule = _listItems
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
              const NearestEntryPlaceholder(),
              const ListItemSkeleton(),
            ],
          ),
        );
      },
    );
  }
}