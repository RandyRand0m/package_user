// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../cubit/list_item_cubit.dart';
// import '../cubit/list_item_state.dart';
// import '../models/list_item.dart';

// class ListItemWidget extends StatelessWidget {
//   final ListItem item;

//   const ListItemWidget({Key? key, required this.item}) : super(key: key);

//   Color _getBackgroundColor(bool isEnrolled) {
//     return isEnrolled ? Color.fromARGB(255, 186, 135, 252) : Color.fromRGBO(255, 255, 255, 1);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ListItemCubit()..loadListItem(item),
//       child: BlocBuilder<ListItemCubit, ListItemState>(
//         builder: (context, state) {
//           if (state is ListItemLoaded) {
//             return Center(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 6), // Отступ между элементами списка
//                 child: Container(
//                   margin: EdgeInsets.symmetric(horizontal: 16), // Отступы по краям
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: const Color.fromARGB(0, 0, 0, 0), width: 1),
//                     color: _getBackgroundColor(state.item.status),
//                   ),
//                   padding: EdgeInsets.all(8),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Flexible(
//                             child: Text(
//                               state.item.name,
//                               style: const TextStyle(
//                                 fontFamily: 'Roboto',
//                                 fontWeight: FontWeight.w700,
//                                 color: Colors.black,
//                                 fontSize: 22,
//                                 letterSpacing: -0.5,

//                               ),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                             decoration: BoxDecoration(
//                               color: Color.fromARGB(255, 214, 181, 255),
//                               borderRadius: BorderRadius.circular(21),
//                               border: Border.all(color: Color.fromARGB(0, 214, 181, 255), width: 1),
//                             ),
//                             child: Row(
//                               children: [
//                                 Icon(Icons.access_time, color: Colors.black, size: 16),
//                                 SizedBox(width: 4),
//                                 Text(
//                                   '${state.item.timeStart} - ${state.item.endTime}',
//                                   style: const TextStyle(
//                                     fontFamily: 'Roboto',
//                                     fontWeight: FontWeight.w400,
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     letterSpacing: -0.5,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             backgroundImage: NetworkImage(state.item.trainerPhotoUrl),
//                           ),
//                           const SizedBox(width: 12), // Отступ между картинкой и текстом
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 state.item.coachName,
//                                 style: const TextStyle(
//                                     fontFamily: 'Roboto',
//                                     fontWeight: FontWeight.w400,
//                                     color: Colors.black,
//                                     fontSize: 18,
//                                   ),
//                               ),
//                               const Text('ТРЕНЕР',
//                               style: TextStyle(
//                                 fontFamily: 'Roboto',
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.black,
//                                 fontSize: 12,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }
//           return Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/list_item_cubit.dart';
import '../cubit/list_item_state.dart';
import '../models/list_item.dart';

class ListItemWidget extends StatelessWidget {
  final ListItem item;

  const ListItemWidget({Key? key, required this.item}) : super(key: key);

  Color _getBackgroundColor(bool isEnrolled) {
    return isEnrolled ? Color.fromARGB(255, 186, 135, 252) : Color.fromRGBO(255, 255, 255, 1);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListItemCubit()..loadListItem(item),
      child: BlocBuilder<ListItemCubit, ListItemState>(
        builder: (context, state) {
          if (state is ListItemLoaded) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6), // Отступ между элементами списка
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16), // Отступы по краям
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color.fromARGB(0, 0, 0, 0), width: 1),
                    color: _getBackgroundColor(state.item.status),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              state.item.name,
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 22,
                                letterSpacing: -0.5,

                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 214, 181, 255),
                              borderRadius: BorderRadius.circular(21),
                              border: Border.all(color: Color.fromARGB(0, 214, 181, 255), width: 1),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.access_time, color: Colors.black, size: 16),
                                SizedBox(width: 4),
                                Text(
                                  '${state.item.timeStart} - ${state.item.endTime}',
                                  style: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 16,
                                    letterSpacing: -0.5,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(state.item.trainerPhotoUrl),
                          ),
                          const SizedBox(width: 12), // Отступ между картинкой и текстом
                         
                          const SizedBox(width: 12), // Отступ между картинкой и текстом
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.item.coachName,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              const Text(
                                'ТРЕНЕР',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}