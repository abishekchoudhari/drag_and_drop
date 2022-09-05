library drag_and_drop;

import 'package:drag_and_drop/model/draggable_list_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/drag_drop_bloc.dart';

/// A DragAndDrop.
class DragAndDrop {
  BuildContext context;

  DragAndDrop({required this.context});

  Widget generateDragTargetList() {
    return BlocProvider(
      create: (context) => DragDropBloc()..add(const LoadItemsEvent()),
      child: BlocBuilder<DragDropBloc, DragDropState>(
        builder: (context, state) {
          if (state is DragDropLoading) {
            return const CircularProgressIndicator();
          }
          if (state is LoadedState) {
            return BlocListener<DragDropBloc, DragDropState>(
              listener: (context, state) {},
              child: DragTarget<String>(
                onAccept: (value) {
                  if (!state.items.contains(value)) {
                    context.read<DragDropBloc>().add(
                          AddItemEvent(item: value),
                        );
                  }
                },
                builder: (_, candidateData, rejectedData) {
                  return SingleChildScrollView(
                    controller: ScrollController(),
                    child: Wrap(
                      children: List.generate(
                        state.items.length,
                        (index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 3.0, right: 3.0),
                            child: InputChip(
                              label: Text(state.items[index]),
                              onDeleted: () {
                                context.read<DragDropBloc>().add(
                                      DeleteItemEvent(index: index),
                                    );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }

  Widget generateList({required List<DraggableListItems> items}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: ScrollController(),
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 25.0),
            child: Wrap(
              spacing: 5.0,
              children: List.generate(
                items.length,
                (index) {
                  return Draggable<String>(
                    data: items[index].item,
                    feedback: Opacity(
                      opacity: 0.4,
                      child: Text(items[index].item),
                    ),
                    child: FilterChip(
                      label: Text(items[index].item),
                      onSelected: (val) {},
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
