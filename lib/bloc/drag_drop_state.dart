part of 'drag_drop_bloc.dart';

abstract class DragDropState extends Equatable {
  const DragDropState();

  get items => null;
}

class DragDropLoading extends DragDropState {
  @override
  List<Object> get props => [];
}

class LoadedState extends DragDropState {
  @override
  final List items;

  const LoadedState({this.items = const []});

  @override
  List<Object?> get props => [items];
}
