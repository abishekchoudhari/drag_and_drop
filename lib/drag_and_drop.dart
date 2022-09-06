library drag_and_drop;

import 'package:drag_and_drop/constants/constants.dart';
import 'package:drag_and_drop/model/draggable_list_items.dart';
import 'package:drag_and_drop/ui/dragged_target_list.dart';
import 'package:drag_and_drop/ui/generate_row_list.dart';
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
              child: DraggedTargetList(state: state),
            );
          } else {
            return Text(errorMsg);
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
      child: GenerateRowList(items: items),
    );
  }
}
