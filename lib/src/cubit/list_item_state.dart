import 'package:equatable/equatable.dart';
import '../models/list_item.dart';

abstract class ListItemState extends Equatable {
  const ListItemState();

  @override
  List<Object> get props => [];
}

class ListItemInitial extends ListItemState {}

class ListItemLoaded extends ListItemState {
  final ListItem item;
  const ListItemLoaded(this.item);
  @override
  List<Object> get props => [item];
}