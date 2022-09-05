import 'package:drag_and_drop/model/draggable_list_items.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'drag_drop_event.dart';
part 'drag_drop_state.dart';

class DragDropBloc extends Bloc<DragDropEvent, DragDropState> {
  DragDropBloc() : super(DragDropLoading()) {
    on<LoadItemsEvent>(_onLoadItems);
    on<AddItemEvent>(_onAddItem);
    on<DeleteItemEvent>(_onDeleteItem);
  }

  void _onLoadItems(LoadItemsEvent event, Emitter<DragDropState> emit) {
    emit(
      LoadedState(items: event.items),
    );
  }

  void _onAddItem(AddItemEvent event, Emitter<DragDropState> emit) {
    final state = this.state;

    if (state is LoadedState) {
      emit(
        LoadedState(
          items: List.from(state.items)..add(event.item),
        ),
      );
    }
  }

  void _onDeleteItem(DeleteItemEvent event, Emitter<DragDropState> emit) {
    final state = this.state;

    if (state is LoadedState) {
      emit(
        LoadedState(
          items: List.from(state.items)..removeAt(event.index),
        ),
      );
    }
  }
}
