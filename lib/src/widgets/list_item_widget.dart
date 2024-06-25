import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/list_item_cubit.dart';
import '../cubit/list_item_state.dart';
import '../models/list_item.dart';

class ListItemWidget extends StatelessWidget {
  final ListItem item;

  const ListItemWidget({Key? key, required this.item}) : super(key: key);

  Color _getBackgroundColor(String status) {
    switch (status) {
      case 'active':
        return Color.fromARGB(255, 186, 135, 252);
      case 'inactive':
        return Color.fromARGB(255, 245, 245, 245);
      default:
        return Colors.grey;
    }
  }

   @override
    Widget build(BuildContext context) {
      return BlocProvider(
        create: (context) => ListItemCubit()..loadListItem(item),
        child: BlocBuilder<ListItemCubit, ListItemState>(
          builder: (context, state) {
            if (state is ListItemLoaded) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 12), // Отступ между элементами списка
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16), // Отступы по краям
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color.fromARGB(0, 0, 0, 0), width: 1),
                    color: _getBackgroundColor(state.item.status),
                  ),
                  padding: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(
                      '${state.item.title}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '${state.item.trainer}',
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Text(
                          '${state.item.time}',
                          textAlign: TextAlign.right,
                          //style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      );
    }
  }