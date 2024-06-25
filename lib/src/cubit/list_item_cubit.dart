import 'package:bloc/bloc.dart';
import '../models/list_item.dart';
import 'list_item_state.dart';

class ListItemCubit extends Cubit<ListItemState> {
  ListItemCubit() : super(ListItemInitial());

  void loadListItem(ListItem item) {
    emit(ListItemLoaded(item));
  }
}