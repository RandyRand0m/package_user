// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:package_user/package_user.dart';

// class MyCalendar extends StatefulWidget {
//   final List<ListItem> listItems;

//   const MyCalendar({super.key, required this.listItems});

//   @override
//   _MyCalendarState createState() => _MyCalendarState();
// }

// class _MyCalendarState extends State<MyCalendar> {
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TableCalendar(
//           firstDay: DateTime.utc(2024, 1, 1),
//           lastDay: DateTime.utc(2030, 12, 31),
//           focusedDay: _focusedDay,
//           selectedDayPredicate: (day) {
//             return isSameDay(_selectedDay, day);
//           },
//           onDaySelected: (selectedDay, focusedDay) {
//             setState(() {
//               _selectedDay = DateTime.utc(2024, 1, 1);
//               _focusedDay = focusedDay;
//             });

//             Future.delayed(const Duration(milliseconds: 50), () {
//               setState(() {
//                 _selectedDay = selectedDay;
//               });
//             });
//           },
//           calendarFormat: CalendarFormat.week,
//           startingDayOfWeek: StartingDayOfWeek.monday,
//           headerStyle: const HeaderStyle(
//             formatButtonVisible: false,
//             titleCentered: true,
//           ),
//           calendarStyle: const CalendarStyle(
//             selectedDecoration: BoxDecoration(
//               color: Color.fromARGB(255, 186, 135, 252),
//               shape: BoxShape.circle,
//             ),
//             todayDecoration: BoxDecoration(
//               color: Color.fromRGBO(204, 204, 204, 1),
//               shape: BoxShape.circle,
//             ),
//           ),
//         ),
//         const SizedBox(height: 8.0),
//         Expanded(
//           child: _buildScheduleForSelectedDay(),
//         ),
//       ],
//     );
//   }

//   Widget _buildScheduleForSelectedDay() {
//     if (_selectedDay == null) {
//       return const Center(
//         child: Text('Выберите день для просмотра расписания'),
//       );
//     }

//     final daySchedule = widget.listItems
//         .where((item) => isSameDay(DateTime.parse(item.date), _selectedDay!))
//         .toList();

//     if (daySchedule.isEmpty) {
//       return const Center(
//         child: Text('Нет расписания для выбранного дня'),
//       );
//     }

//     return ListView.builder(
//       itemCount: daySchedule.length,
//       itemBuilder: (context, index) {
//         return BlocProvider(
//           create: (context) => ListItemCubit()..loadListItem(daySchedule[index]),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ListItemWidget(item: daySchedule[index]),
//               NearestEntry(item: daySchedule[index]),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../services/api_service.dart';
// import '../models/list_item.dart';
// import '../widgets/list_item_widget.dart';
// import '../cubit/list_item_cubit.dart';
// import '../widgets/nearest_entry.dart';

// class MyCalendar extends StatefulWidget {
//   final ApiService apiService;

//   const MyCalendar({super.key, required this.apiService});

//   @override
//   _MyCalendarState createState() => _MyCalendarState();
// }

// class _MyCalendarState extends State<MyCalendar> {
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay = DateTime.now();
//   List<ListItem> _listItems = [];
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _fetchListItems();
//   }

//   Future<void> _fetchListItems() async {
//     try {
//       final items = await widget.apiService.fetchListItems();
//       setState(() {
//         _listItems = items;
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       print('Failed to load list items: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TableCalendar(
//           firstDay: DateTime.utc(2024, 1, 1),
//           lastDay: DateTime.utc(2030, 12, 31),
//           focusedDay: _focusedDay,
//           selectedDayPredicate: (day) {
//             return isSameDay(_selectedDay, day);
//           },
//           onDaySelected: (selectedDay, focusedDay) {
//             setState(() {
//               _selectedDay = DateTime.utc(2024, 1, 1);
//               _focusedDay = focusedDay;
//             });

//             Future.delayed(const Duration(milliseconds: 50), () {
//               setState(() {
//                 _selectedDay = selectedDay;
//               });
//             });
//           },
//           calendarFormat: CalendarFormat.week,
//           startingDayOfWeek: StartingDayOfWeek.monday,
//           headerStyle: const HeaderStyle(
//             formatButtonVisible: false,
//             titleCentered: true,
//           ),
//           calendarStyle: const CalendarStyle(
//             selectedDecoration: BoxDecoration(
//               color: Color.fromARGB(255, 186, 135, 252),
//               shape: BoxShape.circle,
//             ),
//             todayDecoration: BoxDecoration(
//               color: Color.fromRGBO(204, 204, 204, 1),
//               shape: BoxShape.circle,
//             ),
//           ),
//         ),
//         const SizedBox(height: 8.0),
//         _isLoading
//             ? Center(child: CircularProgressIndicator())
//             : Expanded(
//                 child: _buildScheduleForSelectedDay(),
//               ),
//       ],
//     );
//   }

//   Widget _buildScheduleForSelectedDay() {
//     if (_selectedDay == null) {
//       return const Center(
//         child: Text('Выберите день для просмотра расписания'),
//       );
//     }

//     final daySchedule = _listItems
//         .where((item) => isSameDay(DateTime.parse(item.date), _selectedDay!))
//         .toList();

//     if (daySchedule.isEmpty) {
//       return const Center(
//         child: Text('Нет расписания для выбранного дня'),
//       );
//     }

//     return ListView.builder(
//       itemCount: daySchedule.length,
//       itemBuilder: (context, index) {
//         return BlocProvider(
//           create: (context) => ListItemCubit()..loadListItem(daySchedule[index]),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ListItemWidget(item: daySchedule[index]),
//               NearestEntry(item: daySchedule[index]),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../services/api_service.dart';
// import '../models/list_item.dart';
// import '../widgets/list_item_widget.dart';
// import '../cubit/list_item_cubit.dart';
// import '../widgets/nearest_entry.dart';

// class MyCalendar extends StatefulWidget {
//   final ApiService apiService;

//   const MyCalendar({super.key, required this.apiService});

//   @override
//   _MyCalendarState createState() => _MyCalendarState();
// }

// class _MyCalendarState extends State<MyCalendar> {
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay = DateTime.now();
//   List<ListItem> _listItems = [];
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _fetchListItems();
//   }

//   Future<void> _fetchListItems() async {
//     try {
//       final items = await widget.apiService.fetchListItems();
//       setState(() {
//         _listItems = items;
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       print('Failed to load list items: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TableCalendar(
//           firstDay: DateTime.utc(2024, 1, 1),
//           lastDay: DateTime.utc(2030, 12, 31),
//           focusedDay: _focusedDay,
//           selectedDayPredicate: (day) {
//             return isSameDay(_selectedDay, day);
//           },
//           onDaySelected: (selectedDay, focusedDay) {
//             setState(() {
//               _selectedDay = DateTime.utc(2024, 1, 1);
//               _focusedDay = focusedDay;
//             });

//             Future.delayed(const Duration(milliseconds: 50), () {
//               setState(() {
//                 _selectedDay = selectedDay;
//               });
//             });
//           },
//           calendarFormat: CalendarFormat.week,
//           startingDayOfWeek: StartingDayOfWeek.monday,
//           headerStyle: const HeaderStyle(
//             formatButtonVisible: false,
//             titleCentered: true,
//           ),
//           calendarStyle: const CalendarStyle(
//             selectedDecoration: BoxDecoration(
//               color: Color.fromARGB(255, 186, 135, 252),
//               shape: BoxShape.circle,
//             ),
//             todayDecoration: BoxDecoration(
//               color: Color.fromRGBO(204, 204, 204, 1),
//               shape: BoxShape.circle,
//             ),
//           ),
//         ),
//         const SizedBox(height: 8.0),
//         _isLoading
//             ? const Center(child: CircularProgressIndicator())
//             : Expanded(
//                 child: _buildScheduleForSelectedDay(),
//               ),
//       ],
//     );
//   }

//   Widget _buildScheduleForSelectedDay() {
//     if (_selectedDay == null) {
//       return const Center(
//         child: Text('Выберите день для просмотра расписания'),
//       );
//     }

//     final daySchedule = _listItems
//         .where((item) => isSameDay(DateTime.parse(item.date), _selectedDay!))
//         .toList();

//     if (daySchedule.isEmpty) {
//       return const Center(
//         child: Text('Нет расписания для выбранного дня'),
//       );
//     }

//     return ListView.builder(
//       itemCount: daySchedule.length,
//       itemBuilder: (context, index) {
//         return BlocProvider(
//           create: (context) => ListItemCubit()..loadListItem(daySchedule[index]),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ListItemWidget(item: daySchedule[index]),
//               NearestEntry(item: daySchedule[index]),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/api_service.dart';
import '../models/list_item.dart';
import '../widgets/list_item_widget.dart';
import '../cubit/list_item_cubit.dart';
import '../widgets/nearest_entry.dart';

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
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, date, _) {
              bool isWeekend = date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
              return Container(
                
                alignment: Alignment.center,
                width: 41, // фиксированная ширина
                height: 67, // фиксированная высота
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 218, 208, 227),
                  
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        
                      ),
                      child: Center(
                        child: Text(
                          '${date.day}',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: isWeekend ? Colors.black.withOpacity(0.4) : Colors.black),
                        ),
                      ),
                    ),
                    Text(
                      '${_getRussianWeekday(date.weekday)}',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: isWeekend ? Colors.black.withOpacity(0.4) : Colors.black),
                    ),
                  ],
                ),
              );
            },
            todayBuilder: (context, date, _) {
              bool isWeekend = date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
              return Container(
                
                alignment: Alignment.center,
                width: 41, // фиксированная ширина
                height: 67, // фиксированная высота
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 218, 208, 227),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        
                      ),
                      child: Center(
                        child: Text(
                          '${date.day}',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: isWeekend ? Colors.black.withOpacity(0.4) : Colors.black),
                        ),
                      ),
                    ),
                    Text(
                      '${_getRussianWeekday(date.weekday)}',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: isWeekend ? Colors.black.withOpacity(0.4) : Colors.black),
                    ),
                  ],
                ),
              );
            },
            selectedBuilder: (context, date, _) {
              bool isWeekend = date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
              return Container(
                alignment: Alignment.center,
                width: 41, // фиксированная ширина
                height: 67, // фиксированная высота
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 186, 135, 252),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 214, 181, 255),
                        shape: BoxShape.circle,
                      
                      ),
                      child: Center(
                        child: Text(
                          '${date.day}',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: isWeekend ? Colors.black.withOpacity(1.0) : Colors.black),
                        ),
                      ),
                    ),
                    Text(
                      '${_getRussianWeekday(date.weekday)}',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: isWeekend ? Colors.black.withOpacity(0.4) : Colors.black),
                    ),
                  ],
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
            ],
          ),
        );
      },
    );
  }
}