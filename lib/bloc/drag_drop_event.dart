part of 'drag_drop_bloc.dart';

abstract class DragDropEvent extends Equatable {
  const DragDropEvent();
}

class LoadItemsEvent extends DragDropEvent {
  final List<DraggableListItems> items;

  const LoadItemsEvent({this.items = const <DraggableListItems>[]});
  @override
  List<Object?> get props => [items];
}

class AddItemEvent extends DragDropEvent {
  final String item;

  const AddItemEvent({required this.item});
  @override
  List<Object?> get props => [item];
}

class DeleteItemEvent extends DragDropEvent {
  final int index;

  const DeleteItemEvent({required this.index});

  @override
  List<Object?> get props => [];
}
